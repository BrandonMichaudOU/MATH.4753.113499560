#' @title myncurve
#'
#' @param mu The mean of the normal distribution
#' @param sigma The standard deviation of the normal distribution
#' @param a The right bound of the probability to shaded and calculate (Left bound is -infinity)
#'
#' @return A graph of the normal distribution with the specified probability shaded
#' @export
#'
#' @examples
#' \dontrun{myncurve(5,2,4)}
myncurve = function(mu, sigma, a) {
  curve(dnorm(x,mean=mu,sd=sigma), xlim = c(mu - 3 * sigma,    mu + 3 * sigma))
  xcurve=seq(mu - 3 * sigma,a,length=1000)
  ycurve=dnorm(xcurve,mean=mu,sd=sigma)
  polygon(c(mu - 3 * sigma,xcurve,a),c(0,ycurve,0),col="Red")
  area = pnorm(a, mu, sigma)
  area = round(area, 4)
  list(Area = area)
}
