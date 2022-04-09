library(dplyr)
library(ggplot2)

# 1.a
p <- 0.2
x <- 3

P_X <- dgeom(x, prob = p)
print(P_X)

# 1.b
set.seed(0)
n <- 10000
data <- rgeom(n, prob = p)
sim_P_X <- mean(data == 3)
print(sim_P_X)

# 1.d
X <- 3
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
mutate(Failures = ifelse(x == X, X, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge( 0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Probability of X = 3 Failures Prior to First Success",
     subtitle = "Geometric(0.2)",
     x = "Failures prior to first success (x)",
     y = "Probability")

# 1.e
data_mean <- (1-p)/p
print(data_mean)

data_variance <- (1 - p)/p^2
print(data_variance)