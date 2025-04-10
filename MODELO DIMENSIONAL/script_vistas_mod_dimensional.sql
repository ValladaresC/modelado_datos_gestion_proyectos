USE bd_gestion_proyectos;
GO

-- Vistas para usarse en programas de Business Inteligence como Power Bi

-- Vista para la dimensión de Proyectos

create view dim_Proyecto as
select
    p.id,
    p.codigo_proyecto,
    p.nombre_proyecto,
    p.descripcion_proy,
    p.fecha_inicio,
    p.fecha_fin,
    p.estado_proyecto,
    p.id_localidad
from proyectos p;

-- Vista para la dimensión de Categoría de Gasto

create view dim_Categoria_Gasto as
select
    cg.id,
    cg.codigo_cat_gasto,
    cg.categoria_gasto,
    cg.descripcion
from categoria_gastos cg;

-- Vista para la dimensión de Localidad

create view dim_Localidad as
select
    loc.id,
    loc.codigo_estado,
    loc.estado,
    loc.region,
    loc.pais
from localidad loc;

-- Vista para tabla de Hechos: Gastos

create view fct_Gastos as
select
    g.id,
    g.fecha_gato,
    g.monto_gasto,
    g.id_proyecto,
    g.id_categoria_gasto
from gastos g;

-- Vista para tabla de Hechos: Presupuesto Planificado

create view fct_Presupuesto_Planificado as
select
    pp.id,
    pp.fecha_registro,
    pp.monto_planificado,
    pp.id_proyecto
from presupuesto_planificado pp;
