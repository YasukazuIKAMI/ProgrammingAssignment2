## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
set the value of the matrix
get the value of the matrix
set the inverse of the matrix
get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function
The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse of the matrix from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the inverse of the matrix in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)){
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
