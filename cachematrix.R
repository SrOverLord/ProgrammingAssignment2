# This pair of functions are used to create a special object that stores a numeric vector and cache's its mean

# The first function is used to create a vector with four parameters
# set and get of the vector and the mean
makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

# The second function calculates the average of the vector,
# verifies if the average has already been calculated
# if it is obtained the average of the cache
# if it does not calculate the average of the data and the average in the cache memory.

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

#Checking the program
#We enter in the first function a vector
#with values from 1 to 5 and save it in a variable x
# x <- makeVector(c(1,2,3,4,5))
#and finally we enter the value of x to the second function
# cachemean(x)
#the result will be the average of our vector
#[1] 3
#



