#' @title myddt
#'
#' @param df The dataframe to be manipulated (Only works for DDT)
#' @param SPECIES The species of fish from DDT to be plotted
#'
#' @return A plot of length vs weight of the given species and a list of the original data, the modified data, and the relative frequency of rivers
#' @export
#'
#' @examples
#' \dontrun{myddt(df = ddt, SPECIES = "CCATFISH")}
myddt <- function(df, SPECIES){
  df2 <- df %>% filter(SPECIES == {{SPECIES}})
  g <- ggplot(df2, aes(x=WEIGHT,y=LENGTH)) +
    geom_point(aes(color = RIVER)) +
    geom_smooth(formula = y~x +I(x^2), method = "lm") +
    ggtitle("Brandon Michaud")
  print(g)
  filename = paste0("LvsWfor",SPECIES,".csv")
  write.csv(df2, filename)
  reltable = table(df$RIVER)/length(df$RIVER)
  list(Original = df, Subsetted = df2, RiverFrequency = reltable)
}
