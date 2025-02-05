library(tidyverse)
library(textclean)

siedu <- arrow::read_parquet("datos/siedu_indicadores_desarrollo_urbano.parquet")

unique(siedu$variable)

# filtrar variables
siedu |> 
  filter(id %in% c())


variables_crudo <- c("Distancia a plazas públicas.",
                     "Superficie de plazas públicas por habitante que cumple estándar de distancia (400 metros).",
                     "Distancia a parques públicos.",
                     "Superficie de parques públicos por habitante que cumple estándar de distancia (3.000 metros).",
                     "Porcentaje de población atendida por el sistema de plazas públicas.",
                     "Porcentaje de población atendida por el sistema de parques públicos.",
                     "Superficie de áreas verdes públicas por habitante.",
                     "Porcentaje de manzanas con veredas con buena calidad de pavimento.",
                     "Porcentaje de continuidad de la infraestructura vial en las áreas de crecimiento urbano.",
                     "Consumo de energía eléctrica per cápita no residencial.",
                     "Cantidad de luminarias cada 50 metros lineales de red vial.",
                     "Indisponibilidad de suministro eléctrico - indicador SAIDI anual",
                     "Consumo de agua potable residencial per cápita al día.",
                     "Porcentaje de agua no facturada.",
                     "Cantidad de Residuos eliminados con disposición final per cápita.",
                     "Porcentaje de residuos municipales valorizados.",
                     "Número de microbasurales por cada 10.000 habitantes.",
                     "Distancia a una unidad o destacamento destinado al servicio operativo de Carabineros.",
                     "Mts2 construidos de unidades policiales",
                     "Tasa de conexiones residenciales fijas de internet por cada 1.000 viviendas particulares.",
                     "Tasa de conexiones residenciales fijas de internet por cada 100 habitantes.",
                     "Distancia a paraderos de transporte público mayor.",
                     "Densidad de oferta planificada de transporte público mayor en periodo punta mañana, por persona.",
                     "Densidad de la oferta real de transporte público mayor en periodo punta mañana, por persona.",
                     "Densidad de oferta planificada de transporte público menor en periodo punta mañana, por persona.",
                     "Porcentaje de la población dentro del área de influencia de la red de transporte público mayor.",
                     "Porcentaje de cobertura de la red de ciclovía sobre la red vial.",
                     "Porcentaje de población atendida por la red de ciclovías.",
                     "Distancia a centros de salud primaria.",
                     "Cantidad de jornadas diarias completas de trabajo de médicos, en salud primaria, por cada 10.000 habitantes.",
                     "Mts2 construidos de centros de salud primaria por 1000 habitantes",
                     "Distancia a establecimientos de educación básica.",
                     "Razón entre disponibilidad efectiva de matrículas y demanda potencial por educación básica.",
                     "Distancia a establecimientos de educación inicial.",
                     "Distancia a establecimientos de educación media.",
                     "Razón entre disponibilidad efectiva de matrículas y demanda potencial por educación media.",
                     "Mts2 construidos destinados a educación inicial/ población en edad programática",
                     "Mts2 construidos destinados a educación básica/población en edad programática",
                     "Mts2 construidos destinados a educación media/ población en edad programática",
                     "Cobertura en Educación Municipal",
                     "Porcentaje de Retiro de Alumnos de Establecimientos Municipales en Enseñanza Básica",
                     "Porcentaje de Retiro de Alumnos de Establecimientos Municipales en Enseñanza Media",
                     "Porcentaje Personal Docente respecto al Personal del Área Educación",
                     "Mts2 construidos destinados a actividades deportivas/ habitantes",
                     "Mts2 construidos destinados a actividades culturales7 habitantes",
                     "Superficie del Continuo de Construcciones Urbanas (CCU).",
                     "Superficie de suelos de alto valor agrícola, según clases de suelo, próximas al CCU.",
                     "Superficie de sitios prioritarios para la conservación próximos al CCU.",
                     "Porcentaje de la superficie cubierta por vegetación total.",
                     "Porcentaje de la superficie cubierta por vegetación densa.")

length(variables_crudo)

variables_crudo |> 
  strip()



install.packages("stringdist")
library(stringdist)

etiquetas1 <- siedu |> 
  distinct(variable) |> 
  mutate(variable2 = strip(variable)) |> 
  mutate(etiqueta = list(strip(variables_crudo))) |> 
  unnest_longer(etiqueta)

etiquetas2 <- etiquetas1 |> 
  mutate(d = stringdist::stringdist(variable2, etiqueta)) |> 
  group_by(variable) |> 
  slice_min(d, n = 1) |> 
  filter(d < 10)

variables_siedu <- etiquetas2 |> pull(variable)

id_siedu <- siedu |> 
  filter(variable %in% variables_siedu) |> 
  pull(id) |> unique()

id_siedu |> dput()
