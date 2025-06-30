
# 1.1 Basic arithmetic 
2 + 2
7 * 5




# 1.2 Assigning values to objects
a <- 4
b <- 7
z  <- a + b
z




# 1.3 Number journey 
a <- 7 
b <- 52 
x <- a * b 
x




# 2.1 Numeric, string and Boolean data types
a <- 7			
s <- "s is a terrible name for an object"
b <- TRUE

class(a)
class(s)




# 3.1 Functions 
sqrt(49)			
tolower("DATA is AWESOME!")




# 3.2 To get help information about a function or data set
? sqrt




# 4.1 Comments
# One can add comments to your code to describe what you are doing
sqrt(49)    # this takes the square root of 49




# 5.1 Vectors are ordered sequences of numbers or letters
# The c() function is used to create vectors

v  <-  c(5, 232, 5, 543)	
s  <-  c("statistics", "data", "science", "fun")		




# 5.2 One can access elements of a vector using square brackets []
s[4]         # what will the answer be?    




# 5.3 One can assign a sequence of numbers to a vector
z <- 2:10
z[3]	




# 5.4 One can also apply functions to vectors
sqrt(z)
sum(z)
which.max(z)




# What is the index of the maximum value in the vector v?
which.max(v)  # what will the answer be?




# 5.5 We can add (or subtract) two vectors of the same length
v1 <- c(2, 4, 8)
v2 <- c(1, 2, 3)
v1 + v2




