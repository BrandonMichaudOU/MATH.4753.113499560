#' @title Read in data
#'
#' @param csv The file to be read in
#'
#' @return A data frame object
#' @export
#'
#' @examples
#' \dontrun{mpg.df=myread("EPAGAS.csv")}
myread=function(csv){
  fl=paste(dird,csv,sep="")
  read.table(fl,header=TRUE,sep=",")
}
