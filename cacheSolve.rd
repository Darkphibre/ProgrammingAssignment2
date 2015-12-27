\name{cacheSolve}
\alias{cacheSolve}
\title{
cacheSolve
}
\description{
This generic function takes a the cached matrix created by \code{\link{makeCacheMatrix}}, and solves for the matrix if necessary. If it has already been solved, the cached answer will be retrieved and provided.
}
\usage{
solve(x, b, tol, LINPACK, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a square numeric or complex matrix containing the coefficients of the linear system. Logical matrices are coerced to numeric.}
\item{b}{a numeric or complex vector or matrix giving the right-hand side(s) of the linear system. If missing, b is taken to be an identity matrix and solve will return the inverse of x.}
\item{tol}{the tolerance for detecting linear dependencies in the columns of x. The default is .Machine$double.eps. Not currently used with complex matrices x.}
\item{LINPACK}{logical. Defunct and ignored.}
\item{...}{further arguments passed to or from other methods}
}
\details{
Internally, \code{\link{solve}} is called, with the one nuance that x replaces a. Don't ask me why. :)
}
\value{
The solution n for x \%*\% n = b
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
q<-cacheSolve(matrix(c(0,1,2,0),nrow=2))

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
\keyword{ ~makeCacheMatrix }
\keyword{ ~cachematrix }
\keyword{ ~cacheSolve }
\keyword{ ~cache }% __ONLY ONE__ keyword per line
