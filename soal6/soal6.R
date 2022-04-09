n <- 100
d_mean <- 50
d_sd <- 8

set.seed(1)
data <- rnorm(n, mean = d_mean, sd = d_sd)

# 6.a
data_mean <- mean(data)
data_sd <- sd(data)
x1 <- floor(data_mean)
x2 <- ceiling(data_mean)
P_X <- pnorm(x2, mean = data_mean, sd = data_sd, lower.tail = TRUE) -
  pnorm(x1, mean = data_mean, sd = data_sd, lower.tail = TRUE)
print(P_X)

z_score <- (data - data_mean) / data_sd
print(z_score)

plot(data, dnorm(data, data_mean, data_sd))

# 6.b
hist(data, breaks=50)

# c
data_variance <- var(data)
print(data_variance)

