USE bd_gestion_proyectos;
GO

-- Insertando data en tabla localidad

INSERT INTO localidad (codigo_estado, estado, region, pais) VALUES
('MX01', 'Sonora', 'Norte', 'México'),
('MX02', 'Nuevo Leon', 'Norte', 'México'),
('MX03', 'Oxaca', 'Sur', 'México'),
('MX04', 'Chiapas', 'Sur', 'México'),
('MX05', 'Jalisco', 'Centro', 'México'),
('MX06', 'Guanajuato', 'Centro', 'México');

-- Insertando data en tabla categoria_ingresos

INSERT INTO categoria_ingresos (codigo_cat_ingreso, categoria_ingreso, descripcion) VALUES
('ING006', 'Intereses', 'Ingresos por intereses generados'),
('ING007', 'Alquiler', 'Ingresos por alquiler de propiedades'),
('ING008', 'Comisiones', 'Ingresos por comisiones de ventas'),
('ING009', 'Subvenciones', 'Ingresos por subvenciones y apoyos'),
('ING010', 'Honorarios', 'Ingresos por honorarios profesionales'),
('ING011', 'Licencias', 'Ingresos por venta de licencias'),
('ING012', 'Multas', 'Ingresos por multas recaudadas'),
('ING013', 'Patrocinios', 'Ingresos por patrocinios recibidos'),
('ING014', 'Intercambios', 'Ingresos por intercambios de bienes o servicios'),
('ING015', 'Recuperación', 'Recuperación de ingresos por cuentas incobrables'),
('ING016', 'Otros', 'Otros ingresos no especificados'),
('ING017', 'Recursos', 'Ingresos por recursos naturales'),
('ING018', 'Rentas', 'Ingresos por rentas de bienes inmuebles'),
('ING019', 'Préstamos', 'Ingresos por préstamos otorgados'),
('ING020', 'Inversiones Externas', 'Ingresos por inversiones realizadas en el extranjero'),
('ING021', 'Dividendos', 'Ingresos por dividendos de acciones'),
('ING022', 'Intereses Ganados', 'Intereses ganados por cuentas de ahorro'),
('ING023', 'Venta de Activos', 'Ingreso por venta de activos fijos'),
('ING024', 'Fianzas', 'Ingreso por fianzas otorgadas'),
('ING025', 'Aportaciones', 'Aportaciones de socios o inversionistas');

-- Insertando data en tabla categoria_gastos

INSERT INTO categoria_gastos (codigo_cat_gasto, categoria_gasto, descripcion) VALUES
('GAS006', 'Transporte', 'Gastos en transporte de personal y materiales'),
('GAS007', 'Seguros', 'Gastos en pólizas de seguro'),
('GAS008', 'Mantenimiento', 'Gastos en mantenimiento de equipos y edificios'),
('GAS009', 'Capacitación', 'Gastos en capacitación y desarrollo del personal'),
('GAS010', 'Impuestos', 'Gastos por impuestos y contribuciones'),
('GAS011', 'Honorarios', 'Gastos en honorarios profesionales'),
('GAS012', 'Investigación', 'Gastos en investigación y desarrollo'),
('GAS013', 'Tecnología', 'Gastos en tecnología y software'),
('GAS014', 'Gastos Legales', 'Gastos en servicios legales'),
('GAS015', 'Gastos en Viajes', 'Gastos en viajes y viáticos'),
('GAS016', 'Publicidad Digital', 'Gastos en publicidad digital'),
('GAS017', 'Mantenimiento de Vehículos', 'Gastos en mantenimiento de vehículos'),
('GAS018', 'Gastos de Eventos', 'Gastos en organización de eventos'),
('GAS019', 'Gastos de Oficina', 'Gastos en suministros de oficina'),
('GAS020', 'Gastos de Comunicación', 'Gastos en telecomunicaciones'),
('GAS021', 'Gastos de Almacenamiento', 'Gastos por almacenamiento de inventarios'),
('GAS022', 'Gastos de Energía', 'Gastos en consumo de energía eléctrica'),
('GAS023', 'Gastos de Agua', 'Gastos en consumo de agua'),
('GAS024', 'Gastos de Internet', 'Gastos en servicios de internet'),
('GAS025', 'Gastos de Seguridad', 'Gastos en seguridad y vigilancia');

-- Insertando data en tabla proyectos

INSERT INTO proyectos (codigo_proyecto, nombre_proyecto, descripcion_proy, fecha_inicio, fecha_fin, fecha_planificada_fin, estado_proyecto, id_localidad) VALUES
('PROJ001', 'Construcción de Escuela', 'Proyecto para construir una nueva escuela en la localidad', '2025-01-01', NULL, '2025-12-01', 'En Progreso', 1),
('PROJ002', 'Construcción de Hospital', 'Proyecto para construir un nuevo hospital', '2023-02-01', '2024-01-31', '2024-01-15', 'Finalizado', 2),
('PROJ003', 'Construcción de Maternidad', 'Proyecto para construir una maternidad en la comunidad', '2023-03-01', '2023-12-30', '2023-11-15', 'Finalizado', 3),
('PROJ004', 'Construcción de Viaducto', 'Proyecto para construir un viaducto', '2024-10-01', NULL, '2025-10-01', 'En Progreso', 4),
('PROJ005', 'Construcción de Urbanismo', 'Proyecto para construir un nuevo urbanismo', '2023-05-01', '2024-01-31', '2024-02-20', 'Finalizado', 5),
('PROJ006', 'Construcción de Edificios', 'Proyecto para construir un complejo de edificios', '2023-06-01', '2024-06-30', '2024-07-30', 'Finalizado', 6);

-- Insertando data en tabla ingresos

INSERT INTO ingresos (codigo_ingreso, fecha_ingreso, monto_ingreso, id_proyecto, id_categoria_ingreso) VALUES
(1, '2025-01-15', 10000, 1, 1),
(2, '2025-02-15', 15000, 1, 2),
(3, '2025-03-01', 20000, 1, 3),
(4, '2023-03-10', 5000, 3, 4),
(5, '2023-09-15', 7000, 3, 5),
(6, '2023-11-20', 8000, 3, 6),
(7, '2023-05-10', 12000, 5, 7),
(8, '2023-08-20', 15000, 5, 8),
(9, '2023-12-15', 22000, 5, 9),
(10, '2024-02-01', 18000, 2, 10),
(11, '2024-04-15', 21000, 2, 11),
(12, '2024-12-01', 19000, 2, 12),
(13, '2024-11-10', 16000, 4, 13),
(14, '2025-01-10', 19000, 4, 14),
(15, '2025-02-10', 25000, 4, 15),
(16, '2023-06-15', 17000, 6, 16),
(17, '2023-07-20', 19000, 6, 17),
(18, '2023-08-10', 21000, 6, 18),
(19, '2024-01-15', 13000, 5, 19),
(20, '2023-12-20', 20000, 3, 20),
(21, '2025-03-01', 11000, 1, 18),
(22, '2024-03-10', 14000, 2, 17),
(23, '2023-11-15', 16000, 3, 15),
(24, '2024-05-01', 12000, 2, 12),
(25, '2025-03-15', 30000, 1, 11),
(26, '2024-05-15', 19000, 4, 1),
(27, '2023-06-20', 23000, 6, 2),
(28, '2023-07-10', 15000, 5, 3),
(29, '2023-09-30', 17000, 6, 4),
(30, '2024-02-20', 14000, 2, 5),
(31, '2024-03-20', 16000, 2, 6),
(32, '2023-10-15', 21000, 3, 7),
(33, '2023-08-25', 18000, 5, 8),
(34, '2024-12-15', 13000, 2, 9),
(35, '2025-01-05', 12000, 4, 10),
(36, '2024-11-25', 20000, 4, 11),
(37, '2025-02-05', 15000, 4, 12),
(38, '2023-12-05', 17000, 6, 13),
(39, '2023-11-30', 19000, 3, 14),
(40, '2025-03-10', 22000, 1, 15);

-- Insertando data en tabla gastos

INSERT INTO gastos (codigo_gasto, fecha_gato, monto_gasto, id_proyecto, id_categoria_gasto) VALUES
(1, '2025-01-20', 5000, 1, 1),
(2, '2025-02-20', 7000, 1, 2),
(3, '2025-03-05', 9000, 1, 3),
(4, '2023-03-15', 3000, 3, 4),
(5, '2023-09-25', 4000, 3, 5),
(6, '2023-11-30', 4500, 3, 6),
(7, '2023-05-20', 6000, 5, 7),
(8, '2023-09-10', 8000, 5, 8),
(9, '2023-12-10', 10000, 5, 9),
(10, '2024-02-05', 9000, 2, 10),
(11, '2024-04-20', 11000, 2, 11),
(12, '2024-12-15', 9500, 2, 12),
(13, '2024-11-15', 8500, 4, 13),
(14, '2025-01-20', 10500, 4, 14),
(15, '2025-02-15', 12000, 4, 15),
(16, '2023-06-20', 7000, 6, 16),
(17, '2023-07-25', 9000, 6, 17),
(18, '2023-08-15', 11000, 6, 18),
(19, '2024-01-20', 8000, 5, 19),
(20, '2023-12-25', 9500, 3, 20),
(21, '2025-03-05', 6500, 1, 19),
(22, '2024-03-15', 7500, 2, 18),
(23, '2023-11-20', 8300, 3, 17),
(24, '2024-05-05', 6000, 2, 16),
(25, '2025-03-10', 14000, 1, 15),
(26, '2024-05-20', 8500, 4, 1),
(27, '2023-06-25', 13000, 6, 2),
(28, '2023-07-15', 9000, 5, 3),
(29, '2023-10-20', 12000, 6, 4),
(30, '2024-02-25', 7000, 2, 5),
(31, '2024-03-30', 8000, 2, 6),
(32, '2023-10-01', 10000, 3, 7),
(33, '2023-08-30', 9500, 5, 8),
(34, '2024-12-10', 6000, 2, 9),
(35, '2025-01-10', 5500, 4, 10),
(36, '2024-11-30', 12000, 4, 11),
(37, '2025-02-20', 9000, 4, 12),
(38, '2023-12-15', 8500, 6, 13),
(39, '2023-11-25', 10000, 3, 14),
(40, '2025-03-15', 13000, 1, 15);

-- Insertando data en tabla presupuesto_planificado

INSERT INTO presupuesto_planificado (codigo_presupuesto, monto_planificado, fecha_registro, id_proyecto) VALUES
(1, 100000, '2025-01-01', 1),
(2, 150000, '2025-02-01', 1),
(3, 200000, '2025-03-01', 1),
(4, 50000, '2023-02-01', 2),
(5, 70000, '2023-03-01', 2),
(6, 60000, '2023-04-01', 2),
(7, 120000, '2023-05-01', 5),
(8, 150000, '2023-06-01', 5),
(9, 180000, '2023-07-01', 5),
(10, 90000, '2024-01-01', 2),
(11, 110000, '2024-02-01', 2),
(12, 130000, '2024-03-01', 2),
(13, 85000, '2024-10-01', 4),
(14, 95000, '2024-11-01', 4),
(15, 105000, '2025-01-01', 4),
(16, 70000, '2023-06-01', 6),
(17, 80000, '2023-07-01', 6),
(18, 90000, '2023-08-01', 6),
(19, 75000, '2023-12-01', 5),
(20, 80000, '2023-11-01', 3),
(21, 110000, '2025-01-01', 1),
(22, 95000, '2024-02-01', 2),
(23, 65000, '2023-09-01', 3),
(24, 90000, '2024-05-01', 2),
(25, 150000, '2025-02-01', 1),
(26, 100000, '2024-05-01', 4),
(27, 70000, '2023-06-01', 6),
(28, 80000, '2023-07-01', 5),
(29, 60000, '2023-10-01', 6),
(30, 90000, '2024-01-01', 2),
(31, 110000, '2024-02-01', 2),
(32, 98000, '2023-11-01', 3),
(33, 82000, '2023-08-01', 5),
(34, 75000, '2024-12-01', 2),
(35, 85000, '2025-01-01', 4),
(36, 95000, '2024-11-01', 4),
(37, 90000, '2025-02-01', 4),
(38, 78000, '2023-12-01', 6),
(39, 67000, '2023-11-01', 3),
(40, 85000, '2025-03-01', 1);

-- Insertando data en tabla metricas_financieras

INSERT INTO metricas_financieras (codigo_metrica, valor_actual_neto, tasa_interna_retorno, retorno_inversion, fecha_calculo, id_proyecto) VALUES
(1, 50000, 0.05, 0.10, '2025-01-20', 1),
(2, 70000, 0.06, 0.12, '2025-02-20', 1),
(3, 90000, 0.07, 0.15, '2025-03-05', 1),
(4, 20000, 0.03, 0.04, '2023-03-20', 3),
(5, 25000, 0.04, 0.05, '2023-09-20', 3),
(6, 30000, 0.05, 0.06, '2023-12-30', 3),
(7, 35000, 0.04, 0.07, '2023-05-15', 5),
(8, 40000, 0.05, 0.08, '2023-09-01', 5),
(9, 45000, 0.06, 0.09, '2023-12-01', 5),
(10, 60000, 0.05, 0.11, '2024-01-15', 2),
(11, 65000, 0.06, 0.12, '2024-04-01', 2),
(12, 70000, 0.07, 0.13, '2024-12-01', 2),
(13, 80000, 0.06, 0.15, '2024-11-15', 4),
(14, 90000, 0.07, 0.16, '2025-01-15', 4),
(15, 100000, 0.08, 0.18, '2025-02-15', 4),
(16, 30000, 0.05, 0.09, '2023-06-25', 6),
(17, 35000, 0.05, 0.10, '2023-07-30', 6),
(18, 40000, 0.06, 0.11, '2023-08-20', 6),
(19, 25000, 0.04, 0.06, '2024-01-25', 5),
(20, 30000, 0.04, 0.07, '2023-12-15', 3),
(21, 45000, 0.05, 0.10, '2025-03-01', 1),
(22, 50000, 0.05, 0.11, '2024-03-10', 2),
(23, 55000, 0.04, 0.08, '2023-11-30', 3),
(24, 60000, 0.05, 0.09, '2024-05-15', 2),
(25, 70000, 0.07, 0.15, '2025-03-10', 1),
(26, 80000, 0.05, 0.12, '2024-05-20', 4),
(27, 90000, 0.06, 0.14, '2023-07-15', 6),
(28, 30000, 0.05, 0.09, '2023-08-10', 5),
(29, 40000, 0.06, 0.10, '2023-10-20', 6),
(30, 50000, 0.07, 0.11, '2024-01-20', 2),
(31, 60000, 0.08, 0.12, '2024-02-20', 2),
(32, 70000, 0.07, 0.13, '2023-10-15', 3),
(33, 80000, 0.06, 0.14, '2023-08-30', 5),
(34, 90000, 0.05, 0.15, '2024-12-01', 2),
(35, 100000, 0.06, 0.16, '2025-01-10', 4),
(36, 110000, 0.07, 0.18, '2024-11-30', 4),
(37, 120000, 0.08, 0.19, '2025-02-20', 4),
(38, 130000, 0.07, 0.20, '2023-12-15', 6),
(39, 140000, 0.08, 0.21, '2023-11-25', 3),
(40, 150000, 0.09, 0.22, '2025-03-15', 1);

-- Insertando data en tabla fechas

-- Esta tabla toma en consideración la fecha menor, en este caso la fecha de inicio del primer proyecto comoenzado por la empresa
	select min(fecha_fin)
	from proyectos;
-- Fecha menor = 2023-02-01
-- Fecha tope = 2026-01-01 (o puede ser la máxima fecha encontrada en la tabla proyectos

DECLARE @FechaInicio DATE = '2023-02-01';
DECLARE @FechaTope DATE = '2026-01-01';

WHILE @FechaInicio <= @FechaTope
BEGIN
	INSERT INTO fechas (fecha) VALUES (@FechaInicio)
	SET @FechaInicio = DATEADD(DAY, 1, @FechaInicio)
END;

-- verificando la inserción de fechas
select * from fechas;