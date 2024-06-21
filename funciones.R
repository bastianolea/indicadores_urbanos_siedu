limpiar_siedu <- function(data, año = 1990) {
  
  siedu <- data |>
    row_to_names(13) |> 
    select(-c(1:5)) |>
    rename(comuna = Comuna,
           cut_comuna = CUT)
  
  # names(siedu)
  
  siedu_2 <- siedu |> 
    # mutate(across(3:length(siedu), ~na_if(.x, "Sin medición"))) |> 
    # mutate(across(3:length(siedu), ~na_if(.x, "S/I"))) |> 
    #   # clean_names() |> 
    #   remove_empty(which = "cols") |> 
    filter(str_detect(cut_comuna, "\\d+"))
  
  
  siedu_3 <- siedu_2 |> 
    pivot_longer(cols = 3:length(siedu_2), names_to = "variable", values_to = "cifra")
  
  valores_no_numericos <- siedu_3$cifra |> str_subset("\\d+", negate = T) |> unique()
  
  siedu_4 <- siedu_3 |> 
    # corregir cifras para sacar textos y dejar solo numeros
    mutate(cifra = ifelse(cifra %in% valores_no_numericos, NA, cifra)) |> 
    mutate(cifra = as.numeric(cifra)) |> 
    # corregir nombres de variables
    mutate(variable = str_remove(variable, "\\.$"),
           variable = str_trim(variable)) |> 
    # sacar cifras sin valores
    filter(!is.na(cifra)) |>
    # ordenar
    arrange(variable, comuna) |> 
    mutate(año = año) |> 
    relocate(año, .before = variable)
  
  return(siedu_4)
}
