## Datos SIEDU

Limpieza de datos del [Sistema de Indicadores y Estándares de Desarrollo Urbano (SIEDU).](https://www.ine.gob.cl/herramientas/portal-de-mapas/siedu)

Los datos de este sistema se entregan desde el sitio web del INE en un archivo Excel un poco engorroso, y la única forma de visualizarlos es con unos visores ArcGIS no muy buenos que digamos.

Dado lo anterior, este repositorio carga el archivo de datos original del SIEDU (la matriz de indicadores), lo limpia, y lo entrega como una sola tabla en formato tidy (una observación por fila; es decir, cada fila representa solo a una variable de una sola comuna). 

**Producto:** base de datos comunales de 83 indicadores de desarrollo urbano para 117 comunas de Chile. Disponible en la carpeta `datos_procesados`.

La base de datos original se puede descargar desde el [sitio del INE](https://www.ine.gob.cl/herramientas/portal-de-mapas/siedu), en [este enlace.](https://www.ine.gob.cl/docs/default-source/sistema-de-indicadores-y-estandares-de-desarrollo-urbano/indicadores/actualización-2019/matriz-siedu-publicacion.xlsm?sfvrsn=f50c5851_13)

### Tabla de variables disponibles:

|Indicador de desarrollo urbano                                                                                                                                                                                      |  año de medición|
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----:|
|Cantidad de jornadas diarias completas de trabajo de médicos, en salud primaria, por cada 10.000 habitantes                                                                                   | 2018|
|Cantidad de luminarias cada 50 metros lineales de red vial                                                                                                                                    | 2019|
|Cantidad de residuos eliminados con disposición final per cápita                                                                                                                              | 2019|
|Consumo de energía eléctrica per cápita no residencial                                                                                                                                        | 2021|
|Consumo de energía eléctrica per cápita residencial                                                                                                                                           | 2021|
|Densidad de hogares en campamentos                                                                                                                                                            | 2022|
|Densidad de oferta planificada de transporte público mayor en periodo punta mañana, por persona                                                                                               | 2018|
|Densidad de oferta planificada de transporte público menor en periodo punta mañana, por persona                                                                                               | 2018|
|Diferencia entre el valor de suelo más alto y el más bajo entre las áreas homogéneas urbanas definidas por el Servicio de Impuestos Internos                                                  | 2018|
|Distancia a centros de salud primaria                                                                                                                                                         | 2020|
|Distancia a establecimientos de educación básica                                                                                                                                              | 2020|
|Distancia a establecimientos de educación inicial                                                                                                                                             | 2020|
|Distancia a paraderos de transporte público mayor                                                                                                                                             | 2018|
|Distancia a parques públicos                                                                                                                                                                  | 2019|
|Distancia a plazas públicas                                                                                                                                                                   | 2019|
|Distancia a una unidad o destacamento destinado al servicio operativo de Carabineros                                                                                                          | 2018|
|Indisponibilidad de suministro eléctrico - indicador SAIDI anual                                                                                                                              | 2022|
|Monto total per cápita, en pesos, de fondos entregados por el municipio a la comunidad vía proyectos concursables para el mejoramiento urbano                                                 | 2019|
|Número de microbasurales por cada 10.000 habitantes                                                                                                                                           | 2019|
|Número de víctimas lesionadas en siniestros de tránsito por cada 100.000 habitantes                                                                                                           | 2021|
|Número de víctimas mortales en siniestros de tránsito por cada 100.000 habitantes                                                                                                             | 2021|
|Participación del Fondo Común Municipal (FCM) en el ingreso municipal total (descontadas las transferencias)                                                                                  | 2022|
|Partición modal del transporte público (número de viajes en transporte público respecto al número total de viajes)                                                                            | 2019|
|Partición modal del transporte sustentable (suma de viajes en transporte público, caminata y bicicleta respecto al número total de viajes)                                                    | 2019|
|Población estimada de migrantes internacionales por comuna                                                                                                                                    | 2020|
|Porcentaje de  la superficie cubierta por vegetación total                                                                                                                                    | 2020|
|Porcentaje de aporte de energía eléctrica proveniente de paneles solares domiciliarios                                                                                                        | 2022|
|Porcentaje de cobertura de la red de ciclovía sobre la red vial                                                                                                                               | 2021|
|Porcentaje de inversión pública destinada a proyectos que tienen procesos de intervención de restauración de inmuebles patrimoniales sobre el total de inversión destinada a proyectos con RF | 2018|
|Porcentaje de la inversión nacional a escala comunal en la que participa el municipio como institución contratante                                                                            | 2019|
|Porcentaje de la población en situación de pobreza multidimensional                                                                                                                           | 2019|
|Porcentaje de la población en situación de pobreza por ingresos                                                                                                                               | 2019|
|Porcentaje de la superficie cubierta por vegetación densa                                                                                                                                     | 2020|
|Porcentaje de la superficie de campamentos respecto del área urbana                                                                                                                           | 2022|
|Porcentaje de manzanas con veredas con buena calidad de pavimento                                                                                                                             | 2018|
|Porcentaje de participación en las elecciones municipales por comuna                                                                                                                          | 2022|
|Porcentaje de población atendida por el sistema de parques públicos                                                                                                                           | 2019|
|Porcentaje de población atendida por el sistema de plazas públicas                                                                                                                            | 2019|
|Porcentaje de población atendida por la red de ciclovías                                                                                                                                      | 2018|
|Porcentaje de residuos municipales valorizados                                                                                                                                                | 2019|
|Porcentaje de viajes originados  inferiores a 5 kilómetros                                                                                                                                    | 2021|
|Porcentaje de viviendas con situación de allegamiento externo                                                                                                                                 | 2018|
|Porcentaje de viviendas en situación de hacinamiento                                                                                                                                          | 2018|
|Porcentaje de viviendas particulares que requieren mejoras de materialidad y/o servicios básicos                                                                                              | 2018|
|Porcentaje de votantes de nacionalidad extranjera en las elecciones municipales                                                                                                               | 2022|
|Promedio de intersecciones relevantes cada 1,44 km²                                                                                                                                           | 2019|
|Proporción de viajes con una duración mayor o igual a 45 minutos                                                                                                                              | 2019|
|Proporción de viajes de estudio y trabajo con una duración mayor o igual a 45 minutos                                                                                                         | 2019|
|Proporción de viajes totales en transporte privado con una duración mayor o igual a 45 minutos                                                                                                | 2019|
|Proporción de viajes totales en transporte público con una duración mayor o igual a 45 minutos                                                                                                | 2019|
|Razón entre disponibilidad efectiva de matrículas y demanda potencial por educación básica                                                                                                    | 2020|
|Relación entre el tiempo de viaje en hora punta respecto del tiempo de viaje fuera de hora punta                                                                                              | 2019|
|Requerimiento de viviendas nuevas urbanas                                                                                                                                                     | 2018|
|Superficie de parques públicos por habitante que cumple estándar de distancia (3.000 metros)                                                                                                  | 2018|
|Superficie de plazas públicas por habitante que cumple estándar de distancia (400 metros)                                                                                                     | 2018|
|Superficie de áreas verdes públicas por habitante                                                                                                                                             | 2018|
|Tasa de conexiones residenciales fijas de internet por cada 1.000 viviendas particulares                                                                                                      | 2021|
|Tasa de conexiones residenciales fijas de internet por cada 100 habitantes                                                                                                                    | 2021|
|Tasa de víctimas de delitos contra la propiedad por casos policiales cada 10.000 habitantes                                                                                                   | 2022|
|Tasa de víctimas de delitos violencia intrafamiliar por casos policiales cada 10.000 habitantes                                                                                               | 2022|
|Tasa de víctimas de delitos violentos por casos policiales cada 10.000 habitantes                                                                                                             | 2022|
|Tiempo de viaje en hora punta mañana                                                                                                                                                          | 2018|
|Tiempo de viaje en transporte público en hora punta mañana                                                                                                                                    | 2018|
|Cantidad de residuos eliminados con disposición final per cápita                                                                                                                              | 2022|
|Porcentaje de aporte de energía eléctrica proveniente de paneles solares domiciliarios                                                                                                        | 2018|
|Porcentaje de residuos municipales valorizados                                                                                                                                                | 2022|
|Porcentaje de equipamiento crítico expuesto a inundación por tsunami                                                                                                                          | 2019|
|Porcentaje de población expuesta a inundación por tsunami                                                                                                                                     | 2018|
|Porcentaje de unidades vecinales de la comuna que tienen entre 20% y 60% de hogares vulnerables                                                                                               | 2018|
|Porcentaje de zonas típicas con lineamientos de intervención aprobados                                                                                                                        | 2019|
|Porcentaje de zonas típicas con lineamientos de intervención en desarrollo                                                                                                                    | 2019|
|Índice de segregación de la población vulnerable                                                                                                                                              | 2018|
|Porcentaje de la superficie de campamentos respecto del área urbana                                                                                                                           | 2021|
|Densidad de oferta real de transporte público mayor en periodo punta mañana, por persona                                                                                                      | 2018|
|Número de microbasurales por cada 10.000 habitantes                                                                                                                                           | 2018|
|Porcentaje de personas potencialmente expuestas a niveles de ruido diurno inaceptables (Ld > 65 dBA OCDE)                                                                                     | 2019|
|Porcentaje de personas potencialmente expuestas a niveles de ruido nocturno inaceptables (Ln > 55 dBA OCDE)                                                                                   | 2019|
|Densidad de hogares en campamentos                                                                                                                                                            | 2021|
|Monto total per cápita, en pesos, de fondos entregados por el municipio a la comunidad vía proyectos concursables para el mejoramiento urbano                                                 | 2018|
|Cantidad de residuos eliminados con disposición final per cápita                                                                                                                              | 2018|
|Porcentaje de zonas típicas con lineamientos de intervención aprobados                                                                                                                        | 2018|
|Porcentaje de zonas típicas con lineamientos de intervención en desarrollo                                                                                                                    | 2018|
|Porcentaje de aporte de energía eléctrica proveniente de paneles solares domiciliarios                                                                                                        | 2019|

----

Sobre el SIEDU: 

> El SIEDU es una iniciativa conjunta entre el Consejo Nacional de Desarrollo Urbano (CNDU) y el Instituto Nacional de Estadísticas (INE) para medir la calidad de vida en las ciudades chilenas.

> Para dar cumplimiento a los objetivos de la Política Nacional de Desarrollo Urbano (PNDU), se ha establecido un sistema de indicadores y estándares de desarrollo urbano (SIEDU) con el objetivo de medir, monitorear y evaluar periódicamente los avances de las ciudades chilenas en términos de la calidad de vida y formas de desarrollo urbano.

> El SIEDU se organiza y estructura a partir de ocho compromisos que encarnan los desafíos planteados tanto por la PNDU, como por la Nueva Agenda Urbana de Hábitat III y las directrices planteadas por la OCDE.

---- 

## Fuente
https://www.ine.gob.cl/herramientas/portal-de-mapas/siedu