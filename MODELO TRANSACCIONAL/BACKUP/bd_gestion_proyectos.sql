USE [master]
GO
/****** Object:  Database [bd_gestion_proyectos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
CREATE DATABASE [bd_gestion_proyectos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_gestion_proyectos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bd_gestion_proyectos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_gestion_proyectos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bd_gestion_proyectos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bd_gestion_proyectos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_gestion_proyectos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_gestion_proyectos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_gestion_proyectos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_gestion_proyectos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET RECOVERY FULL 
GO
ALTER DATABASE [bd_gestion_proyectos] SET  MULTI_USER 
GO
ALTER DATABASE [bd_gestion_proyectos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_gestion_proyectos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_gestion_proyectos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_gestion_proyectos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd_gestion_proyectos', N'ON'
GO
ALTER DATABASE [bd_gestion_proyectos] SET QUERY_STORE = ON
GO
ALTER DATABASE [bd_gestion_proyectos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bd_gestion_proyectos]
GO
/****** Object:  User [carlosv]    Script Date: 10/4/2025 6:51:45 p. m. ******/
CREATE USER [carlosv] FOR LOGIN [carlosv] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[proyectos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proyectos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_proyecto] [varchar](10) NOT NULL,
	[nombre_proyecto] [varchar](155) NOT NULL,
	[descripcion_proy] [varchar](max) NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
	[fecha_planificada_fin] [date] NOT NULL,
	[estado_proyecto] [varchar](55) NOT NULL,
	[id_localidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[dim_Proyecto]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dim_Proyecto] as
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
GO
/****** Object:  Table [dbo].[categoria_gastos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_gastos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_cat_gasto] [varchar](10) NOT NULL,
	[categoria_gasto] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[dim_Categoria_Gasto]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dim_Categoria_Gasto] as
select
    cg.id,
    cg.codigo_cat_gasto,
    cg.categoria_gasto,
    cg.descripcion
from categoria_gastos cg;
GO
/****** Object:  Table [dbo].[localidad]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_estado] [varchar](5) NOT NULL,
	[estado] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[dim_Localidad]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[dim_Localidad] as
select
    loc.id,
    loc.codigo_estado,
    loc.estado,
    loc.region,
    loc.pais
from localidad loc;
GO
/****** Object:  Table [dbo].[gastos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gastos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_gasto] [varchar](10) NOT NULL,
	[fecha_gato] [date] NOT NULL,
	[monto_gasto] [money] NOT NULL,
	[id_proyecto] [int] NOT NULL,
	[id_categoria_gasto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[fct_Gastos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[fct_Gastos] as
select
    g.id,
    g.fecha_gato,
    g.monto_gasto,
    g.id_proyecto,
    g.id_categoria_gasto
from gastos g;
GO
/****** Object:  Table [dbo].[presupuesto_planificado]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presupuesto_planificado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_presupuesto] [varchar](10) NOT NULL,
	[monto_planificado] [money] NOT NULL,
	[fecha_registro] [date] NOT NULL,
	[id_proyecto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[fct_Presupuesto_Planificado]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[fct_Presupuesto_Planificado] as
select
    pp.id,
    pp.fecha_registro,
    pp.monto_planificado,
    pp.id_proyecto
from presupuesto_planificado pp;
GO
/****** Object:  Table [dbo].[categoria_ingresos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_ingresos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_cat_ingreso] [varchar](10) NOT NULL,
	[categoria_ingreso] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fechas]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fechas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingresos]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingresos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_ingreso] [varchar](10) NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
	[monto_ingreso] [money] NOT NULL,
	[id_proyecto] [int] NOT NULL,
	[id_categoria_ingreso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metricas_financieras]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metricas_financieras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_metrica] [varchar](10) NOT NULL,
	[valor_actual_neto] [money] NOT NULL,
	[tasa_interna_retorno] [decimal](5, 4) NOT NULL,
	[retorno_inversion] [decimal](5, 4) NOT NULL,
	[fecha_calculo] [date] NOT NULL,
	[id_proyecto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categoria_gastos] ON 

INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (1, N'GAS006', N'Transporte', N'Gastos en transporte de personal y materiales')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (2, N'GAS007', N'Seguros', N'Gastos en pólizas de seguro')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (3, N'GAS008', N'Mantenimiento', N'Gastos en mantenimiento de equipos y edificios')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (4, N'GAS009', N'Capacitación', N'Gastos en capacitación y desarrollo del personal')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (5, N'GAS010', N'Impuestos', N'Gastos por impuestos y contribuciones')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (6, N'GAS011', N'Honorarios', N'Gastos en honorarios profesionales')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (7, N'GAS012', N'Investigación', N'Gastos en investigación y desarrollo')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (8, N'GAS013', N'Tecnología', N'Gastos en tecnología y software')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (9, N'GAS014', N'Gastos Legales', N'Gastos en servicios legales')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (10, N'GAS015', N'Gastos en Viajes', N'Gastos en viajes y viáticos')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (11, N'GAS016', N'Publicidad Digital', N'Gastos en publicidad digital')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (12, N'GAS017', N'Mantenimiento de Vehículos', N'Gastos en mantenimiento de vehículos')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (13, N'GAS018', N'Gastos de Eventos', N'Gastos en organización de eventos')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (14, N'GAS019', N'Gastos de Oficina', N'Gastos en suministros de oficina')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (15, N'GAS020', N'Gastos de Comunicación', N'Gastos en telecomunicaciones')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (16, N'GAS021', N'Gastos de Almacenamiento', N'Gastos por almacenamiento de inventarios')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (17, N'GAS022', N'Gastos de Energía', N'Gastos en consumo de energía eléctrica')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (18, N'GAS023', N'Gastos de Agua', N'Gastos en consumo de agua')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (19, N'GAS024', N'Gastos de Internet', N'Gastos en servicios de internet')
INSERT [dbo].[categoria_gastos] ([id], [codigo_cat_gasto], [categoria_gasto], [descripcion]) VALUES (20, N'GAS025', N'Gastos de Seguridad', N'Gastos en seguridad y vigilancia')
SET IDENTITY_INSERT [dbo].[categoria_gastos] OFF
GO
SET IDENTITY_INSERT [dbo].[categoria_ingresos] ON 

INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (1, N'ING006', N'Intereses', N'Ingresos por intereses generados')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (2, N'ING007', N'Alquiler', N'Ingresos por alquiler de propiedades')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (3, N'ING008', N'Comisiones', N'Ingresos por comisiones de ventas')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (4, N'ING009', N'Subvenciones', N'Ingresos por subvenciones y apoyos')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (5, N'ING010', N'Honorarios', N'Ingresos por honorarios profesionales')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (6, N'ING011', N'Licencias', N'Ingresos por venta de licencias')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (7, N'ING012', N'Multas', N'Ingresos por multas recaudadas')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (8, N'ING013', N'Patrocinios', N'Ingresos por patrocinios recibidos')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (9, N'ING014', N'Intercambios', N'Ingresos por intercambios de bienes o servicios')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (10, N'ING015', N'Recuperación', N'Recuperación de ingresos por cuentas incobrables')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (11, N'ING016', N'Otros', N'Otros ingresos no especificados')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (12, N'ING017', N'Recursos', N'Ingresos por recursos naturales')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (13, N'ING018', N'Rentas', N'Ingresos por rentas de bienes inmuebles')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (14, N'ING019', N'Préstamos', N'Ingresos por préstamos otorgados')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (15, N'ING020', N'Inversiones Externas', N'Ingresos por inversiones realizadas en el extranjero')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (16, N'ING021', N'Dividendos', N'Ingresos por dividendos de acciones')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (17, N'ING022', N'Intereses Ganados', N'Intereses ganados por cuentas de ahorro')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (18, N'ING023', N'Venta de Activos', N'Ingreso por venta de activos fijos')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (19, N'ING024', N'Fianzas', N'Ingreso por fianzas otorgadas')
INSERT [dbo].[categoria_ingresos] ([id], [codigo_cat_ingreso], [categoria_ingreso], [descripcion]) VALUES (20, N'ING025', N'Aportaciones', N'Aportaciones de socios o inversionistas')
SET IDENTITY_INSERT [dbo].[categoria_ingresos] OFF
GO
SET IDENTITY_INSERT [dbo].[fechas] ON 

INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1, CAST(N'2023-02-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (2, CAST(N'2023-02-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (3, CAST(N'2023-02-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (4, CAST(N'2023-02-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (5, CAST(N'2023-02-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (6, CAST(N'2023-02-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (7, CAST(N'2023-02-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (8, CAST(N'2023-02-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (9, CAST(N'2023-02-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (10, CAST(N'2023-02-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (11, CAST(N'2023-02-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (12, CAST(N'2023-02-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (13, CAST(N'2023-02-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (14, CAST(N'2023-02-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (15, CAST(N'2023-02-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (16, CAST(N'2023-02-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (17, CAST(N'2023-02-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (18, CAST(N'2023-02-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (19, CAST(N'2023-02-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (20, CAST(N'2023-02-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (21, CAST(N'2023-02-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (22, CAST(N'2023-02-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (23, CAST(N'2023-02-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (24, CAST(N'2023-02-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (25, CAST(N'2023-02-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (26, CAST(N'2023-02-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (27, CAST(N'2023-02-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (28, CAST(N'2023-02-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (29, CAST(N'2023-03-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (30, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (31, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (32, CAST(N'2023-03-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (33, CAST(N'2023-03-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (34, CAST(N'2023-03-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (35, CAST(N'2023-03-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (36, CAST(N'2023-03-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (37, CAST(N'2023-03-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (38, CAST(N'2023-03-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (39, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (40, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (41, CAST(N'2023-03-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (42, CAST(N'2023-03-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (43, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (44, CAST(N'2023-03-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (45, CAST(N'2023-03-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (46, CAST(N'2023-03-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (47, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (48, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (49, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (50, CAST(N'2023-03-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (51, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (52, CAST(N'2023-03-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (53, CAST(N'2023-03-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (54, CAST(N'2023-03-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (55, CAST(N'2023-03-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (56, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (57, CAST(N'2023-03-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (58, CAST(N'2023-03-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (59, CAST(N'2023-03-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (60, CAST(N'2023-04-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (61, CAST(N'2023-04-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (62, CAST(N'2023-04-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (63, CAST(N'2023-04-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (64, CAST(N'2023-04-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (65, CAST(N'2023-04-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (66, CAST(N'2023-04-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (67, CAST(N'2023-04-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (68, CAST(N'2023-04-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (69, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (70, CAST(N'2023-04-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (71, CAST(N'2023-04-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (72, CAST(N'2023-04-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (73, CAST(N'2023-04-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (74, CAST(N'2023-04-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (75, CAST(N'2023-04-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (76, CAST(N'2023-04-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (77, CAST(N'2023-04-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (78, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (79, CAST(N'2023-04-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (80, CAST(N'2023-04-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (81, CAST(N'2023-04-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (82, CAST(N'2023-04-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (83, CAST(N'2023-04-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (84, CAST(N'2023-04-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (85, CAST(N'2023-04-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (86, CAST(N'2023-04-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (87, CAST(N'2023-04-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (88, CAST(N'2023-04-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (89, CAST(N'2023-04-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (90, CAST(N'2023-05-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (91, CAST(N'2023-05-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (92, CAST(N'2023-05-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (93, CAST(N'2023-05-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (94, CAST(N'2023-05-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (95, CAST(N'2023-05-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (96, CAST(N'2023-05-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (97, CAST(N'2023-05-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (98, CAST(N'2023-05-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (99, CAST(N'2023-05-10' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (100, CAST(N'2023-05-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (101, CAST(N'2023-05-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (102, CAST(N'2023-05-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (103, CAST(N'2023-05-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (104, CAST(N'2023-05-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (105, CAST(N'2023-05-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (106, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (107, CAST(N'2023-05-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (108, CAST(N'2023-05-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (109, CAST(N'2023-05-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (110, CAST(N'2023-05-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (111, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (112, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (113, CAST(N'2023-05-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (114, CAST(N'2023-05-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (115, CAST(N'2023-05-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (116, CAST(N'2023-05-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (117, CAST(N'2023-05-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (118, CAST(N'2023-05-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (119, CAST(N'2023-05-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (120, CAST(N'2023-05-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (121, CAST(N'2023-06-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (122, CAST(N'2023-06-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (123, CAST(N'2023-06-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (124, CAST(N'2023-06-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (125, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (126, CAST(N'2023-06-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (127, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (128, CAST(N'2023-06-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (129, CAST(N'2023-06-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (130, CAST(N'2023-06-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (131, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (132, CAST(N'2023-06-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (133, CAST(N'2023-06-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (134, CAST(N'2023-06-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (135, CAST(N'2023-06-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (136, CAST(N'2023-06-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (137, CAST(N'2023-06-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (138, CAST(N'2023-06-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (139, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (140, CAST(N'2023-06-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (141, CAST(N'2023-06-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (142, CAST(N'2023-06-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (143, CAST(N'2023-06-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (144, CAST(N'2023-06-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (145, CAST(N'2023-06-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (146, CAST(N'2023-06-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (147, CAST(N'2023-06-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (148, CAST(N'2023-06-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (149, CAST(N'2023-06-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (150, CAST(N'2023-06-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (151, CAST(N'2023-07-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (152, CAST(N'2023-07-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (153, CAST(N'2023-07-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (154, CAST(N'2023-07-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (155, CAST(N'2023-07-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (156, CAST(N'2023-07-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (157, CAST(N'2023-07-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (158, CAST(N'2023-07-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (159, CAST(N'2023-07-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (160, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (161, CAST(N'2023-07-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (162, CAST(N'2023-07-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (163, CAST(N'2023-07-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (164, CAST(N'2023-07-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (165, CAST(N'2023-07-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (166, CAST(N'2023-07-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (167, CAST(N'2023-07-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (168, CAST(N'2023-07-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (169, CAST(N'2023-07-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (170, CAST(N'2023-07-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (171, CAST(N'2023-07-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (172, CAST(N'2023-07-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (173, CAST(N'2023-07-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (174, CAST(N'2023-07-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (175, CAST(N'2023-07-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (176, CAST(N'2023-07-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (177, CAST(N'2023-07-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (178, CAST(N'2023-07-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (179, CAST(N'2023-07-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (180, CAST(N'2023-07-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (181, CAST(N'2023-07-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (182, CAST(N'2023-08-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (183, CAST(N'2023-08-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (184, CAST(N'2023-08-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (185, CAST(N'2023-08-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (186, CAST(N'2023-08-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (187, CAST(N'2023-08-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (188, CAST(N'2023-08-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (189, CAST(N'2023-08-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (190, CAST(N'2023-08-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (191, CAST(N'2023-08-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (192, CAST(N'2023-08-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (193, CAST(N'2023-08-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (194, CAST(N'2023-08-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (195, CAST(N'2023-08-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (196, CAST(N'2023-08-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (197, CAST(N'2023-08-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (198, CAST(N'2023-08-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (199, CAST(N'2023-08-18' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (200, CAST(N'2023-08-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (201, CAST(N'2023-08-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (202, CAST(N'2023-08-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (203, CAST(N'2023-08-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (204, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (205, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (206, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (207, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (208, CAST(N'2023-08-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (209, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (210, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (211, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (212, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (213, CAST(N'2023-09-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (214, CAST(N'2023-09-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (215, CAST(N'2023-09-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (216, CAST(N'2023-09-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (217, CAST(N'2023-09-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (218, CAST(N'2023-09-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (219, CAST(N'2023-09-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (220, CAST(N'2023-09-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (221, CAST(N'2023-09-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (222, CAST(N'2023-09-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (223, CAST(N'2023-09-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (224, CAST(N'2023-09-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (225, CAST(N'2023-09-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (226, CAST(N'2023-09-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (227, CAST(N'2023-09-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (228, CAST(N'2023-09-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (229, CAST(N'2023-09-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (230, CAST(N'2023-09-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (231, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (232, CAST(N'2023-09-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (233, CAST(N'2023-09-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (234, CAST(N'2023-09-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (235, CAST(N'2023-09-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (236, CAST(N'2023-09-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (237, CAST(N'2023-09-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (238, CAST(N'2023-09-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (239, CAST(N'2023-09-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (240, CAST(N'2023-09-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (241, CAST(N'2023-09-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (242, CAST(N'2023-09-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (243, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (244, CAST(N'2023-10-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (245, CAST(N'2023-10-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (246, CAST(N'2023-10-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (247, CAST(N'2023-10-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (248, CAST(N'2023-10-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (249, CAST(N'2023-10-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (250, CAST(N'2023-10-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (251, CAST(N'2023-10-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (252, CAST(N'2023-10-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (253, CAST(N'2023-10-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (254, CAST(N'2023-10-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (255, CAST(N'2023-10-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (256, CAST(N'2023-10-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (257, CAST(N'2023-10-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (258, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (259, CAST(N'2023-10-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (260, CAST(N'2023-10-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (261, CAST(N'2023-10-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (262, CAST(N'2023-10-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (263, CAST(N'2023-10-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (264, CAST(N'2023-10-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (265, CAST(N'2023-10-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (266, CAST(N'2023-10-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (267, CAST(N'2023-10-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (268, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (269, CAST(N'2023-10-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (270, CAST(N'2023-10-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (271, CAST(N'2023-10-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (272, CAST(N'2023-10-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (273, CAST(N'2023-10-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (274, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (275, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (276, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (277, CAST(N'2023-11-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (278, CAST(N'2023-11-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (279, CAST(N'2023-11-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (280, CAST(N'2023-11-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (281, CAST(N'2023-11-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (282, CAST(N'2023-11-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (283, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (284, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (285, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (286, CAST(N'2023-11-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (287, CAST(N'2023-11-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (288, CAST(N'2023-11-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (289, CAST(N'2023-11-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (290, CAST(N'2023-11-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (291, CAST(N'2023-11-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (292, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (293, CAST(N'2023-11-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (294, CAST(N'2023-11-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (295, CAST(N'2023-11-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (296, CAST(N'2023-11-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (297, CAST(N'2023-11-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (298, CAST(N'2023-11-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (299, CAST(N'2023-11-26' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (300, CAST(N'2023-11-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (301, CAST(N'2023-11-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (302, CAST(N'2023-11-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (303, CAST(N'2023-11-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (304, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (305, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (306, CAST(N'2023-12-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (307, CAST(N'2023-12-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (308, CAST(N'2023-12-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (309, CAST(N'2023-12-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (310, CAST(N'2023-12-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (311, CAST(N'2023-12-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (312, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (313, CAST(N'2023-12-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (314, CAST(N'2023-12-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (315, CAST(N'2023-12-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (316, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (317, CAST(N'2023-12-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (318, CAST(N'2023-12-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (319, CAST(N'2023-12-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (320, CAST(N'2023-12-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (321, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (322, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (323, CAST(N'2023-12-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (324, CAST(N'2023-12-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (325, CAST(N'2023-12-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (326, CAST(N'2023-12-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (327, CAST(N'2023-12-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (328, CAST(N'2023-12-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (329, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (330, CAST(N'2023-12-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (331, CAST(N'2023-12-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (332, CAST(N'2023-12-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (333, CAST(N'2023-12-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (334, CAST(N'2023-12-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (335, CAST(N'2024-01-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (336, CAST(N'2024-01-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (337, CAST(N'2024-01-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (338, CAST(N'2024-01-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (339, CAST(N'2024-01-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (340, CAST(N'2024-01-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (341, CAST(N'2024-01-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (342, CAST(N'2024-01-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (343, CAST(N'2024-01-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (344, CAST(N'2024-01-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (345, CAST(N'2024-01-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (346, CAST(N'2024-01-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (347, CAST(N'2024-01-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (348, CAST(N'2024-01-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (349, CAST(N'2024-01-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (350, CAST(N'2024-01-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (351, CAST(N'2024-01-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (352, CAST(N'2024-01-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (353, CAST(N'2024-01-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (354, CAST(N'2024-01-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (355, CAST(N'2024-01-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (356, CAST(N'2024-01-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (357, CAST(N'2024-01-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (358, CAST(N'2024-01-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (359, CAST(N'2024-01-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (360, CAST(N'2024-01-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (361, CAST(N'2024-01-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (362, CAST(N'2024-01-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (363, CAST(N'2024-01-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (364, CAST(N'2024-01-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (365, CAST(N'2024-01-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (366, CAST(N'2024-02-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (367, CAST(N'2024-02-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (368, CAST(N'2024-02-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (369, CAST(N'2024-02-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (370, CAST(N'2024-02-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (371, CAST(N'2024-02-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (372, CAST(N'2024-02-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (373, CAST(N'2024-02-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (374, CAST(N'2024-02-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (375, CAST(N'2024-02-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (376, CAST(N'2024-02-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (377, CAST(N'2024-02-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (378, CAST(N'2024-02-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (379, CAST(N'2024-02-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (380, CAST(N'2024-02-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (381, CAST(N'2024-02-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (382, CAST(N'2024-02-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (383, CAST(N'2024-02-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (384, CAST(N'2024-02-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (385, CAST(N'2024-02-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (386, CAST(N'2024-02-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (387, CAST(N'2024-02-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (388, CAST(N'2024-02-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (389, CAST(N'2024-02-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (390, CAST(N'2024-02-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (391, CAST(N'2024-02-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (392, CAST(N'2024-02-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (393, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (394, CAST(N'2024-02-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (395, CAST(N'2024-03-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (396, CAST(N'2024-03-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (397, CAST(N'2024-03-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (398, CAST(N'2024-03-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (399, CAST(N'2024-03-05' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (400, CAST(N'2024-03-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (401, CAST(N'2024-03-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (402, CAST(N'2024-03-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (403, CAST(N'2024-03-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (404, CAST(N'2024-03-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (405, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (406, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (407, CAST(N'2024-03-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (408, CAST(N'2024-03-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (409, CAST(N'2024-03-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (410, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (411, CAST(N'2024-03-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (412, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (413, CAST(N'2024-03-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (414, CAST(N'2024-03-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (415, CAST(N'2024-03-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (416, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (417, CAST(N'2024-03-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (418, CAST(N'2024-03-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (419, CAST(N'2024-03-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (420, CAST(N'2024-03-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (421, CAST(N'2024-03-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (422, CAST(N'2024-03-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (423, CAST(N'2024-03-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (424, CAST(N'2024-03-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (425, CAST(N'2024-03-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (426, CAST(N'2024-04-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (427, CAST(N'2024-04-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (428, CAST(N'2024-04-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (429, CAST(N'2024-04-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (430, CAST(N'2024-04-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (431, CAST(N'2024-04-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (432, CAST(N'2024-04-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (433, CAST(N'2024-04-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (434, CAST(N'2024-04-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (435, CAST(N'2024-04-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (436, CAST(N'2024-04-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (437, CAST(N'2024-04-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (438, CAST(N'2024-04-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (439, CAST(N'2024-04-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (440, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (441, CAST(N'2024-04-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (442, CAST(N'2024-04-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (443, CAST(N'2024-04-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (444, CAST(N'2024-04-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (445, CAST(N'2024-04-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (446, CAST(N'2024-04-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (447, CAST(N'2024-04-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (448, CAST(N'2024-04-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (449, CAST(N'2024-04-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (450, CAST(N'2024-04-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (451, CAST(N'2024-04-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (452, CAST(N'2024-04-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (453, CAST(N'2024-04-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (454, CAST(N'2024-04-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (455, CAST(N'2024-04-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (456, CAST(N'2024-05-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (457, CAST(N'2024-05-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (458, CAST(N'2024-05-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (459, CAST(N'2024-05-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (460, CAST(N'2024-05-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (461, CAST(N'2024-05-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (462, CAST(N'2024-05-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (463, CAST(N'2024-05-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (464, CAST(N'2024-05-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (465, CAST(N'2024-05-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (466, CAST(N'2024-05-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (467, CAST(N'2024-05-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (468, CAST(N'2024-05-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (469, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (470, CAST(N'2024-05-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (471, CAST(N'2024-05-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (472, CAST(N'2024-05-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (473, CAST(N'2024-05-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (474, CAST(N'2024-05-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (475, CAST(N'2024-05-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (476, CAST(N'2024-05-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (477, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (478, CAST(N'2024-05-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (479, CAST(N'2024-05-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (480, CAST(N'2024-05-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (481, CAST(N'2024-05-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (482, CAST(N'2024-05-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (483, CAST(N'2024-05-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (484, CAST(N'2024-05-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (485, CAST(N'2024-05-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (486, CAST(N'2024-05-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (487, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (488, CAST(N'2024-06-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (489, CAST(N'2024-06-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (490, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (491, CAST(N'2024-06-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (492, CAST(N'2024-06-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (493, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (494, CAST(N'2024-06-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (495, CAST(N'2024-06-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (496, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (497, CAST(N'2024-06-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (498, CAST(N'2024-06-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (499, CAST(N'2024-06-13' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (500, CAST(N'2024-06-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (501, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (502, CAST(N'2024-06-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (503, CAST(N'2024-06-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (504, CAST(N'2024-06-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (505, CAST(N'2024-06-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (506, CAST(N'2024-06-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (507, CAST(N'2024-06-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (508, CAST(N'2024-06-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (509, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (510, CAST(N'2024-06-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (511, CAST(N'2024-06-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (512, CAST(N'2024-06-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (513, CAST(N'2024-06-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (514, CAST(N'2024-06-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (515, CAST(N'2024-06-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (516, CAST(N'2024-06-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (517, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (518, CAST(N'2024-07-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (519, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (520, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (521, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (522, CAST(N'2024-07-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (523, CAST(N'2024-07-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (524, CAST(N'2024-07-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (525, CAST(N'2024-07-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (526, CAST(N'2024-07-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (527, CAST(N'2024-07-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (528, CAST(N'2024-07-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (529, CAST(N'2024-07-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (530, CAST(N'2024-07-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (531, CAST(N'2024-07-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (532, CAST(N'2024-07-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (533, CAST(N'2024-07-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (534, CAST(N'2024-07-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (535, CAST(N'2024-07-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (536, CAST(N'2024-07-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (537, CAST(N'2024-07-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (538, CAST(N'2024-07-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (539, CAST(N'2024-07-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (540, CAST(N'2024-07-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (541, CAST(N'2024-07-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (542, CAST(N'2024-07-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (543, CAST(N'2024-07-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (544, CAST(N'2024-07-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (545, CAST(N'2024-07-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (546, CAST(N'2024-07-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (547, CAST(N'2024-07-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (548, CAST(N'2024-08-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (549, CAST(N'2024-08-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (550, CAST(N'2024-08-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (551, CAST(N'2024-08-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (552, CAST(N'2024-08-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (553, CAST(N'2024-08-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (554, CAST(N'2024-08-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (555, CAST(N'2024-08-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (556, CAST(N'2024-08-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (557, CAST(N'2024-08-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (558, CAST(N'2024-08-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (559, CAST(N'2024-08-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (560, CAST(N'2024-08-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (561, CAST(N'2024-08-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (562, CAST(N'2024-08-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (563, CAST(N'2024-08-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (564, CAST(N'2024-08-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (565, CAST(N'2024-08-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (566, CAST(N'2024-08-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (567, CAST(N'2024-08-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (568, CAST(N'2024-08-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (569, CAST(N'2024-08-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (570, CAST(N'2024-08-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (571, CAST(N'2024-08-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (572, CAST(N'2024-08-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (573, CAST(N'2024-08-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (574, CAST(N'2024-08-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (575, CAST(N'2024-08-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (576, CAST(N'2024-08-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (577, CAST(N'2024-08-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (578, CAST(N'2024-08-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (579, CAST(N'2024-09-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (580, CAST(N'2024-09-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (581, CAST(N'2024-09-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (582, CAST(N'2024-09-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (583, CAST(N'2024-09-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (584, CAST(N'2024-09-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (585, CAST(N'2024-09-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (586, CAST(N'2024-09-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (587, CAST(N'2024-09-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (588, CAST(N'2024-09-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (589, CAST(N'2024-09-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (590, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (591, CAST(N'2024-09-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (592, CAST(N'2024-09-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (593, CAST(N'2024-09-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (594, CAST(N'2024-09-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (595, CAST(N'2024-09-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (596, CAST(N'2024-09-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (597, CAST(N'2024-09-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (598, CAST(N'2024-09-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (599, CAST(N'2024-09-21' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (600, CAST(N'2024-09-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (601, CAST(N'2024-09-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (602, CAST(N'2024-09-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (603, CAST(N'2024-09-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (604, CAST(N'2024-09-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (605, CAST(N'2024-09-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (606, CAST(N'2024-09-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (607, CAST(N'2024-09-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (608, CAST(N'2024-09-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (609, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (610, CAST(N'2024-10-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (611, CAST(N'2024-10-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (612, CAST(N'2024-10-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (613, CAST(N'2024-10-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (614, CAST(N'2024-10-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (615, CAST(N'2024-10-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (616, CAST(N'2024-10-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (617, CAST(N'2024-10-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (618, CAST(N'2024-10-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (619, CAST(N'2024-10-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (620, CAST(N'2024-10-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (621, CAST(N'2024-10-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (622, CAST(N'2024-10-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (623, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (624, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (625, CAST(N'2024-10-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (626, CAST(N'2024-10-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (627, CAST(N'2024-10-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (628, CAST(N'2024-10-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (629, CAST(N'2024-10-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (630, CAST(N'2024-10-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (631, CAST(N'2024-10-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (632, CAST(N'2024-10-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (633, CAST(N'2024-10-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (634, CAST(N'2024-10-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (635, CAST(N'2024-10-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (636, CAST(N'2024-10-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (637, CAST(N'2024-10-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (638, CAST(N'2024-10-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (639, CAST(N'2024-10-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (640, CAST(N'2024-11-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (641, CAST(N'2024-11-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (642, CAST(N'2024-11-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (643, CAST(N'2024-11-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (644, CAST(N'2024-11-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (645, CAST(N'2024-11-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (646, CAST(N'2024-11-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (647, CAST(N'2024-11-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (648, CAST(N'2024-11-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (649, CAST(N'2024-11-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (650, CAST(N'2024-11-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (651, CAST(N'2024-11-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (652, CAST(N'2024-11-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (653, CAST(N'2024-11-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (654, CAST(N'2024-11-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (655, CAST(N'2024-11-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (656, CAST(N'2024-11-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (657, CAST(N'2024-11-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (658, CAST(N'2024-11-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (659, CAST(N'2024-11-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (660, CAST(N'2024-11-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (661, CAST(N'2024-11-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (662, CAST(N'2024-11-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (663, CAST(N'2024-11-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (664, CAST(N'2024-11-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (665, CAST(N'2024-11-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (666, CAST(N'2024-11-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (667, CAST(N'2024-11-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (668, CAST(N'2024-11-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (669, CAST(N'2024-11-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (670, CAST(N'2024-12-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (671, CAST(N'2024-12-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (672, CAST(N'2024-12-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (673, CAST(N'2024-12-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (674, CAST(N'2024-12-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (675, CAST(N'2024-12-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (676, CAST(N'2024-12-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (677, CAST(N'2024-12-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (678, CAST(N'2024-12-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (679, CAST(N'2024-12-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (680, CAST(N'2024-12-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (681, CAST(N'2024-12-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (682, CAST(N'2024-12-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (683, CAST(N'2024-12-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (684, CAST(N'2024-12-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (685, CAST(N'2024-12-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (686, CAST(N'2024-12-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (687, CAST(N'2024-12-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (688, CAST(N'2024-12-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (689, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (690, CAST(N'2024-12-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (691, CAST(N'2024-12-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (692, CAST(N'2024-12-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (693, CAST(N'2024-12-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (694, CAST(N'2024-12-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (695, CAST(N'2024-12-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (696, CAST(N'2024-12-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (697, CAST(N'2024-12-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (698, CAST(N'2024-12-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (699, CAST(N'2024-12-30' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (700, CAST(N'2024-12-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (701, CAST(N'2025-01-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (702, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (703, CAST(N'2025-01-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (704, CAST(N'2025-01-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (705, CAST(N'2025-01-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (706, CAST(N'2025-01-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (707, CAST(N'2025-01-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (708, CAST(N'2025-01-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (709, CAST(N'2025-01-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (710, CAST(N'2025-01-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (711, CAST(N'2025-01-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (712, CAST(N'2025-01-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (713, CAST(N'2025-01-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (714, CAST(N'2025-01-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (715, CAST(N'2025-01-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (716, CAST(N'2025-01-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (717, CAST(N'2025-01-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (718, CAST(N'2025-01-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (719, CAST(N'2025-01-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (720, CAST(N'2025-01-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (721, CAST(N'2025-01-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (722, CAST(N'2025-01-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (723, CAST(N'2025-01-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (724, CAST(N'2025-01-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (725, CAST(N'2025-01-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (726, CAST(N'2025-01-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (727, CAST(N'2025-01-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (728, CAST(N'2025-01-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (729, CAST(N'2025-01-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (730, CAST(N'2025-01-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (731, CAST(N'2025-01-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (732, CAST(N'2025-02-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (733, CAST(N'2025-02-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (734, CAST(N'2025-02-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (735, CAST(N'2025-02-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (736, CAST(N'2025-02-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (737, CAST(N'2025-02-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (738, CAST(N'2025-02-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (739, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (740, CAST(N'2025-02-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (741, CAST(N'2025-02-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (742, CAST(N'2025-02-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (743, CAST(N'2025-02-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (744, CAST(N'2025-02-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (745, CAST(N'2025-02-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (746, CAST(N'2025-02-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (747, CAST(N'2025-02-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (748, CAST(N'2025-02-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (749, CAST(N'2025-02-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (750, CAST(N'2025-02-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (751, CAST(N'2025-02-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (752, CAST(N'2025-02-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (753, CAST(N'2025-02-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (754, CAST(N'2025-02-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (755, CAST(N'2025-02-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (756, CAST(N'2025-02-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (757, CAST(N'2025-02-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (758, CAST(N'2025-02-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (759, CAST(N'2025-02-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (760, CAST(N'2025-03-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (761, CAST(N'2025-03-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (762, CAST(N'2025-03-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (763, CAST(N'2025-03-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (764, CAST(N'2025-03-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (765, CAST(N'2025-03-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (766, CAST(N'2025-03-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (767, CAST(N'2025-03-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (768, CAST(N'2025-03-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (769, CAST(N'2025-03-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (770, CAST(N'2025-03-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (771, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (772, CAST(N'2025-03-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (773, CAST(N'2025-03-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (774, CAST(N'2025-03-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (775, CAST(N'2025-03-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (776, CAST(N'2025-03-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (777, CAST(N'2025-03-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (778, CAST(N'2025-03-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (779, CAST(N'2025-03-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (780, CAST(N'2025-03-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (781, CAST(N'2025-03-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (782, CAST(N'2025-03-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (783, CAST(N'2025-03-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (784, CAST(N'2025-03-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (785, CAST(N'2025-03-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (786, CAST(N'2025-03-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (787, CAST(N'2025-03-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (788, CAST(N'2025-03-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (789, CAST(N'2025-03-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (790, CAST(N'2025-03-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (791, CAST(N'2025-04-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (792, CAST(N'2025-04-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (793, CAST(N'2025-04-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (794, CAST(N'2025-04-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (795, CAST(N'2025-04-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (796, CAST(N'2025-04-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (797, CAST(N'2025-04-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (798, CAST(N'2025-04-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (799, CAST(N'2025-04-09' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (800, CAST(N'2025-04-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (801, CAST(N'2025-04-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (802, CAST(N'2025-04-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (803, CAST(N'2025-04-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (804, CAST(N'2025-04-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (805, CAST(N'2025-04-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (806, CAST(N'2025-04-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (807, CAST(N'2025-04-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (808, CAST(N'2025-04-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (809, CAST(N'2025-04-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (810, CAST(N'2025-04-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (811, CAST(N'2025-04-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (812, CAST(N'2025-04-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (813, CAST(N'2025-04-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (814, CAST(N'2025-04-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (815, CAST(N'2025-04-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (816, CAST(N'2025-04-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (817, CAST(N'2025-04-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (818, CAST(N'2025-04-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (819, CAST(N'2025-04-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (820, CAST(N'2025-04-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (821, CAST(N'2025-05-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (822, CAST(N'2025-05-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (823, CAST(N'2025-05-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (824, CAST(N'2025-05-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (825, CAST(N'2025-05-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (826, CAST(N'2025-05-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (827, CAST(N'2025-05-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (828, CAST(N'2025-05-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (829, CAST(N'2025-05-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (830, CAST(N'2025-05-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (831, CAST(N'2025-05-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (832, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (833, CAST(N'2025-05-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (834, CAST(N'2025-05-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (835, CAST(N'2025-05-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (836, CAST(N'2025-05-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (837, CAST(N'2025-05-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (838, CAST(N'2025-05-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (839, CAST(N'2025-05-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (840, CAST(N'2025-05-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (841, CAST(N'2025-05-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (842, CAST(N'2025-05-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (843, CAST(N'2025-05-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (844, CAST(N'2025-05-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (845, CAST(N'2025-05-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (846, CAST(N'2025-05-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (847, CAST(N'2025-05-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (848, CAST(N'2025-05-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (849, CAST(N'2025-05-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (850, CAST(N'2025-05-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (851, CAST(N'2025-05-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (852, CAST(N'2025-06-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (853, CAST(N'2025-06-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (854, CAST(N'2025-06-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (855, CAST(N'2025-06-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (856, CAST(N'2025-06-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (857, CAST(N'2025-06-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (858, CAST(N'2025-06-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (859, CAST(N'2025-06-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (860, CAST(N'2025-06-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (861, CAST(N'2025-06-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (862, CAST(N'2025-06-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (863, CAST(N'2025-06-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (864, CAST(N'2025-06-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (865, CAST(N'2025-06-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (866, CAST(N'2025-06-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (867, CAST(N'2025-06-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (868, CAST(N'2025-06-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (869, CAST(N'2025-06-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (870, CAST(N'2025-06-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (871, CAST(N'2025-06-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (872, CAST(N'2025-06-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (873, CAST(N'2025-06-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (874, CAST(N'2025-06-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (875, CAST(N'2025-06-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (876, CAST(N'2025-06-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (877, CAST(N'2025-06-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (878, CAST(N'2025-06-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (879, CAST(N'2025-06-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (880, CAST(N'2025-06-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (881, CAST(N'2025-06-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (882, CAST(N'2025-07-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (883, CAST(N'2025-07-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (884, CAST(N'2025-07-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (885, CAST(N'2025-07-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (886, CAST(N'2025-07-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (887, CAST(N'2025-07-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (888, CAST(N'2025-07-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (889, CAST(N'2025-07-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (890, CAST(N'2025-07-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (891, CAST(N'2025-07-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (892, CAST(N'2025-07-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (893, CAST(N'2025-07-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (894, CAST(N'2025-07-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (895, CAST(N'2025-07-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (896, CAST(N'2025-07-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (897, CAST(N'2025-07-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (898, CAST(N'2025-07-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (899, CAST(N'2025-07-18' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (900, CAST(N'2025-07-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (901, CAST(N'2025-07-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (902, CAST(N'2025-07-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (903, CAST(N'2025-07-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (904, CAST(N'2025-07-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (905, CAST(N'2025-07-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (906, CAST(N'2025-07-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (907, CAST(N'2025-07-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (908, CAST(N'2025-07-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (909, CAST(N'2025-07-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (910, CAST(N'2025-07-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (911, CAST(N'2025-07-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (912, CAST(N'2025-07-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (913, CAST(N'2025-08-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (914, CAST(N'2025-08-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (915, CAST(N'2025-08-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (916, CAST(N'2025-08-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (917, CAST(N'2025-08-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (918, CAST(N'2025-08-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (919, CAST(N'2025-08-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (920, CAST(N'2025-08-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (921, CAST(N'2025-08-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (922, CAST(N'2025-08-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (923, CAST(N'2025-08-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (924, CAST(N'2025-08-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (925, CAST(N'2025-08-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (926, CAST(N'2025-08-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (927, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (928, CAST(N'2025-08-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (929, CAST(N'2025-08-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (930, CAST(N'2025-08-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (931, CAST(N'2025-08-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (932, CAST(N'2025-08-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (933, CAST(N'2025-08-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (934, CAST(N'2025-08-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (935, CAST(N'2025-08-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (936, CAST(N'2025-08-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (937, CAST(N'2025-08-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (938, CAST(N'2025-08-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (939, CAST(N'2025-08-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (940, CAST(N'2025-08-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (941, CAST(N'2025-08-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (942, CAST(N'2025-08-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (943, CAST(N'2025-08-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (944, CAST(N'2025-09-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (945, CAST(N'2025-09-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (946, CAST(N'2025-09-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (947, CAST(N'2025-09-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (948, CAST(N'2025-09-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (949, CAST(N'2025-09-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (950, CAST(N'2025-09-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (951, CAST(N'2025-09-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (952, CAST(N'2025-09-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (953, CAST(N'2025-09-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (954, CAST(N'2025-09-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (955, CAST(N'2025-09-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (956, CAST(N'2025-09-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (957, CAST(N'2025-09-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (958, CAST(N'2025-09-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (959, CAST(N'2025-09-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (960, CAST(N'2025-09-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (961, CAST(N'2025-09-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (962, CAST(N'2025-09-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (963, CAST(N'2025-09-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (964, CAST(N'2025-09-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (965, CAST(N'2025-09-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (966, CAST(N'2025-09-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (967, CAST(N'2025-09-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (968, CAST(N'2025-09-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (969, CAST(N'2025-09-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (970, CAST(N'2025-09-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (971, CAST(N'2025-09-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (972, CAST(N'2025-09-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (973, CAST(N'2025-09-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (974, CAST(N'2025-10-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (975, CAST(N'2025-10-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (976, CAST(N'2025-10-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (977, CAST(N'2025-10-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (978, CAST(N'2025-10-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (979, CAST(N'2025-10-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (980, CAST(N'2025-10-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (981, CAST(N'2025-10-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (982, CAST(N'2025-10-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (983, CAST(N'2025-10-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (984, CAST(N'2025-10-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (985, CAST(N'2025-10-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (986, CAST(N'2025-10-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (987, CAST(N'2025-10-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (988, CAST(N'2025-10-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (989, CAST(N'2025-10-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (990, CAST(N'2025-10-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (991, CAST(N'2025-10-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (992, CAST(N'2025-10-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (993, CAST(N'2025-10-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (994, CAST(N'2025-10-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (995, CAST(N'2025-10-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (996, CAST(N'2025-10-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (997, CAST(N'2025-10-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (998, CAST(N'2025-10-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (999, CAST(N'2025-10-26' AS Date))
GO
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1000, CAST(N'2025-10-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1001, CAST(N'2025-10-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1002, CAST(N'2025-10-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1003, CAST(N'2025-10-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1004, CAST(N'2025-10-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1005, CAST(N'2025-11-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1006, CAST(N'2025-11-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1007, CAST(N'2025-11-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1008, CAST(N'2025-11-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1009, CAST(N'2025-11-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1010, CAST(N'2025-11-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1011, CAST(N'2025-11-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1012, CAST(N'2025-11-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1013, CAST(N'2025-11-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1014, CAST(N'2025-11-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1015, CAST(N'2025-11-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1016, CAST(N'2025-11-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1017, CAST(N'2025-11-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1018, CAST(N'2025-11-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1019, CAST(N'2025-11-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1020, CAST(N'2025-11-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1021, CAST(N'2025-11-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1022, CAST(N'2025-11-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1023, CAST(N'2025-11-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1024, CAST(N'2025-11-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1025, CAST(N'2025-11-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1026, CAST(N'2025-11-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1027, CAST(N'2025-11-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1028, CAST(N'2025-11-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1029, CAST(N'2025-11-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1030, CAST(N'2025-11-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1031, CAST(N'2025-11-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1032, CAST(N'2025-11-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1033, CAST(N'2025-11-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1034, CAST(N'2025-11-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1035, CAST(N'2025-12-01' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1036, CAST(N'2025-12-02' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1037, CAST(N'2025-12-03' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1038, CAST(N'2025-12-04' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1039, CAST(N'2025-12-05' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1040, CAST(N'2025-12-06' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1041, CAST(N'2025-12-07' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1042, CAST(N'2025-12-08' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1043, CAST(N'2025-12-09' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1044, CAST(N'2025-12-10' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1045, CAST(N'2025-12-11' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1046, CAST(N'2025-12-12' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1047, CAST(N'2025-12-13' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1048, CAST(N'2025-12-14' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1049, CAST(N'2025-12-15' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1050, CAST(N'2025-12-16' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1051, CAST(N'2025-12-17' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1052, CAST(N'2025-12-18' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1053, CAST(N'2025-12-19' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1054, CAST(N'2025-12-20' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1055, CAST(N'2025-12-21' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1056, CAST(N'2025-12-22' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1057, CAST(N'2025-12-23' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1058, CAST(N'2025-12-24' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1059, CAST(N'2025-12-25' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1060, CAST(N'2025-12-26' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1061, CAST(N'2025-12-27' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1062, CAST(N'2025-12-28' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1063, CAST(N'2025-12-29' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1064, CAST(N'2025-12-30' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1065, CAST(N'2025-12-31' AS Date))
INSERT [dbo].[fechas] ([id], [fecha]) VALUES (1066, CAST(N'2026-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[fechas] OFF
GO
SET IDENTITY_INSERT [dbo].[gastos] ON 

INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (1, N'1', CAST(N'2025-01-20' AS Date), 5000.0000, 1, 1)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (2, N'2', CAST(N'2025-02-20' AS Date), 7000.0000, 1, 2)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (3, N'3', CAST(N'2025-03-05' AS Date), 9000.0000, 1, 3)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (4, N'4', CAST(N'2023-03-15' AS Date), 3000.0000, 3, 4)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (5, N'5', CAST(N'2023-09-25' AS Date), 4000.0000, 3, 5)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (6, N'6', CAST(N'2023-11-30' AS Date), 4500.0000, 3, 6)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (7, N'7', CAST(N'2023-05-20' AS Date), 6000.0000, 5, 7)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (8, N'8', CAST(N'2023-09-10' AS Date), 8000.0000, 5, 8)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (9, N'9', CAST(N'2023-12-10' AS Date), 10000.0000, 5, 9)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (10, N'10', CAST(N'2024-02-05' AS Date), 9000.0000, 2, 10)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (11, N'11', CAST(N'2024-04-20' AS Date), 11000.0000, 2, 11)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (12, N'12', CAST(N'2024-12-15' AS Date), 9500.0000, 2, 12)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (13, N'13', CAST(N'2024-11-15' AS Date), 8500.0000, 4, 13)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (14, N'14', CAST(N'2025-01-20' AS Date), 10500.0000, 4, 14)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (15, N'15', CAST(N'2025-02-15' AS Date), 12000.0000, 4, 15)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (16, N'16', CAST(N'2023-06-20' AS Date), 7000.0000, 6, 16)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (17, N'17', CAST(N'2023-07-25' AS Date), 9000.0000, 6, 17)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (18, N'18', CAST(N'2023-08-15' AS Date), 11000.0000, 6, 18)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (19, N'19', CAST(N'2024-01-20' AS Date), 8000.0000, 5, 19)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (20, N'20', CAST(N'2023-12-25' AS Date), 9500.0000, 3, 20)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (21, N'21', CAST(N'2025-03-05' AS Date), 6500.0000, 1, 19)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (22, N'22', CAST(N'2024-03-15' AS Date), 7500.0000, 2, 18)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (23, N'23', CAST(N'2023-11-20' AS Date), 8300.0000, 3, 17)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (24, N'24', CAST(N'2024-05-05' AS Date), 6000.0000, 2, 16)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (25, N'25', CAST(N'2025-03-10' AS Date), 14000.0000, 1, 15)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (26, N'26', CAST(N'2024-05-20' AS Date), 8500.0000, 4, 1)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (27, N'27', CAST(N'2023-06-25' AS Date), 13000.0000, 6, 2)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (28, N'28', CAST(N'2023-07-15' AS Date), 9000.0000, 5, 3)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (29, N'29', CAST(N'2023-10-20' AS Date), 12000.0000, 6, 4)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (30, N'30', CAST(N'2024-02-25' AS Date), 7000.0000, 2, 5)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (31, N'31', CAST(N'2024-03-30' AS Date), 8000.0000, 2, 6)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (32, N'32', CAST(N'2023-10-01' AS Date), 10000.0000, 3, 7)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (33, N'33', CAST(N'2023-08-30' AS Date), 9500.0000, 5, 8)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (34, N'34', CAST(N'2024-12-10' AS Date), 6000.0000, 2, 9)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (35, N'35', CAST(N'2025-01-10' AS Date), 5500.0000, 4, 10)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (36, N'36', CAST(N'2024-11-30' AS Date), 12000.0000, 4, 11)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (37, N'37', CAST(N'2025-02-20' AS Date), 9000.0000, 4, 12)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (38, N'38', CAST(N'2023-12-15' AS Date), 8500.0000, 6, 13)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (39, N'39', CAST(N'2023-11-25' AS Date), 10000.0000, 3, 14)
INSERT [dbo].[gastos] ([id], [codigo_gasto], [fecha_gato], [monto_gasto], [id_proyecto], [id_categoria_gasto]) VALUES (40, N'40', CAST(N'2025-03-15' AS Date), 13000.0000, 1, 15)
SET IDENTITY_INSERT [dbo].[gastos] OFF
GO
SET IDENTITY_INSERT [dbo].[ingresos] ON 

INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (1, N'1', CAST(N'2025-01-15' AS Date), 10000.0000, 1, 1)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (2, N'2', CAST(N'2025-02-15' AS Date), 15000.0000, 1, 2)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (3, N'3', CAST(N'2025-03-01' AS Date), 20000.0000, 1, 3)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (4, N'4', CAST(N'2023-03-10' AS Date), 5000.0000, 3, 4)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (5, N'5', CAST(N'2023-09-15' AS Date), 7000.0000, 3, 5)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (6, N'6', CAST(N'2023-11-20' AS Date), 8000.0000, 3, 6)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (7, N'7', CAST(N'2023-05-10' AS Date), 12000.0000, 5, 7)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (8, N'8', CAST(N'2023-08-20' AS Date), 15000.0000, 5, 8)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (9, N'9', CAST(N'2023-12-15' AS Date), 22000.0000, 5, 9)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (10, N'10', CAST(N'2024-02-01' AS Date), 18000.0000, 2, 10)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (11, N'11', CAST(N'2024-04-15' AS Date), 21000.0000, 2, 11)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (12, N'12', CAST(N'2024-12-01' AS Date), 19000.0000, 2, 12)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (13, N'13', CAST(N'2024-11-10' AS Date), 16000.0000, 4, 13)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (14, N'14', CAST(N'2025-01-10' AS Date), 19000.0000, 4, 14)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (15, N'15', CAST(N'2025-02-10' AS Date), 25000.0000, 4, 15)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (16, N'16', CAST(N'2023-06-15' AS Date), 17000.0000, 6, 16)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (17, N'17', CAST(N'2023-07-20' AS Date), 19000.0000, 6, 17)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (18, N'18', CAST(N'2023-08-10' AS Date), 21000.0000, 6, 18)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (19, N'19', CAST(N'2024-01-15' AS Date), 13000.0000, 5, 19)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (20, N'20', CAST(N'2023-12-20' AS Date), 20000.0000, 3, 20)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (21, N'21', CAST(N'2025-03-01' AS Date), 11000.0000, 1, 18)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (22, N'22', CAST(N'2024-03-10' AS Date), 14000.0000, 2, 17)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (23, N'23', CAST(N'2023-11-15' AS Date), 16000.0000, 3, 15)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (24, N'24', CAST(N'2024-05-01' AS Date), 12000.0000, 2, 12)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (25, N'25', CAST(N'2025-03-15' AS Date), 30000.0000, 1, 11)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (26, N'26', CAST(N'2024-05-15' AS Date), 19000.0000, 4, 1)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (27, N'27', CAST(N'2023-06-20' AS Date), 23000.0000, 6, 2)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (28, N'28', CAST(N'2023-07-10' AS Date), 15000.0000, 5, 3)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (29, N'29', CAST(N'2023-09-30' AS Date), 17000.0000, 6, 4)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (30, N'30', CAST(N'2024-02-20' AS Date), 14000.0000, 2, 5)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (31, N'31', CAST(N'2024-03-20' AS Date), 16000.0000, 2, 6)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (32, N'32', CAST(N'2023-10-15' AS Date), 21000.0000, 3, 7)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (33, N'33', CAST(N'2023-08-25' AS Date), 18000.0000, 5, 8)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (34, N'34', CAST(N'2024-12-15' AS Date), 13000.0000, 2, 9)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (35, N'35', CAST(N'2025-01-05' AS Date), 12000.0000, 4, 10)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (36, N'36', CAST(N'2024-11-25' AS Date), 20000.0000, 4, 11)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (37, N'37', CAST(N'2025-02-05' AS Date), 15000.0000, 4, 12)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (38, N'38', CAST(N'2023-12-05' AS Date), 17000.0000, 6, 13)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (39, N'39', CAST(N'2023-11-30' AS Date), 19000.0000, 3, 14)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (40, N'40', CAST(N'2025-03-10' AS Date), 22000.0000, 1, 15)
INSERT [dbo].[ingresos] ([id], [codigo_ingreso], [fecha_ingreso], [monto_ingreso], [id_proyecto], [id_categoria_ingreso]) VALUES (41, N'41', CAST(N'2024-12-20' AS Date), 2000.0000, 2, 14)
SET IDENTITY_INSERT [dbo].[ingresos] OFF
GO
SET IDENTITY_INSERT [dbo].[localidad] ON 

INSERT [dbo].[localidad] ([id], [codigo_estado], [estado], [region], [pais]) VALUES (1, N'MX01', N'Sonora', N'Norte', N'México')
INSERT [dbo].[localidad] ([id], [codigo_estado], [estado], [region], [pais]) VALUES (2, N'MX02', N'Nuevo Leon', N'Norte', N'México')
INSERT [dbo].[localidad] ([id], [codigo_estado], [estado], [region], [pais]) VALUES (3, N'MX03', N'Oxaca', N'Sur', N'México')
INSERT [dbo].[localidad] ([id], [codigo_estado], [estado], [region], [pais]) VALUES (4, N'MX04', N'Chiapas', N'Sur', N'México')
INSERT [dbo].[localidad] ([id], [codigo_estado], [estado], [region], [pais]) VALUES (5, N'MX05', N'Jalisco', N'Centro', N'México')
INSERT [dbo].[localidad] ([id], [codigo_estado], [estado], [region], [pais]) VALUES (6, N'MX06', N'Guanajuato', N'Centro', N'México')
SET IDENTITY_INSERT [dbo].[localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[metricas_financieras] ON 

INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (1, N'1', 50000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1000 AS Decimal(5, 4)), CAST(N'2025-01-20' AS Date), 1)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (2, N'2', 70000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1200 AS Decimal(5, 4)), CAST(N'2025-02-20' AS Date), 1)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (3, N'3', 90000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1500 AS Decimal(5, 4)), CAST(N'2025-03-05' AS Date), 1)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (4, N'4', 20000.0000, CAST(0.0300 AS Decimal(5, 4)), CAST(0.0400 AS Decimal(5, 4)), CAST(N'2023-03-20' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (5, N'5', 25000.0000, CAST(0.0400 AS Decimal(5, 4)), CAST(0.0500 AS Decimal(5, 4)), CAST(N'2023-09-20' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (6, N'6', 30000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.0600 AS Decimal(5, 4)), CAST(N'2023-12-30' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (7, N'7', 35000.0000, CAST(0.0400 AS Decimal(5, 4)), CAST(0.0700 AS Decimal(5, 4)), CAST(N'2023-05-15' AS Date), 5)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (8, N'8', 40000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.0800 AS Decimal(5, 4)), CAST(N'2023-09-01' AS Date), 5)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (9, N'9', 45000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.0900 AS Decimal(5, 4)), CAST(N'2023-12-01' AS Date), 5)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (10, N'10', 60000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1100 AS Decimal(5, 4)), CAST(N'2024-01-15' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (11, N'11', 65000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1200 AS Decimal(5, 4)), CAST(N'2024-04-01' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (12, N'12', 70000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1300 AS Decimal(5, 4)), CAST(N'2024-12-01' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (13, N'13', 80000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1500 AS Decimal(5, 4)), CAST(N'2024-11-15' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (14, N'14', 90000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1600 AS Decimal(5, 4)), CAST(N'2025-01-15' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (15, N'15', 100000.0000, CAST(0.0800 AS Decimal(5, 4)), CAST(0.1800 AS Decimal(5, 4)), CAST(N'2025-02-15' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (16, N'16', 30000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.0900 AS Decimal(5, 4)), CAST(N'2023-06-25' AS Date), 6)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (17, N'17', 35000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1000 AS Decimal(5, 4)), CAST(N'2023-07-30' AS Date), 6)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (18, N'18', 40000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1100 AS Decimal(5, 4)), CAST(N'2023-08-20' AS Date), 6)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (19, N'19', 25000.0000, CAST(0.0400 AS Decimal(5, 4)), CAST(0.0600 AS Decimal(5, 4)), CAST(N'2024-01-25' AS Date), 5)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (20, N'20', 30000.0000, CAST(0.0400 AS Decimal(5, 4)), CAST(0.0700 AS Decimal(5, 4)), CAST(N'2023-12-15' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (21, N'21', 45000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1000 AS Decimal(5, 4)), CAST(N'2025-03-01' AS Date), 1)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (22, N'22', 50000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1100 AS Decimal(5, 4)), CAST(N'2024-03-10' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (23, N'23', 55000.0000, CAST(0.0400 AS Decimal(5, 4)), CAST(0.0800 AS Decimal(5, 4)), CAST(N'2023-11-30' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (24, N'24', 60000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.0900 AS Decimal(5, 4)), CAST(N'2024-05-15' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (25, N'25', 70000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1500 AS Decimal(5, 4)), CAST(N'2025-03-10' AS Date), 1)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (26, N'26', 80000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1200 AS Decimal(5, 4)), CAST(N'2024-05-20' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (27, N'27', 90000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1400 AS Decimal(5, 4)), CAST(N'2023-07-15' AS Date), 6)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (28, N'28', 30000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.0900 AS Decimal(5, 4)), CAST(N'2023-08-10' AS Date), 5)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (29, N'29', 40000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1000 AS Decimal(5, 4)), CAST(N'2023-10-20' AS Date), 6)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (30, N'30', 50000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1100 AS Decimal(5, 4)), CAST(N'2024-01-20' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (31, N'31', 60000.0000, CAST(0.0800 AS Decimal(5, 4)), CAST(0.1200 AS Decimal(5, 4)), CAST(N'2024-02-20' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (32, N'32', 70000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1300 AS Decimal(5, 4)), CAST(N'2023-10-15' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (33, N'33', 80000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1400 AS Decimal(5, 4)), CAST(N'2023-08-30' AS Date), 5)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (34, N'34', 90000.0000, CAST(0.0500 AS Decimal(5, 4)), CAST(0.1500 AS Decimal(5, 4)), CAST(N'2024-12-01' AS Date), 2)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (35, N'35', 100000.0000, CAST(0.0600 AS Decimal(5, 4)), CAST(0.1600 AS Decimal(5, 4)), CAST(N'2025-01-10' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (36, N'36', 110000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.1800 AS Decimal(5, 4)), CAST(N'2024-11-30' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (37, N'37', 120000.0000, CAST(0.0800 AS Decimal(5, 4)), CAST(0.1900 AS Decimal(5, 4)), CAST(N'2025-02-20' AS Date), 4)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (38, N'38', 130000.0000, CAST(0.0700 AS Decimal(5, 4)), CAST(0.2000 AS Decimal(5, 4)), CAST(N'2023-12-15' AS Date), 6)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (39, N'39', 140000.0000, CAST(0.0800 AS Decimal(5, 4)), CAST(0.2100 AS Decimal(5, 4)), CAST(N'2023-11-25' AS Date), 3)
INSERT [dbo].[metricas_financieras] ([id], [codigo_metrica], [valor_actual_neto], [tasa_interna_retorno], [retorno_inversion], [fecha_calculo], [id_proyecto]) VALUES (40, N'40', 150000.0000, CAST(0.0900 AS Decimal(5, 4)), CAST(0.2200 AS Decimal(5, 4)), CAST(N'2025-03-15' AS Date), 1)
SET IDENTITY_INSERT [dbo].[metricas_financieras] OFF
GO
SET IDENTITY_INSERT [dbo].[presupuesto_planificado] ON 

INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (1, N'1', 100000.0000, CAST(N'2025-01-01' AS Date), 1)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (2, N'2', 150000.0000, CAST(N'2025-02-01' AS Date), 1)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (3, N'3', 200000.0000, CAST(N'2025-03-01' AS Date), 1)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (4, N'4', 50000.0000, CAST(N'2023-02-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (5, N'5', 70000.0000, CAST(N'2023-03-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (6, N'6', 60000.0000, CAST(N'2023-04-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (7, N'7', 120000.0000, CAST(N'2023-05-01' AS Date), 5)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (8, N'8', 150000.0000, CAST(N'2023-06-01' AS Date), 5)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (9, N'9', 180000.0000, CAST(N'2023-07-01' AS Date), 5)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (10, N'10', 90000.0000, CAST(N'2024-01-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (11, N'11', 110000.0000, CAST(N'2024-02-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (12, N'12', 130000.0000, CAST(N'2024-03-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (13, N'13', 85000.0000, CAST(N'2024-10-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (14, N'14', 95000.0000, CAST(N'2024-11-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (15, N'15', 105000.0000, CAST(N'2025-01-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (16, N'16', 70000.0000, CAST(N'2023-06-01' AS Date), 6)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (17, N'17', 80000.0000, CAST(N'2023-07-01' AS Date), 6)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (18, N'18', 90000.0000, CAST(N'2023-08-01' AS Date), 6)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (19, N'19', 75000.0000, CAST(N'2023-12-01' AS Date), 5)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (20, N'20', 80000.0000, CAST(N'2023-11-01' AS Date), 3)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (21, N'21', 110000.0000, CAST(N'2025-01-01' AS Date), 1)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (22, N'22', 95000.0000, CAST(N'2024-02-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (23, N'23', 65000.0000, CAST(N'2023-09-01' AS Date), 3)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (24, N'24', 90000.0000, CAST(N'2024-05-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (25, N'25', 150000.0000, CAST(N'2025-02-01' AS Date), 1)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (26, N'26', 100000.0000, CAST(N'2024-05-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (27, N'27', 70000.0000, CAST(N'2023-06-01' AS Date), 6)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (28, N'28', 80000.0000, CAST(N'2023-07-01' AS Date), 5)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (29, N'29', 60000.0000, CAST(N'2023-10-01' AS Date), 6)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (30, N'30', 90000.0000, CAST(N'2024-01-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (31, N'31', 110000.0000, CAST(N'2024-02-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (32, N'32', 98000.0000, CAST(N'2023-11-01' AS Date), 3)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (33, N'33', 82000.0000, CAST(N'2023-08-01' AS Date), 5)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (34, N'34', 75000.0000, CAST(N'2024-12-01' AS Date), 2)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (35, N'35', 85000.0000, CAST(N'2025-01-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (36, N'36', 95000.0000, CAST(N'2024-11-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (37, N'37', 90000.0000, CAST(N'2025-02-01' AS Date), 4)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (38, N'38', 78000.0000, CAST(N'2023-12-01' AS Date), 6)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (39, N'39', 67000.0000, CAST(N'2023-11-01' AS Date), 3)
INSERT [dbo].[presupuesto_planificado] ([id], [codigo_presupuesto], [monto_planificado], [fecha_registro], [id_proyecto]) VALUES (40, N'40', 85000.0000, CAST(N'2025-03-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[presupuesto_planificado] OFF
GO
SET IDENTITY_INSERT [dbo].[proyectos] ON 

INSERT [dbo].[proyectos] ([id], [codigo_proyecto], [nombre_proyecto], [descripcion_proy], [fecha_inicio], [fecha_fin], [fecha_planificada_fin], [estado_proyecto], [id_localidad]) VALUES (1, N'PROJ001', N'Construcción de Escuela Prim', N'Proyecto para construir una escuela primaria en la localidad', CAST(N'2025-01-01' AS Date), NULL, CAST(N'2025-12-01' AS Date), N'En Progreso', 1)
INSERT [dbo].[proyectos] ([id], [codigo_proyecto], [nombre_proyecto], [descripcion_proy], [fecha_inicio], [fecha_fin], [fecha_planificada_fin], [estado_proyecto], [id_localidad]) VALUES (2, N'PROJ002', N'Construcción de Hospital', N'Proyecto para construir un nuevo hospital', CAST(N'2023-02-01' AS Date), CAST(N'2024-01-31' AS Date), CAST(N'2024-01-15' AS Date), N'Finalizado', 2)
INSERT [dbo].[proyectos] ([id], [codigo_proyecto], [nombre_proyecto], [descripcion_proy], [fecha_inicio], [fecha_fin], [fecha_planificada_fin], [estado_proyecto], [id_localidad]) VALUES (3, N'PROJ003', N'Construcción de Maternidad', N'Proyecto para construir una maternidad en la comunidad', CAST(N'2023-03-01' AS Date), CAST(N'2023-12-30' AS Date), CAST(N'2023-11-15' AS Date), N'Finalizado', 3)
INSERT [dbo].[proyectos] ([id], [codigo_proyecto], [nombre_proyecto], [descripcion_proy], [fecha_inicio], [fecha_fin], [fecha_planificada_fin], [estado_proyecto], [id_localidad]) VALUES (4, N'PROJ004', N'Construcción de Viaducto', N'Proyecto para construir un viaducto', CAST(N'2024-10-01' AS Date), NULL, CAST(N'2025-10-01' AS Date), N'En Progreso', 4)
INSERT [dbo].[proyectos] ([id], [codigo_proyecto], [nombre_proyecto], [descripcion_proy], [fecha_inicio], [fecha_fin], [fecha_planificada_fin], [estado_proyecto], [id_localidad]) VALUES (5, N'PROJ005', N'Construcción de Urbanismo', N'Proyecto para construir un nuevo urbanismo', CAST(N'2023-05-01' AS Date), CAST(N'2024-01-31' AS Date), CAST(N'2024-02-20' AS Date), N'Finalizado', 5)
INSERT [dbo].[proyectos] ([id], [codigo_proyecto], [nombre_proyecto], [descripcion_proy], [fecha_inicio], [fecha_fin], [fecha_planificada_fin], [estado_proyecto], [id_localidad]) VALUES (6, N'PROJ006', N'Construcción de Edificios', N'Proyecto para construir un complejo de edificios', CAST(N'2023-06-01' AS Date), CAST(N'2024-06-30' AS Date), CAST(N'2024-07-30' AS Date), N'Finalizado', 6)
SET IDENTITY_INSERT [dbo].[proyectos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__4E166F9743EE6CA6]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[categoria_gastos] ADD UNIQUE NONCLUSTERED 
(
	[codigo_cat_gasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__3EE445A27FE3E770]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[categoria_ingresos] ADD UNIQUE NONCLUSTERED 
(
	[codigo_cat_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__gastos__510A82FCC489DFA0]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[gastos] ADD UNIQUE NONCLUSTERED 
(
	[codigo_gasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ingresos__2F7AA5C70D993B1D]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[ingresos] ADD UNIQUE NONCLUSTERED 
(
	[codigo_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__localida__6D195428A54C7497]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[localidad] ADD UNIQUE NONCLUSTERED 
(
	[codigo_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__metricas__596F66306FC02792]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[metricas_financieras] ADD UNIQUE NONCLUSTERED 
(
	[codigo_metrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__presupue__25BCC303A06E6978]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[presupuesto_planificado] ADD UNIQUE NONCLUSTERED 
(
	[codigo_presupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__proyecto__0BC51862818C87DC]    Script Date: 10/4/2025 6:51:45 p. m. ******/
ALTER TABLE [dbo].[proyectos] ADD UNIQUE NONCLUSTERED 
(
	[codigo_proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[gastos]  WITH CHECK ADD  CONSTRAINT [fk_id_cat_gasto] FOREIGN KEY([id_categoria_gasto])
REFERENCES [dbo].[categoria_gastos] ([id])
GO
ALTER TABLE [dbo].[gastos] CHECK CONSTRAINT [fk_id_cat_gasto]
GO
ALTER TABLE [dbo].[gastos]  WITH CHECK ADD  CONSTRAINT [fk_id_proyecto_gasto] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[proyectos] ([id])
GO
ALTER TABLE [dbo].[gastos] CHECK CONSTRAINT [fk_id_proyecto_gasto]
GO
ALTER TABLE [dbo].[ingresos]  WITH CHECK ADD  CONSTRAINT [fk_id_cat_ingreso] FOREIGN KEY([id_categoria_ingreso])
REFERENCES [dbo].[categoria_ingresos] ([id])
GO
ALTER TABLE [dbo].[ingresos] CHECK CONSTRAINT [fk_id_cat_ingreso]
GO
ALTER TABLE [dbo].[ingresos]  WITH CHECK ADD  CONSTRAINT [fk_id_proyecto_ingreso] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[proyectos] ([id])
GO
ALTER TABLE [dbo].[ingresos] CHECK CONSTRAINT [fk_id_proyecto_ingreso]
GO
ALTER TABLE [dbo].[metricas_financieras]  WITH CHECK ADD  CONSTRAINT [fk_id_proyecto_metrica] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[proyectos] ([id])
GO
ALTER TABLE [dbo].[metricas_financieras] CHECK CONSTRAINT [fk_id_proyecto_metrica]
GO
ALTER TABLE [dbo].[presupuesto_planificado]  WITH CHECK ADD  CONSTRAINT [fk_id_proyecto_presupuesto] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[proyectos] ([id])
GO
ALTER TABLE [dbo].[presupuesto_planificado] CHECK CONSTRAINT [fk_id_proyecto_presupuesto]
GO
ALTER TABLE [dbo].[proyectos]  WITH CHECK ADD  CONSTRAINT [fk_id_localidad] FOREIGN KEY([id_localidad])
REFERENCES [dbo].[localidad] ([id])
GO
ALTER TABLE [dbo].[proyectos] CHECK CONSTRAINT [fk_id_localidad]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarProyecto]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ActualizarProyecto]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProyectosPorLocalidad]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ObtenerProyectosPorLocalidad]
    @id_localidad INT
as
begin
    select *
	from proyectos 
	where id_localidad = @id_localidad;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_registroIngreso]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_registroIngreso]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ResumenFinancieroProyecto]    Script Date: 10/4/2025 6:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ResumenFinancieroProyecto]
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
end
GO
USE [master]
GO
ALTER DATABASE [bd_gestion_proyectos] SET  READ_WRITE 
GO
