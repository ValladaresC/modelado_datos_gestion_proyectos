USE bd_gestion_proyectos;
GO

-- 1. Visión general de los proyectos

select * from proyectos;

-- 2. Cantidad de proyectos finalizados y en ejecución

select estado_proyecto, count(estado_proyecto) as cant_proyec
from proyectos
group by estado_proyecto;

-- 3. Ubicación donde los proyectos se realizaron o se están ejecutando

select p.nombre_proyecto, p.fecha_inicio, p.estado_proyecto, loc.estado 
from proyectos p 
inner join localidad loc on p.id_localidad = loc.id;

-- 4. Proyectos que han finalizado antes o después de la fecha planificada

with plazo_fecha as (
			select codigo_proyecto,
					nombre_proyecto,
					DATEDIFF(day, fecha_fin, fecha_planificada_fin) as dias_retraso
			from proyectos
			where estado_proyecto = 'Finalizado'
)
select codigo_proyecto,
		nombre_proyecto,
		dias_retraso,
		case when dias_retraso >= 0 then 'proyecto culminado en el plazo planificado'
		else 'proyecto culminado con retraso en la fecha planificada'
		end as detalles_retraso
from plazo_fecha;

-- 5. Ingresos totales por proyecto

select p.nombre_proyecto, p.estado_proyecto, sum(i.monto_ingreso) as total_ingresos
from proyectos p
left join ingresos i on p.id = i.id_proyecto
group by p.nombre_proyecto, p.estado_proyecto;

-- 6. Ranking de las Categorias de ingresos que obtuvieron más ingresos en cada proyecto

with ingresos_totales as (
			select p.nombre_proyecto,
					p.estado_proyecto,
					ci.categoria_ingreso,
					sum(i.monto_ingreso) as total_ingresos
			from proyectos p
			left join ingresos i on p.id = i.id_proyecto
			inner join categoria_ingresos ci on i.id_categoria_ingreso = ci.id
			group by p.nombre_proyecto, p.estado_proyecto, ci.categoria_ingreso
)
select nombre_proyecto,
		estado_proyecto,
		categoria_ingreso,
		total_ingresos,
		rank() over(partition by nombre_proyecto order by total_ingresos desc) as ranking_catg
from ingresos_totales;

-- 7. Ranking de las Categorias de gastos donde hubo más ingresos en cada proyecto

with gastos_totales as (
			select p.nombre_proyecto,
					p.estado_proyecto,
					cg.categoria_gasto,
					sum(g.monto_gasto) as total_gastos
			from proyectos p
			left join gastos g on p.id = g.id_proyecto
			inner join categoria_gastos cg on g.id_categoria_gasto = cg.id
			group by p.nombre_proyecto, p.estado_proyecto, cg.categoria_gasto
)
select nombre_proyecto,
		estado_proyecto,
		categoria_gasto,
		total_gastos,
		rank() over(partition by nombre_proyecto order by total_gastos desc) as ranking_catg
from gastos_totales;

-- 8. Comparación de ingresos y gastos por proyecto, margen de ganancia y rentabilidad

select p.codigo_proyecto,
		p.nombre_proyecto,
		coalesce(sum(i.monto_ingreso),0) as total_ingresos,
		coalesce(sum(g.monto_gasto),0) as total_gastos, 
		coalesce(sum(i.monto_ingreso),0)-coalesce(sum(g.monto_gasto),0) as margen_ganancia,
		((coalesce(sum(i.monto_ingreso),0)-coalesce(sum(g.monto_gasto),0)) / coalesce(sum(i.monto_ingreso),0))*100 as rentabilidad
from proyectos p
left join ingresos i on p.id = i.id_proyecto
left join gastos g on p.id = g.id_proyecto
group by p.codigo_proyecto, p.nombre_proyecto;

-- 9. Presupuesto asignado a cada proyecto

select p.codigo_proyecto,
		p.nombre_proyecto,
		sum(pp.monto_planificado) as presup_planif
from proyectos p
left join presupuesto_planificado pp on p.id = pp.id_proyecto
group by p.codigo_proyecto,	p.nombre_proyecto;

-- 10. Variación del presupuesto vs gastos

select p.codigo_proyecto,
		p.nombre_proyecto,
		coalesce(sum(pp.monto_planificado),0) as presup_planif,
		coalesce(sum(g.monto_gasto),0) as total_gastos,
		coalesce(sum(pp.monto_planificado),0)-coalesce(sum(g.monto_gasto),0) as variación
from proyectos p
left join presupuesto_planificado pp on p.id = pp.id_proyecto
left join gastos g on p.id = g.id_proyecto
group by p.codigo_proyecto,	p.nombre_proyecto;

-- 11. Gastos e ingresos por año y mes

select year(g.fecha_gato) as año,
		month(g.fecha_gato) as mes,
		coalesce(sum(g.monto_gasto),0) as total_gasto,
		coalesce(sum(i.monto_ingreso),0) as total_ingreso
from gastos g
left join ingresos i on year(g.fecha_gato) = year(i.fecha_ingreso) AND
						month(g.fecha_gato) = month(i.fecha_ingreso)
group by year(g.fecha_gato), month(g.fecha_gato)
order by 1,2 asc;

-- 12. Valor actual neto, Tasa interna de retorno (TIR) promedio, y Retorno de inversión (ROI) promedio, por proyecto

select p.codigo_proyecto,
		p.nombre_proyecto,
		sum(m.valor_actual_neto) as VPN_total,
		avg(m.tasa_interna_retorno) as TIR_promedio,
		avg(m.retorno_inversion) as ROI_promedio,
		count(m.id) as num_metrica
from proyectos p
left join metricas_financieras m on p.id = m.id_proyecto
group by p.codigo_proyecto, p.nombre_proyecto
having count(m.id) > 1
order by TIR_promedio desc;

-- 13. Ingresos, gastos y presupuesto por año y mes

with ingre_gast as (
		select year(g.fecha_gato) as año,
				month(g.fecha_gato) as mes,
				coalesce(sum(g.monto_gasto),0) as total_gasto,
				coalesce(sum(i.monto_ingreso),0) as total_ingreso
		from gastos g
		left join ingresos i on year(g.fecha_gato) = year(i.fecha_ingreso) AND
								month(g.fecha_gato) = month(i.fecha_ingreso)
		group by year(g.fecha_gato), month(g.fecha_gato)
)
select
	año,
	mes,
	total_gasto,
	total_ingreso,
	coalesce(sum(pp.monto_planificado),0) as presup_planif
from ingre_gast ig
left join presupuesto_planificado pp on ig.año = year(pp.fecha_registro) AND
										ig.mes = month(pp.fecha_registro)
group by año, mes, total_gasto,	total_ingreso;