library(tidyverse)

siedu <- arrow::read_parquet("datos/siedu_indicadores_desarrollo_urbano.parquet")

siedu |> 
  filter(comuna == "LA FLORIDA") |> 
  filter(id == sample(siedu$id, 1))
