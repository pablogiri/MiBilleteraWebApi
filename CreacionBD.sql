USE [master]
GO
/****** Object:  Database [MiBilletera]    Script Date: 9/11/2022 20:51:34 ******/
CREATE DATABASE [MiBilletera]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiBilletera', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\MiBilletera.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MiBilletera_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\MiBilletera_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MiBilletera] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiBilletera].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiBilletera] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiBilletera] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiBilletera] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiBilletera] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiBilletera] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiBilletera] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiBilletera] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiBilletera] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiBilletera] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiBilletera] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiBilletera] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiBilletera] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiBilletera] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiBilletera] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiBilletera] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiBilletera] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiBilletera] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiBilletera] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiBilletera] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiBilletera] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiBilletera] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiBilletera] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiBilletera] SET RECOVERY FULL 
GO
ALTER DATABASE [MiBilletera] SET  MULTI_USER 
GO
ALTER DATABASE [MiBilletera] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiBilletera] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiBilletera] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiBilletera] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MiBilletera] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MiBilletera', N'ON'
GO
ALTER DATABASE [MiBilletera] SET QUERY_STORE = OFF
GO
USE [MiBilletera]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[DNI] [bigint] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NULL,
	[Id_Localidad] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[Id_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[Id_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[Id_Localidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Id_Provincia] [int] NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[Id_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaUsuarios]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaUsuarios]
AS
SELECT        dbo.Usuarios.Nombre, dbo.Usuarios.Apellido, dbo.Usuarios.DNI, dbo.Localidades.Nombre AS Localidad, dbo.Provincias.Nombre AS Provincia, dbo.Usuarios.FechaNacimiento, dbo.Usuarios.Email, dbo.Usuarios.Telefono, 
                         dbo.Usuarios.FechaBaja
FROM            dbo.Usuarios INNER JOIN
                         dbo.Localidades ON dbo.Usuarios.Id_Localidad = dbo.Localidades.Id_Localidad INNER JOIN
                         dbo.Provincias ON dbo.Localidades.Id_Provincia = dbo.Provincias.Id_Provincia
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (1, N'Huerta Grande', 1, CAST(N'2022-11-07T19:47:43.190' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (2, N'La Falda', 1, CAST(N'2022-11-07T19:47:48.287' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (3, N'Villa Giardino', 1, CAST(N'2022-11-07T19:47:51.397' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (4, N'La Cumbre', 1, CAST(N'2022-11-07T19:47:55.350' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (5, N'Valle Hermoso', 1, CAST(N'2022-11-07T19:48:33.800' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (6, N'Esquel', 3, CAST(N'2022-11-07T19:52:53.173' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (7, N'Santa Rosa', 2, CAST(N'2022-11-07T20:48:54.390' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (8, N'Capilla del monte', 1, CAST(N'2022-11-09T20:37:42.570' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (9, N'Calchin', 1, CAST(N'2022-11-09T20:38:17.563' AS DateTime), NULL)
GO
INSERT [dbo].[Localidades] ([Id_Localidad], [Nombre], [Id_Provincia], [FechaAlta], [FechaBaja]) VALUES (10, N'Cruz del Eje', 1, CAST(N'2022-11-09T20:38:50.870' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre], [FechaAlta], [FechaBaja]) VALUES (1, N'Córdoba', CAST(N'2022-11-07T20:44:24.063' AS DateTime), NULL)
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre], [FechaAlta], [FechaBaja]) VALUES (2, N'La Pampa', CAST(N'2022-11-07T20:44:26.067' AS DateTime), NULL)
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre], [FechaAlta], [FechaBaja]) VALUES (3, N'Chubut', CAST(N'2022-11-07T20:44:28.077' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Email], [Usuario], [Password], [Telefono], [Id_Localidad], [FechaAlta], [FechaBaja]) VALUES (1, N'Pablo', N'Giribaldi', 34371819, CAST(N'1989-06-03' AS Date), N'pablo@mail.com', N'pgiri', N'1234', N'0303456', 1, CAST(N'2022-11-07T19:38:17.857' AS DateTime), NULL)
GO
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Email], [Usuario], [Password], [Telefono], [Id_Localidad], [FechaAlta], [FechaBaja]) VALUES (3, N'Ivana', N'Rojas', 40123456, CAST(N'2005-02-07' AS Date), N'ivana@mail.com', N'ivana', N'1234', N'6543030', 6, CAST(N'2022-11-07T19:53:10.520' AS DateTime), NULL)
GO
INSERT [dbo].[Usuarios] ([Id_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Email], [Usuario], [Password], [Telefono], [Id_Localidad], [FechaAlta], [FechaBaja]) VALUES (5, N'Ricardo', N'Ruben', 55544477, CAST(N'2000-05-05' AS Date), N'rruben@mail.com', N'usuario', N'1234', N'999666333', 7, CAST(N'2022-11-07T20:13:03.027' AS DateTime), CAST(N'2022-11-09T20:34:47.350' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Localidades] ADD  CONSTRAINT [DF_Localidades_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Provincias] ADD  CONSTRAINT [DF_Provincias_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([Id_Provincia])
REFERENCES [dbo].[Provincias] ([Id_Provincia])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Localidades] FOREIGN KEY([Id_Localidad])
REFERENCES [dbo].[Localidades] ([Id_Localidad])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Localidades]
GO
/****** Object:  StoredProcedure [dbo].[AgregarLocalidad]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AgregarLocalidad]
@Nombre VARCHAR(50),
@Id_Provincia INT
AS
INSERT INTO Localidades
(Nombre, Id_Provincia)
VALUES
(@Nombre, @Id_Provincia)
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
@Id_Usuario INT
AS
UPDATE Usuarios SET FechaBaja = GETDATE() 
WHERE Id_Usuario = @Id_Usuario
GO
/****** Object:  StoredProcedure [dbo].[ModificarLocalidad]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarLocalidad]
@Id_Localidad INT,
@Nombre VARCHAR(50),
@Id_Provincia INT
AS
UPDATE Localidades
SET Nombre = @Nombre,
	Id_Provincia = @Id_Provincia
WHERE Id_Localidad = @Id_Localidad
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarios]    Script Date: 9/11/2022 20:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarios] 
@DNI BIGINT = NULL,
@Apellido VARCHAR(50) = NULL
AS
SELECT Nombre, Apellido Ape, DNI AS d, Localidad
FROM VistaUsuarios
WHERE (@DNI IS NULL OR DNI = @DNI ) AND  --FILTRO POR DNI
(@Apellido IS NULL OR Apellido LIKE '%' + @Apellido + '%' )--FILTRO POR APELLIDO+
AND FechaBaja IS NULL

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuarios"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 215
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Localidades"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 169
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Provincias"
            Begin Extent = 
               Top = 6
               Left = 530
               Bottom = 136
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaUsuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaUsuarios'
GO
USE [master]
GO
ALTER DATABASE [MiBilletera] SET  READ_WRITE 
GO
