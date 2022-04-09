lambda <- 3
set.seed(1)
x <- rexp(1, rate = lambda)

# a
P_X <- dexp(x, rate = lambda)
print(P_X)

# b
set.seed(1)
hist(rexp(10, rate=lambda))

set.seed(1)
hist(rexp(100, rate=lambda))

set.seed(1)
hist(rexp(1000, rate=lambda))

set.seed(1)
hist(rexp(10000, rate=lambda))

# c
data_mean <- 1/lambda
print(data_mean)

data_variance <- 1/(lambda^2)
print(data_variance)