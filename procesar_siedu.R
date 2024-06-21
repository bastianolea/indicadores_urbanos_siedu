# Sistema de Indicadores y Estándares de Desarrollo Urbano

library(tidyverse)
library(readxl)
library(janitor)

source("funciones.R")
  
# el archivo funciona con macros, pero internamente son hojas
matriz_siedu = "datos_originales/matriz-siedu-publicacion.xlsm"

# cargar todos los datos, un objeto por hoja
siedu_2018 <- readxl::read_excel(matriz_siedu, sheet = 2)
siedu_2019 <- readxl::read_excel(matriz_siedu, sheet = 3)
siedu_2020 <- readxl::read_excel(matriz_siedu, sheet = 4)
siedu_2021 <- readxl::read_excel(matriz_siedu, sheet = 5)
siedu_2022 <- readxl::read_excel(matriz_siedu, sheet = 6)

# limpiar todas las hojas cargadas
siedu_2018_2 <- limpiar_siedu(siedu_2018, 2018)
siedu_2019_2 <- limpiar_siedu(siedu_2019, 2019)
siedu_2020_2 <- limpiar_siedu(siedu_2020, 2020)
siedu_2021_2 <- limpiar_siedu(siedu_2021, 2021)
siedu_2022_2 <- limpiar_siedu(siedu_2022, 2022)

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

# variables existentes y el año en que se midieron
tabla_variables <- siedu_2 |> 
  select(variable, año) |> 
  arrange() |> 
  distinct()

tabla_variables |> print(n = Inf)

# tabla_variables |> 
#   mutate(fuente = paste0("Sistema de Indicadores y Estándares de Desarrollo Urbano. Consejo Nacional de Desarrollo Urbano (CNDU) y el Instituto Nacional de Estadísticas (INE)", " (", año, ")")
# ) |> 
#   select(fuente) |> 
#   View()

knitr::kable(tabla_variables, format = "markdown")

# guardar ----
write.csv2(siedu_2, "datos_procesados/indicadores_desarrollo_urbano_siedu.csv")
