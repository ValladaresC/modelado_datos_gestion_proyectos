USE bd_gestion_proyectos;
GO

-- Registrar un ingreso (este tipo de stored_procedure puede ser creado para cualquier tabla)

create procedure sp_registroIngreso
	@codigo_ingreso VARCHAR(10),
	@fecha_ingreso DATE,
	@monto_ingreso MONEY,
	@id_proyecto INT,
	@id_categoria_ingreso INT
as
begin
	insert into ingresos (codigo_ingreso, fecha_ingreso, monto_ingreso, id_proyecto, id_categoria_ingreso)
	values (@codigo_ingreso, @fecha_ingreso, @monto_ingreso, @id_proyecto, @id_categoria_ingreso);
end;

EXECUTE dbo.sp_registroIngreso 41,'2024-12-20', 2000, 2, 14;

-- Actualizar un proyecto existente

create procedure sp_ActualizarProyecto
    @id INT,
    @codigo_proyecto VARCHAR(10),
    @nombre_proyecto VARCHAR(155),
    @descripcion_proy VARCHAR(MAX),
    @fecha_inicio DATE,
    @fecha_fin DATE,
    @fecha_planificada_fin DATE,
    @estado_proyecto VARCHAR(55),
    @id_localidad INT
as
begin
    update proyectos
    set codigo_proyecto = @codigo_proyecto,
        nombre_proyecto = @nombre_proyecto,
        descripcion_proy = @descripcion_proy,
        fecha_inicio = @fecha_inicio,
        fecha_fin = @fecha_fin,
        fecha_planificada_fin = @fecha_planificada_fin,
        estado_proyecto = @estado_proyecto,
        id_localidad = @id_localidad
    where id = @id;
end;

EXECUTE sp_ActualizarProyecto 1,'PROJ001','Construcción de Escuela Prim','Proyecto para construir una escuela primaria en la localidad', '2025-01-01',NULL,'2025-12-01','En Progreso',1;

-- Obtener información de ingresos y gastos por proyecto

create procedure sp_ResumenFinancieroProyecto
	@id_proyecto INT
as 
begin
	select
		p.codigo_proyecto,
		p.nombre_proyecto,
		coalesce(sum(g.monto_gasto),0) as total_gasto,
		coalesce(sum(i.monto_ingreso),0) as total_ingreso
	from proyectos p
	left join ingresos i on p.id = i.id_proyecto
	left join gastos g on p.id = g.id_proyecto
	where p.id = @id_proyecto
	group by p.codigo_proyecto,	p.nombre_proyecto;
end;

EXECUTE sp_ResumenFinancieroProyecto 2;

-- Obtener todos los proyectoss de una localidad específica

create procedure sp_ObtenerProyectosPorLocalidad
    @id_localidad INT
as
begin
    select *
	from proyectos 
	where id_localidad = @id_localidad;
end;

EXECUTE sp_ObtenerProyectosPorLocalidad 2;
