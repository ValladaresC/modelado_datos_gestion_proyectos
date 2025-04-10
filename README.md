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



