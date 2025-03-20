#############################
# Project: R-Team meeting 01
# Purpose: Sample code for meeting one
# Author: Yevhen
# No external data files used
#############################
# Create an object with number of states with legal medical marijuana in 2017
states <- 29
kIllegalNum <- as.integer(21)
kStates <- states
# Rhode Island limit for medical marijuana in ounces per person
kOuncesRhode <- 2.5

rm(states)

# print the value
states

# determine how many states there would be if 2 more passed this policy
2 + states
kIllegalNum - 2

class(kIllegalNum)
class(kOuncesRhode)

# logical data type
kLogical <- TRUE
kLogical02 <- 6 > 4

# character data type
kChar01 <- "Some text in quotes"
kChar02 <- "1234121234"

# vector data type
char.vector <- c('Oregon', 'Vermont', 'Maine')
nums.1.to.4 <- c(1, 2, 3, 4)
logic.vector <- c(TRUE, FALSE, TRUE, TRUE)

# operations with vectors
nums.1.to.4 + 3
nums.1.to.4 + c(1,2,3,4)
nums.1.to.4 * 5

# matrix
(policies <- matrix(data <- c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE))

dimnames(x = policies) <- list(
  c("2013","2014"),
  c("medical","recreational","both")
)

# data frames
state <- c("Alaska", "Arizona", "Arkansas", "California", "Colorado")
year <- c('1998', '2010', '2016', '1996', '2000')
ounce.lim <- c(1, 2.5, 3, 8, 2)

pot.legal <- data.frame(state, year, ounce.lim)
