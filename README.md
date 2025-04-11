# modelado_datos_gestion_proyectos
### La empresa Solana S.A tiene múltiples proyectos a cargo de su gestión. Cada proyecto tiene un presupuesto asignado y debe ser monitoreado en términos de gastos, ingresos y resultados financieros. Se asigna la tarea de diseñar un modelo de datos que permita gestionar la información financiera de estos proyectos de manera efectiva.

## 1. Entidades Principales:

### - Proyecto: Representa los proyectos que la empresa está gestionando. Atributos: ID del Proyecto, Nombre, Descripción, Fecha de Inicio, Fecha de Fin, Fecha planificada de culminación, ID Localidad, Estado (Activo, Finalizado, Cancelado).

### - Localidad: Un Proyecto puede estar asociado a una Localidad. Esto significa que cada proyecto se puede ubicar en una localidad específica. Atributos: ID de Localidad, Nombre de Localidad, Región, País.

### - Gasto: Representa los gastos asociados a cada proyecto. Atributos: ID del Gasto, ID del Proyecto, Fecha, Monto, ID Categoría. 

### - Ingreso: Representa los ingresos generados por cada proyecto. Atributos: ID del Ingreso, ID del Proyecto, Fecha, Monto, ID Categoría.

### - Categoría de Gasto: Clasifica los diferentes tipos de gastos. Atributos: ID de Categoría, Nombre de Categoría, Descripción.

### - Categoría de Ingreso: Clasifica los diferentes tipos de ingresos. Atributos: ID de Categoría, Nombre de Categoría, Descripción.

### - Presupuesto Planificado: Representa  una estimación detallada de los gastos previstos para un período de tiempo determinado. Atributos: ID del Presupuesto, ID del Proyecto, Monto Planificado (Presupuesto Asignado) y Fecha de Registro (para llevar un control de las modificaciones del presupuesto).

### - Métricas Financieras: Es una medida de la rentabilidad y la eficiencia con la que se utilizan los recursos financieros en un proyecto. En términos sencillos, responde a la pregunta: "¿Cuánto dinero está ganando o perdiendo este proyecto?. Atributos: ID de Métrica, ID del Proyecto, Valor Actual Neto (VAN), Tasa Interna de Retorno (TIR), Retorno de la Inversión (ROI), Fecha de Cálculo (para llevar un control de cuándo se calcularon estas métricas).

### - Tabla tiempo: es una tabla sin relación con el modelo físico de la base de datos relacional pero que será usada para el análisis BI y toma en consideración todas las fechas comenzando por la fecha menor que existe en las tablas de la base de datos.

## 2. Relaciones

### - Un Proyecto puede tener múltiples Gastos (1 a N).
### - Una Localidad puede tener múltiples Proyectos (1 a N)
### - Un Proyecto puede generar múltiples Ingresos (1 a N).
### - Un Gasto pertenece a una única Categoría de Gasto (N a 1).
### - Un Ingreso pertenece a una única Categoría de Ingreso (N a 1).
### - Un Proyecto puede tener múltiples Presupuestos Planificados ya que puede asignársele diferentes presupuestos a lo largo del tiempo del proyecto (1 a N).
### - Un Proyecto puede tener múltiples registros de Métricas Financieras a lo largo del tiempo (1 a N).

## Diagrama Entidad Relación

![image](https://github.com/user-attachments/assets/f7eb3df1-1b3e-4f42-94f4-2928d3999e29)

## Modelo Lógico

![image](https://github.com/user-attachments/assets/34ea14b9-1ceb-4306-be27-3c6696280240)

## Modelo Físico

![image](https://github.com/user-attachments/assets/df657367-418e-4155-b4db-52107b9159ab)

### El modelo físico se encuentra en la ruta MODELO TRANSACCIONAL/DDL/script_modelo_fisico.sql y la base de datos fue poblada con los datos que puede observar en la ruta MODELO TRANSACCIONAL/DML/script_insert_data.sql.

## 3. Análisis de resultados obtenidos de las consultas

### Se realizaron una serie de consultas a la base de datos las cuales se pueden  observar en la ruta MODELO TRANSACCIONAL/DML/script_consultas_data.sql.

### Se observó que algunos proyectos, como la construcción del hospital y la maternidad, finalizaron con retrasos significativos, mientras que otros, como el urbanismo y los edificios, se completaron dentro del plazo previsto. Esto refleja una variabilidad en la gestión del tiempo en los proyectos, como se muestra en la consulta 4.

### También, los ingresos totales de los proyectos finalizados son variados, siendo el hospital el que reportó los ingresos más altos (127,000) y la maternidad con los más bajos (96,000). Los proyectos en progreso también muestran ingresos significativos, según consulta 5.

### En la consulta 6 se clasificaron las categorías de ingresos, mostrando que la categoría de "Alquiler" y "Recursos" son predominantes en varios proyectos. Esto es indicativo de cómo se están generando los ingresos a través de diversas fuentes. Por su parte la consulta 7 presenta un ranking de las categorías de gastos, donde se observa que los gastos en "Seguros" y "Gastos de Comunicación" son los más altos en algunos proyectos, lo que podría indicar áreas donde se podrían optimizar costos.

### La comparación realizada en la consulta 8 muestra que todos los proyectos tienen márgenes de ganancia positivos, con el hospital y la escuela presentando los márgenes más altos. Esto sugiere una buena rentabilidad en los proyectos ejecutados.

### La consulta 9 revela que existe una variación significativa entre el presupuesto asignado y los gastos reales, lo que podría ser una señal de una planificación deficiente o de gastos imprevistos en algunos proyectos (Consulta 10).

### La consulta 11 muestra un patrón de gastos e ingresos a lo largo de los meses de 2023 y 2024, con picos en ingresos en meses específicos (por ejemplo, diciembre de 2023). Esto puede ayudar en la planificación financiera futura.

### Finalmente, en la consulta 12 se evalúa el Valor Actual Neto (VPN), Tasa Interna de Retorno (TIR) y Retorno de Inversión (ROI) de cada proyecto, donde se observa que el viaducto tiene el VPN más alto, lo que indica que es el proyecto más rentable en términos económicos.

### El análisis general muestra que, a pesar de algunos retrasos y variaciones en la ejecución de los proyectos, la mayoría de ellos son rentables y están generando ingresos significativos. La gestión del tiempo y de los costos es un aspecto a mejorar, especialmente en proyectos que aún están en progreso. Las variaciones presupuestarias también sugieren la necesidad de una mejor planificación y control financiero para futuros proyectos.

### Se realizaron Stored Procedures los cuales puede observar en la ruta MODELO TRANSACCIONAL/DML/script_stored_procedures.sql.

## 4. Modelo Dimensional

### Es fundamental identificar las dimensiones y hechos que se utilizarán para el análisis. Un modelo dimensional típico incluye tablas de hechos (que contienen medidas numéricas) y tablas de dimensiones (que contienen información descriptiva sobre las medidas).

### El modelo dimensional completo se podría visualizar de la siguiente manera:

### - Dimensiones:

#### Localidad
#### Categoría de Ingresos
#### Categoría de Gastos
#### Proyecto
#### Fecha

### - Hechos:

#### Ingresos
#### Gastos
#### Presupuesto Planificado
#### Métricas Financieras

### Sin embargo el modelo dimensional de acuerdo a los requerimientos BI se enfocará en estudiar el presupuesto planificado y los gastos, quienes ser convertirán en tablas de hechos.

## Modelo Lógico Dimensional

![image](https://github.com/user-attachments/assets/c9488032-25f4-4e13-8571-aa0a30550af6)

> [!IMPORTANT]
> la dimensión fecha puede ser poblada con datos de alguna tabla de la BD tomando en consideración la fecha menor de todas las tablas. También se puede crear un archivo .txt y luego cargarlo en la dimensión fecha, también tomando en cuenta que las fechas deben comenzar con la fecha menor de todas las tablas que se van analizar. Otra opción es crear una tabla fecha sin relación en la BD tomando en consideración la misma premisa de la fecha menor y utilizarla cuando se requiera para poblar con datos la dimensión fecha del modelo BI.

## Modelo Físico Dimensional

![image](https://github.com/user-attachments/assets/38ad226e-423d-4533-8dd3-54ec9b15b3ea)

### El modelo físico dimensional puede encontrarse en la ruta MODELO DIMENSIONAL/script_modelo_fisico_BI.sql.

### Para aquellas personas que desean realizar Inteligencia de Negocios en programas como Power Bi, podrá encontrar un archivos de vistas generadas para poblar su modelo en la siguiente ruta MODELO DIMENSIONAL/script_vistas_mod_dimensional

## 5. ETL con SQL Server Integration Services (SSIS)

### Se realizó un carga de datos NO-INCREMENTAL por lo cual se dispuso de una tarea llamada 'Limpiar tablas y reiniciar ID' la cual usó en su SQL Statement el siguiente comando para reiniciar el ID en cada tabla, comenzando por las tablas de hechos.

#### DELETE FROM fct_gastos;
#### DBCC CHECKIDENT ('fct_gastos', RESEED, 0);

### Se realizaron cuatro flujos de datos llamados 'Poblar tablas de dimensiones 1', 'Poblar tablas de dimensiones 2' y 'Poblar tabla de hechos 1' y 'Poblar tabla de hechos 2', mediante el cual se establecieron conexiones entre dos bases de datos de SQL Server: bd_gestion_proyectos como origen y bd_getion_proyectos_BI como destino, con el fin de poblar las tablas de dimensiones y hechos del modelo dimensional mediante comandos SQL presentes en el script de la ruta MODELO DIMENSIONAL/script_origen_poblar_modelo_BI.

<p align="center">
  <img width="460" height="600" src="https://github.com/user-attachments/assets/d6b6cb63-5de5-4049-bf93-fba0602bcfc6">
</p>

### En 'Poblar tablas de dimensiones 1' se poblaron tablas de dimensiones independientes o que no tienen llaves foráneas, como es el caso de Localidad, Categoria_Gasto y Fecha.

<p align="center">
  <img width="460" height="350" src="https://github.com/user-attachments/assets/997caff0-e34e-4958-8b00-a5f3366ab24a">
</p>

### En 'Poblar tablas de dimensiones 2' se pobló la tabla dimensión Proyecto que tiene asociada la tabla de dimensión Localidad.

<p align="center">
  <img width="460" height="600" src="https://github.com/user-attachments/assets/dc0b6080-1241-4aae-8d26-29b0074cf02f">
</p>

### En 'Poblar tabla de hechos 1' se pobló la primera tabla de hechos Gastos la cual tiene asociada tres tablas de dimensiones (Proyecto, Categoria_Gasto y Fecha), insertándose 40 registros.

<p align="center">
  <img width="460" height="600" src="https://github.com/user-attachments/assets/28a2992f-3820-4f9c-b5c0-461d4b2b0bab">
</p>

### En 'Poblar tabla de hechos 2' se pobló la primera tabla de hechos Presupuesto_Planificado la cual tiene asociada dos tablas de dimensiones (Proyecto y Fecha), insertándose 40 registros.

<p align="center">
  <img width="460" height="600" src="https://github.com/user-attachments/assets/328968e1-ea2d-45dc-9804-c46c6858c2f9">
</p>

## 6. Automatización del proceso ETL (Implementación)

### Se creó un Job llamado ssis_gestion_proyectos_bi el cual fue programado para ejecutarse los días miércoles a las 05:30 p.m.

<p align="center">
  <img width="460" height="600" src="https://github.com/user-attachments/assets/6aaeac1b-854e-48d3-afd2-3caeac91385d">
</p>

### Resultado de la automatización

![image](https://github.com/user-attachments/assets/b26a930e-ab58-42f5-b0af-8b5aec5de1a5)

## 7. Análisis Multidimensional con SQL Server Analysis Services (SSAS)

### Fue realizado mediante SQL Server Analysis Services el cual permite el análisis de negocios como una plataforma OLAP.

> [!NOTE]
> Las empresas usan sistemas OLTP para capturar y administrar transacciones diarias en tiempo real, mientras que emplean sistemas OLAP para análisis de datos e informes.

### Se creó una vista de origen de datos llamada BD_Gestion_Proyectos_BI

![image](https://github.com/user-attachments/assets/8ebdb671-bc75-4c1f-a13f-f4ac9b8c4ed8)

### Se creó un cubo OLAP llamado BD_Gestion_Proyectos_BI

![image](https://github.com/user-attachments/assets/3aa72d39-74eb-415e-81c1-f6756e231f3b)

### Se realizaron dos connsultas al cubo y en ambas se agregaron filtros de dimensión fecha y dimensión estado_proyecto y tambióen una medida calculada llamada resultado presupuestario que resulta de la resta de Gastos menos Presupuesto Planificado.

### En la primera consulta se observa todos los proyectos con estado Finalizado

![image](https://github.com/user-attachments/assets/90126b14-ba47-48b6-88f3-5eb51446d841)

### En la segunda consulta se observa todos los proyectos con estado En Progreso

![image](https://github.com/user-attachments/assets/4eb07b33-e190-469f-846c-3c8257db86d8)

## 8. Reportes con SQL Server Reporting Services (SSRS)

### Se realizó una solución llamada SSRS_GESTION_PROYECTOS_BI, la cual contiene el reporte Report_Gestion_Proyectos en la ventana de diseño

![image](https://github.com/user-attachments/assets/19ee4999-5393-4d50-b0a8-90f1874f6b84)

### Obteniendose el siguiente reporte en la pestaña de visualización

![image](https://github.com/user-attachments/assets/b6806209-ecd7-49fc-b665-08194d4d533a)

### Por último este reporte fue implementado para finalmente observarse en el navegador

![image](https://github.com/user-attachments/assets/63f771be-d95c-4397-8158-4ea1e72f144f)
