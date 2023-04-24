basecarros <- cars
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}
distanciacarros <- basecarros$dist
centralizacao(basecarros$dist)
centralizacaoteste <- centralizacao(basecarros$dist)
hist(distanciacarros)
hist(centralizacaoteste)

