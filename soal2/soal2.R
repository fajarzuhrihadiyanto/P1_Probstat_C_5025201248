library(dplyr)
library(ggplot2)

n <- 20
p <- 0.2

# 2.a
x <- 4
P_X <- dbinom(x, n, p)
print(P_X)

# 2.b
x <- 0:n
X <- 4
y <- dbinom(x=x, size=n, prob=p)
data.frame(x = x, prob = y) %>%
mutate(Patient = ifelse(x == X, X, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill=Patient)) +
geom_col() +
geom_text(
  aes(label = round(prob,2), y = prob + 0.01),
  position = position_dodge(0.9),
  size = 3,
  vjust = 0
) +
labs(title = "Probability of X = 4 Patient recover",
     subtitle = "Binomial (0.2)",
     x = "Number of patient recover (x)",
     y = "Probability")

# 2.c
data_mean <- n*p
print(data_mean)

data_variance <- n*p*(1-p)
print(data_variance)