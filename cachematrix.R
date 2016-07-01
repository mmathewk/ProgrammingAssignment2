## Put comments here that give an overall description of what your
## functions do

## This file contains mychanges to Programming Assignment 2 for the R 
## Programming course on coursera - Part of the Datascience specialization
## from Johns Hopkins
## The programming assignment is meant to address MAtrix Inversion
## Since Matrix inversion is usually a costly computation, there may be some 
## benefit to caching the inverse of a matrix rather than computing it 
## repeatedly 
## The fucntions here work to enable the caching of the inverse of a matrix
## and help you access them as requried


## Write a short comment describing this function

## the makeCacheMatrix creates a "special matrix" which is a list (of functions)
## with lexically scoped variables that will
##  - set the value of the matrix
##  - get the value of the matrix
##  - set the value of the inverse
##  - get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    ## initialize the inverse matrix
    minverse <- NULL
    ## set the matrix value for retrieval 
    set <- function(y) {
        x <<- y
        ## if we are setting a new matrix, the inverse is null
        minverse <<- NULL 
    }
    ## Function to access the original matrix
    get <- function() x
    
    ## Function that allows outside functions to set the inverse after 
    ## calculating - note: we do not check to see if it a real inverse
    ## Perhaps the actual calc and setting shoud be done together here...
    setinverse <- function(inv) minverse <<- inv
    ## Function to access the inverse matrix stored here
    getinverse <- function() minverse
    ## The last statement returns list of functions giving access to the 
    ## variables here
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

## cacheSolve: 
## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then cacheSolve will  
## retrieve the inverse from the cache.
## The funtion uses the solve function in R to get the inverse of the supplied
## matrix
## The function assume that the input is always a square invertible matrix and 
## the results are not predictable for non-invertible matrices
##

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
}
