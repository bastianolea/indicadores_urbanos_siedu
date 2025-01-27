siedu <- arrow::read_parquet("datos/siedu_indicadores_desarrollo_urbano.parquet")

# variables existentes y el año en que se midieron
tabla_variables <- siedu |> 
  select(id, variable, medida, año) |> 
  # mutate(variable = str_wrap(variable, 70)) |> 
  arrange() |> 
  distinct()

tabla_variables

# generar tabla para readme
knitr::kable(tabla_variables, escape = TRUE, format = "markdown")
