x <- 2
v <- 10

# 4.a
P_X <- dchisq(x, v)
print(P_X)

# 4.b
set.seed(0)
x <- 1:100
y <- rchisq(x, 10)

hist(y)

# 4.c
data_mean <- v
print(data_mean)

data_variance <- 2*v
print(data_variance)