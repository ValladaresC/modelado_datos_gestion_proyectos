CREATE DATABASE bd_gestion_proyectos_BI;
GO

USE bd_gestion_proyectos_BI;
GO

-- Tabla dimensión localidad

CREATE TABLE dim_localidad (
id INT IDENTITY(1,1) PRIMARY KEY,
estado VARCHAR(50) NULL,
region VARCHAR(50) NULL,
pais VARCHAR(50) NULL
)
GO

-- Tabla dimensión proyectos

CREATE TABLE dim_proyectos (
id INT IDENTITY(1,1) PRIMARY KEY,
nombre_proyecto VARCHAR(155) NULL,
fecha_inicio DATE NULL,
fecha_fin DATE NULL,
fecha_planificada_fin DATE NULL,
estado_proyecto VARCHAR(55) NULL,
localidad_id INT NOT NULL,
CONSTRAINT fk_id_localidad FOREIGN KEY (localidad_id) REFERENCES dim_localidad(id)
)
GO


-- Tabla dimensión categoría_gasto

CREATE TABLE dim_categoria_gastos (
id INT IDENTITY(1,1) PRIMARY KEY,
cat_gasto_id INT NOT NULL,
categoria_gasto VARCHAR(50) NULL,
)
GO

-- Tabla dimensión fecha

CREATE TABLE dim_fecha (
id INT IDENTITY(1,1) PRIMARY KEY,
fecha DATE NOT NULL,
anio VARCHAR(20) NULL,
mes VARCHAR(20) NULL
)
GO


-- Tabla de hechos gastos

CREATE TABLE fct_gastos (
id INT IDENTITY(1,1) PRIMARY KEY,
fecha_gasto DATE NULL,
monto_gasto MONEY NULL,
dim_proyecto_id INT NOT NULL,
CONSTRAINT fk_id_proyecto_gasto FOREIGN KEY (dim_proyecto_id) REFERENCES dim_proyectos(id),
dim_categoria_gasto_id INT NOT NULL,
CONSTRAINT fk_id_cat_gasto FOREIGN KEY (dim_categoria_gasto_id) REFERENCES dim_categoria_gastos(id),
dim_fecha_id INT NOT NULL,
CONSTRAINT fk_id_fecha_gasto FOREIGN KEY (dim_fecha_id) REFERENCES dim_fecha(id)
)
GO

-- Tabla de hechos presupuesto_planificado

CREATE TABLE fct_presupuesto_planificado (
id INT IDENTITY(1,1) PRIMARY KEY,
monto_planificado MONEY NULL,
fecha_registro DATE NULL,
dim_proyecto_id INT NOT NULL,
CONSTRAINT fk_id_proyecto_presupuesto FOREIGN KEY (dim_proyecto_id) REFERENCES dim_proyectos(id),
dim_fecha_id INT NOT NULL,
CONSTRAINT fk_id_fecha_presplan FOREIGN KEY (dim_fecha_id) REFERENCES dim_fecha(id)
)
GO

IF OBJECT_ID('bd_gestion_proyectos_BI..#temp') IS NOT NULL
DROP TABLE dim_localidad;
IF OBJECT_ID('bd_gestion_proyectos_BI..#temp') IS NOT NULL
DROP TABLE dim_proyectos;
IF OBJECT_ID('bd_gestion_proyectos_BI..#temp') IS NOT NULL
DROP TABLE dim_categoria_gastos;
IF OBJECT_ID('bd_gestion_proyectos_BI..#temp') IS NOT NULL
DROP TABLE dim_fecha;
IF OBJECT_ID('bd_gestion_proyectos_BI..#temp') IS NOT NULL
DROP TABLE fct_gastos;
IF OBJECT_ID('bd_gestion_proyectos_BI..#temp') IS NOT NULL
DROP TABLE fct_presupuesto_planificado;

select * from dim_proyectos;
select * from dim_localidad;
select * from dim_fecha;
select * from dim_categoria_gastos;
select * from fct_gastos;
select * from fct_presupuesto_planificado;