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

## 4. Análisis de resultados obtenidos de las consultas:

### Se realizaron una serie de consultas a la base de datos las cuales se pueden  observar en la ruta MODELO TRANSACCIONAL/DML/script_consultas_data.sql.

### Se observó que algunos proyectos, como la construcción del hospital y la maternidad, finalizaron con retrasos significativos, mientras que otros, como el urbanismo y los edificios, se completaron dentro del plazo previsto. Esto refleja una variabilidad en la gestión del tiempo en los proyectos, como se muestra en la consulta 4.

### También, los ingresos totales de los proyectos finalizados son variados, siendo el hospital el que reportó los ingresos más altos (127,000) y la maternidad con los más bajos (96,000). Los proyectos en progreso también muestran ingresos significativos, según consulta 5.

### En la consulta 6 se clasificaron las categorías de ingresos, mostrando que la categoría de "Alquiler" y "Recursos" son predominantes en varios proyectos. Esto es indicativo de cómo se están generando los ingresos a través de diversas fuentes. Por su parte la consulta 7 presenta un ranking de las categorías de gastos, donde se observa que los gastos en "Seguros" y "Gastos de Comunicación" son los más altos en algunos proyectos, lo que podría indicar áreas donde se podrían optimizar costos.

### La comparación realizada en la consulta 8 muestra que todos los proyectos tienen márgenes de ganancia positivos, con el hospital y la escuela presentando los márgenes más altos. Esto sugiere una buena rentabilidad en los proyectos ejecutados.

### La consulta 9 revela que existe una variación significativa entre el presupuesto asignado y los gastos reales, lo que podría ser una señal de una planificación deficiente o de gastos imprevistos en algunos proyectos (Consulta 10).

### La consulta 11 muestra un patrón de gastos e ingresos a lo largo de los meses de 2023 y 2024, con picos en ingresos en meses específicos (por ejemplo, diciembre de 2023). Esto puede ayudar en la planificación financiera futura.

### Finalmente, en la consulta 12 se evalúa el Valor Actual Neto (VPN), Tasa Interna de Retorno (TIR) y Retorno de Inversión (ROI) de cada proyecto, donde se observa que el viaducto tiene el VPN más alto, lo que indica que es el proyecto más rentable en términos económicos.

### El análisis general muestra que, a pesar de algunos retrasos y variaciones en la ejecución de los proyectos, la mayoría de ellos son rentables y están generando ingresos significativos. La gestión del tiempo y de los costos es un aspecto a mejorar, especialmente en proyectos que aún están en progreso. Las variaciones presupuestarias también sugieren la necesidad de una mejor planificación y control financiero para futuros proyectos.




