library(dplyr)
library(ggplot2)

lambda <- 4.5

# 3.a
x <- 6
p_x <- dpois(x, lambda)
print(p_x)

# 3.b
set.seed(0)
data <- rpois(365, lambda)
sim_p_x <- mean(data == 6)
print(sim_p_x)

x <- 1:15
X <- 6
y <- dpois(x, lambda)
data.frame(x = x, prob = y) %>%
mutate(Birth = ifelse(x == X, X, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill=Birth)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge(0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Probability of X = 6 Baby birth",
     subtitle = "Poisson (lambda = 4.5)",
     x = "Number of Birth",
     y = "Probability")

# 3.d
data_mean <- lambda
print(data_mean)

data_variance <- lambda
print(data_variance)
