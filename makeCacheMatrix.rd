\name{makeCachematrix}
\alias{makeCacheMatrix}
\title{
makeCacheMatrix
}
\description{
This function creates a cached environment to store a matrix, its inverse, and helper functions for setting/getting, used in conjunction with \code{\link{cacheSolve}}.
}
\usage{
makeCacheMatrix(x = matrix())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A matrix to be cached, and later inverted.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A set of helper functions for consumption by \code{\link{cacheSolve}}
}
\references{
Via Johns Hopkins on Coursera: \emph{R Programming course} \href{https://class.coursera.org/rprog-035/human_grading/view/courses/975109/assessments/3/submissions}{\strong{#reprog-035}}

}
\author{
Tom Mathews
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{cacheSolve}}
}
\examples{
## First, create the matrix cache:
q<-makeCacheMatrix(matrix(c(0,1,2,0),nrow=2))

## Then call the first time, normal executino time
cacheSolve(q)
     [,1] [,2]
[1,]  0.0    1
[2,]  0.5    0
> 
> # Finally, call a second time.
> # 'getting cached data' should be printed!
> cacheSolve(q)
getting cached data
     [,1] [,2]
[1,]  0.0    1
[2,]  0.5    0
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~matrix }
\keyword{ ~cacheMatrix }
\keyword{ ~makeCacheMatrix }
\keyword{ ~cacheSolve }
\keyword{ ~cache }% __ONLY ONE__ keyword per line
