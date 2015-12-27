## makeCacheMatrix creates a cached environment to store
## the matrix, its inverse, and functions for setting/getting
## Used in conjunction with cacheSolve.
makeCacheMatrix <- function(x = matrix()) {
        # Initialize imatrix in an outside scope
        imatrix <- NULL
        
        # Create the generic settor that accesses an alternate environment
        set <- function(y) {
                x <<- y
                imatrix <<- NULL
        }
        
        # Generic gettor.
        get <- function() x
        
        # Generic set/get for the inverse matrix.
        setmatrixinv <- function(matrix.inv) imatrix <<- matrix.inv
        getmatrixinv <- function() imatrix
        
        #Return a list of functions for working with the cache
        return(list(set = set, get = get,
             setmatrixinv = setmatrixinv,
             getmatrixinv = getmatrixinv))
}


## Given an environment from makeCacheMatrix, 
## solve the matrix and cache the results.
## NOTE: This assignment assumes the provided matrix is always invertable.
cacheSolve <- function(x, ...) {
        
        # Return the cached solved matrix,
        # if available
        m <- x$getmatrixinv()
        
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        
        # Otherwise, retrieve the original matrix
        # Then solve, cache, and return
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrixinv(m)
        return(m)
}


#Example Execution

# First, create the matrix cache:
q<-makeCacheMatrix(matrix(c(0,1,2,0),nrow=2))

# Then call the first time, normal executino time
cacheSolve(q)

# Finally, call a second time.
# 'getting cached data' should be printed!
cacheSolve(q)

# INPUT:
#       [,1] [,2]
# [1,]  0.0    1
# [2,]  2.0    0
#
# EXPECTED OUTPUT:
#       [,1] [,2]
# [1,]  0.0    1
# [2,]  0.5    0

