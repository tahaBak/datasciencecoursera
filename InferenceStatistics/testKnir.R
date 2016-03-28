From ISLR: Chapter 3, Problem 14.

Using a created simulated data, answer the questions regarding simple
linear regression.

<<>>=
  # Ensure consistent values
  set.seed(1)

# Create uniform distribution for first input
x1 <- runif(100)

# Normal distribution for second input
x2 <- 0.5 * x1 + rnorm(100) / 10

# Our Linear Model
y <- 2 + (2 * x1) + (.3 * x2) + rnorm(100)
@
  
  \part

Write out the form of the linear model. What are the regression
coefficients?