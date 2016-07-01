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
    minverse <- NULL
    set <- function(y) {
        x <<- y
        minverse <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) minverse <<- inv
    getinverse <- function() minverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
