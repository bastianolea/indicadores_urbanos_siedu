siedu_cargar <- function(ruta, hoja) {
  readxl::read_excel(ruta, sheet = hoja, .name_repair = "unique_quiet")
}

siedu_limpiar <- function(data, año = 1990) {
  # data <- siedu_2022
  # año <- 2022
  
  # metadatos presentes en las primeras filas de las tablas
  # que contienen el id de cada indicador, el estándar CNDT, y la medida en que viene la variable
  suppressWarnings({
    metadatos_0 <- data |>
      row_to_names(10) |> 
      select(-1:-6)
  })
  
  metadatos_1 <- metadatos_0 |> 
    slice(1:3) |> 
    pivot_longer(cols = starts_with("BPU_") | starts_with("DE_") | starts_with("EA_") | starts_with("IS_") | starts_with("IP_") | starts_with("IG_"),
                 names_to = "id", values_to = "valor") |> 
    rename(tipo = 1) |> 
    mutate(tipo = recode(tipo, "CUT" = "ETIQUETA"))
  
  # separar las columnas en objetos
  estandar <- metadatos_1 |> filter(str_detect(tipo, "EST.*CNDT"))
  id_indicador <- metadatos_1 |> filter(str_detect(tipo, "ETIQUETA"))
  medida <- metadatos_1 |> filter(str_detect(tipo, "MEDI"))
  
  # extraer tabla de datos
  siedu <- data |>
    row_to_names(13) |> 
    select(-c(1:5)) |>
    rename(comuna = Comuna,
           cut_comuna = CUT)
  
  # sólo  dejar filas con datos válidos para comunas
  siedu_2 <- siedu |> 
    filter(str_detect(cut_comuna, "\\d+"))
  
  # pivotar tabla para dejar todas las variables en una misma columna, y su cifra en otra
  siedu_3 <- siedu_2 |> 
    pivot_longer(cols = 3:length(siedu_2), names_to = "variable", values_to = "cifra")
  
  # extraer categorías de respuesta no numéricas, para filtrarlas
  valores_no_numericos <- siedu_3$cifra |> str_subset("\\d+", negate = T) |> unique()
  
  # filtrar valores no numéricos
  siedu_4 <- siedu_3 |> 
    # corregir cifras para sacar textos y dejar solo numeros
    mutate(cifra = ifelse(cifra %in% valores_no_numericos, NA, cifra)) |> 
    mutate(cifra = as.numeric(cifra)) |> 
    # sacar cifras sin valores
    filter(!is.na(cifra))
  
  # agregar columna de id de variables
  siedu_5 <- siedu_4 |> 
    left_join(id_indicador |> select(-tipo), 
              by = join_by(variable == valor)) |> 
    relocate(id, .before = variable)
  
  # agregar columna de medida
  siedu_6 <- siedu_5 |> 
    left_join(medida |> select(id, medida = valor), 
              by = join_by(id))
  
  # agregar columna de estándar
  siedu_7 <- siedu_6 |> 
    left_join(estandar |> select(id, estandar = valor), 
              by = join_by(id))
  
  # corregir nombres de variables
  siedu_8 <- siedu_7 |> 
    mutate(variable = str_remove(variable, "\\.$"),
           variable = str_trim(variable))
  
  # ordenar
  siedu_9 <- siedu_8 |> 
    arrange(variable, comuna) |> 
    mutate(año = año) |> 
    relocate(año, .before = variable)
  
  return(siedu_9)
}
