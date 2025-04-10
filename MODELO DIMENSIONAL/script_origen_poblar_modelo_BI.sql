USE bd_gestion_proyectos;
GO 

-- Dim Localidad

select
	distinct
	estado as 'estado',
	region as 'region',
	pais as 'pais'
from localidad;
GO

-- Dim Proyecto

select
	distinct
	nombre_proyecto as 'nombre_proyecto',
	fecha_inicio as 'fecha_inicio',
	fecha_fin as 'fecha_fin',
	fecha_planificada_fin as 'fecha_planificada_fin',
	estado_proyecto as 'estado_proyecto',
	id_localidad as 'localidad_id'
from proyectos;
GO

-- Dim Categoria_Gasto

select
	distinct
	id as 'cat_gasto_id',
	categoria_gasto as 'categoria_gasto'
from categoria_gastos;
GO

-- Dim Fecha

select
	distinct
	fecha as 'fecha',
	YEAR(fecha) as 'anio',
	MONTH(fecha) as 'mes'
from fechas;

-- Fct Gastos
select
	g.fecha_gato as 'fecha_gasto',
	g.monto_gasto as 'monto_gasto',
	g.id_proyecto as 'dim_proyecto_id',
	g.id_categoria_gasto as 'dim_categoria_gasto_id'
from gastos g;


-- Fct presupuesto_planificado

select 
	pp.monto_planificado as 'monto_planificado',
	pp.fecha_registro as 'fecha_registro',
	pp.id_proyecto as 'dim_proyecto_id'
from presupuesto_planificado pp;
