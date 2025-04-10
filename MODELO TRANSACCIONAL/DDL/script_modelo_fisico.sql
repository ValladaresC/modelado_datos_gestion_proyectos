
CREATE DATABASE bd_gestion_proyectos;
GO

USE bd_gestion_proyectos;
GO

-- Tabla localidad

CREATE TABLE localidad (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_estado VARCHAR(5) NOT NULL UNIQUE, 
estado VARCHAR(20) NOT NULL,
region VARCHAR(10) NOT NULL,
pais VARCHAR(50) NOT NULL
)
GO

ALTER TABLE localidad
ALTER COLUMN estado VARCHAR(50);
ALTER TABLE localidad
ALTER COLUMN region VARCHAR(50);
ALTER TABLE localidad
ALTER COLUMN pais VARCHAR(50);

-- Tabla categoria_ingresos

CREATE TABLE categoria_ingresos (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_cat_ingreso VARCHAR(10) NOT NULL UNIQUE, 
categoria_ingreso VARCHAR(50) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
)
GO

-- Tabla categoria_gastos

CREATE TABLE categoria_gastos (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_cat_gasto VARCHAR(10) NOT NULL UNIQUE, 
categoria_gasto VARCHAR(50) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
)
GO

-- Tabla proyectos

CREATE TABLE proyectos (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_proyecto VARCHAR(10) NOT NULL UNIQUE,
nombre_proyecto VARCHAR(155) NOT NULL,
descripcion_proy VARCHAR(MAX),
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
fecha_planificada_fin DATE NOT NULL,
estado_proyecto VARCHAR(55) NOT NULL,
id_localidad INT NOT NULL,
CONSTRAINT fk_id_localidad FOREIGN KEY (id_localidad) REFERENCES localidad(id)
)
GO

-- Modificar tabla proyectos

ALTER TABLE proyectos
ALTER COLUMN fecha_fin DATE NULL;

-- Tabla ingresos

CREATE TABLE ingresos (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_ingreso VARCHAR(10) NOT NULL UNIQUE,
fecha_ingreso DATE NOT NULL,
monto_ingreso MONEY NOT NULL,
id_proyecto INT NOT NULL,
CONSTRAINT fk_id_proyecto_ingreso FOREIGN KEY (id_proyecto) REFERENCES proyectos(id),
id_categoria_ingreso INT NOT NULL,
CONSTRAINT fk_id_cat_ingreso FOREIGN KEY (id_categoria_ingreso) REFERENCES categoria_ingresos(id)
)
GO

-- Tabla gastos

CREATE TABLE gastos (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_gasto VARCHAR(10) NOT NULL UNIQUE,
fecha_gato DATE NOT NULL,
monto_gasto MONEY NOT NULL,
id_proyecto INT NOT NULL,
CONSTRAINT fk_id_proyecto_gasto FOREIGN KEY (id_proyecto) REFERENCES proyectos(id),
id_categoria_gasto INT NOT NULL,
CONSTRAINT fk_id_cat_gasto FOREIGN KEY (id_categoria_gasto) REFERENCES categoria_gastos(id)
)
GO

 -- Tabla presupuesto planificado

CREATE TABLE presupuesto_planificado (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_presupuesto VARCHAR(10) NOT NULL UNIQUE,
monto_planificado MONEY NOT NULL,
fecha_registro DATE NOT NULL,
id_proyecto INT NOT NULL,
CONSTRAINT fk_id_proyecto_presupuesto FOREIGN KEY (id_proyecto) REFERENCES proyectos(id)
)
GO


-- Tabla metricas financieras

CREATE TABLE metricas_financieras (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo_metrica VARCHAR(10) NOT NULL UNIQUE,
valor_actual_neto MONEY NOT NULL,
tasa_interna_retorno DECIMAL(5,4) NOT NULL,
retorno_inversion DECIMAL(5,4) NOT NULL,
fecha_calculo DATE NOT NULL,
id_proyecto INT NOT NULL,
CONSTRAINT fk_id_proyecto_metrica FOREIGN KEY (id_proyecto) REFERENCES proyectos(id)
)
GO

-- Tabla tiempo (fechas)
-- Esta tabla no tiene relación en el modelo, pero será usada para el análisis BI

CREATE TABLE fechas (
id INT IDENTITY(1,1) PRIMARY KEY,
fecha date
)
GO

