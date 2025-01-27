# Sistema de Indicadores y Estándares de Desarrollo Urbano

library(tidyverse)
library(readxl)
library(janitor)

source("funciones.R")
  
# el archivo funciona con macros, pero internamente son hojas
matriz_siedu = "datos/datos_originales/matriz-siedu-publicacion.xlsm"

# cargar todos los datos, un objeto por hoja
siedu_2018 <- siedu_cargar(matriz_siedu, 2)
siedu_2019 <- siedu_cargar(matriz_siedu, 3)
siedu_2020 <- siedu_cargar(matriz_siedu, 4)
siedu_2021 <- siedu_cargar(matriz_siedu, 5)
siedu_2022 <- siedu_cargar(matriz_siedu, 6)

# limpiar todas las hojas cargadas
siedu_2018_2 <- siedu_limpiar(siedu_2018, 2018)
siedu_2019_2 <- siedu_limpiar(siedu_2019, 2019)
siedu_2020_2 <- siedu_limpiar(siedu_2020, 2020)
siedu_2021_2 <- siedu_limpiar(siedu_2021, 2021)
siedu_2022_2 <- siedu_limpiar(siedu_2022, 2022)

# unir todos los datos existentes en un solo dataframe
siedu <- bind_rows(siedu_2018_2,
                   siedu_2019_2,
                   siedu_2020_2,
                   siedu_2021_2,
                   siedu_2022_2)

# datos de todas las variables disponibles, del año mas reciente que se tenga
siedu_2 <- siedu |> 
  arrange(comuna, variable, desc(año)) |> 
  group_by(comuna, variable) |> 
  slice_max(año) |> 
  ungroup()


# guardar ----
readr::write_csv2(siedu_2, "datos/siedu_indicadores_desarrollo_urbano.csv")
arrow::write_parquet(siedu_2, "datos/siedu_indicadores_desarrollo_urbano.parquet")
