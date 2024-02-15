library("patchwork")
library("tidyverse")

# 4.13
## a
x <- seq(0,1,0.01)
y <- c( rep(0, 50), rep(2, 51))
df <- data.frame(x,y)

df |>
  ggplot(aes(x,y)) +
  geom_point() +
  labs(title = "U(0.5, 1) prior", caption = "SML 320") +
  theme_minimal()

## b
x <- seq(0,1,0.01)
y <- (1-x)^3 #decided not to use "100" here for the exponent
y[0:50] <- 0
df <- data.frame(x,y)

df |>
  ggplot(aes(x,y)) +
  geom_point() +
  labs(title = "U(0.5, 1) prior", caption = "SML 320") +
  theme_minimal()

# 4.17
## a
bayesrules::plot_beta(4,3) +
  labs(title = "Beta(4,3) Prior",
       caption = "SML 320") +
  theme_minimal()

## b
p1 <- bayesrules::plot_beta_binomial(4,3,0,1) +
  labs(title = "Employee 1", subtitle = "y = 0, n = 1") +
  theme_minimal() + theme(legend.position = "none")
p2 <- bayesrules::plot_beta_binomial(4,3,3,10) +
  labs(title = "Employee 2", subtitle = "y = 3, n = 10") +
  theme_minimal() + theme(legend.position = "none")
p3 <- bayesrules::plot_beta_binomial(4,3,20,100) +
  labs(title = "Employee 3", subtitle = "y = 20, n = 100") +
  theme_minimal()
p1 + p2 + p3




# 4.18
##b
p1 <- bayesrules::plot_beta_binomial(4,3,0,1) +
  labs(title = "Employee 1", subtitle = "y = 0, n = 1") +
  theme_minimal() + theme(legend.position = "none")
p2 <- bayesrules::plot_beta_binomial(4,4,3,10) +
  labs(title = "Employee 2", subtitle = "y = 3, n = 10") +
  theme_minimal() + theme(legend.position = "none")
p3 <- bayesrules::plot_beta_binomial(7,11,20,100) +
  labs(title = "Employee 3", subtitle = "y = 20, n = 100") +
  theme_minimal()+ theme(legend.position = "bottom")
p1 / p2 / p3