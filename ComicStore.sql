USE [ComicStore]
GO
/****** Object:  Table [dbo].[Baucher]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_id] [int] NOT NULL,
	[Vendedor_id] [int] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Baucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[RFC] [varchar](13) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleTicket]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleTicket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tomos_id] [int] NOT NULL,
	[Ticket_id] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_DetalleTicket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tomos]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tomos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Precio] [float] NOT NULL,
	[Stock] [int] NOT NULL,
	[Genero] [varchar](50) NOT NULL,
	[Disponibilidad] [bit] NOT NULL,
	[UrlFoto] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tomos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
	[UrlFoto] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Baucher]  WITH CHECK ADD  CONSTRAINT [FK_Baucher_Cliente] FOREIGN KEY([Cliente_id])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Baucher] CHECK CONSTRAINT [FK_Baucher_Cliente]
GO
ALTER TABLE [dbo].[Baucher]  WITH CHECK ADD  CONSTRAINT [FK_Baucher_Vendedor] FOREIGN KEY([Vendedor_id])
REFERENCES [dbo].[Vendedor] ([id])
GO
ALTER TABLE [dbo].[Baucher] CHECK CONSTRAINT [FK_Baucher_Vendedor]
GO
ALTER TABLE [dbo].[DetalleTicket]  WITH CHECK ADD  CONSTRAINT [FK_DetalleTicket_Baucher] FOREIGN KEY([Ticket_id])
REFERENCES [dbo].[Baucher] ([id])
GO
ALTER TABLE [dbo].[DetalleTicket] CHECK CONSTRAINT [FK_DetalleTicket_Baucher]
GO
ALTER TABLE [dbo].[DetalleTicket]  WITH CHECK ADD  CONSTRAINT [FK_DetalleTicket_Tomos] FOREIGN KEY([Tomos_id])
REFERENCES [dbo].[Tomos] ([id])
GO
ALTER TABLE [dbo].[DetalleTicket] CHECK CONSTRAINT [FK_DetalleTicket_Tomos]
GO
/****** Object:  StoredProcedure [dbo].[Baucher_Actualizar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Baucher_Actualizar]
@id int,
@Cliente_id int = NULL,
@Vendedor_id int = NULL,
@SubTotal float = NULL,
@Total float = NULL
AS
BEGIN
	UPDATE Baucher
	SET Cliente_id = ISNULL(@Cliente_id, Cliente_id), Vendedor_id =ISNULL(@Vendedor_id, Vendedor_id), SubTotal = ISNULL(@SubTotal, SubTotal), Total = ISNULL(@Total, Total)
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Baucher_Eliminar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Baucher_Eliminar]
@id int
AS
BEGIN
	DELETE FROM Baucher
	WHERE id = id
END
GO
/****** Object:  StoredProcedure [dbo].[Baucher_GetByID]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Baucher_GetByID]
@id int
AS
BEGIN
	DELETE FROM Baucher
	WHERE @id = id
END
GO
/****** Object:  StoredProcedure [dbo].[Baucher_Insertar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Baucher_Insertar]
@Cliente_id int,
@Vendedor_id int,
@SubTotal float,
@Total float
AS
BEGIN
	INSERT INTO Baucher
	(Cliente_id, Vendedor_id, SubTotal, Total)
	VALUES
	(@Cliente_id, @Vendedor_id, @SubTotal, @Total)
	SELECT id = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Baucher_Listar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Baucher_Listar]
AS
BEGIN
	SELECT * FROM Baucher
END
GO
/****** Object:  StoredProcedure [dbo].[buscaTitulo]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscaTitulo]
@Prefijo varchar(MAX)
AS
BEGIN
	SELECT Titulo FROM Tomos 
	WHERE Titulo LIKE '%' + @Prefijo + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Actualizar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cliente_Actualizar]
@id int,
@Nombre varchar(50) = null,
@ApPaterno varchar(50) = null,
@ApMaterno varchar(50) = null,
@RFC varchar(13) = null,
@Telefono varchar(50) = null
AS
BEGIN
	UPDATE Cliente
	SET Nombre = ISNULL(@Nombre, Nombre), ApPaterno = ISNULL(@ApPaterno, ApPaterno), ApMaterno = ISNULL(@ApMaterno, ApMaterno), RFC = ISNULL(@RFC, RFC), Telefono = ISNULL(@Telefono, Telefono)
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Eliminar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cliente_Eliminar]
@id int
AS
BEGIN
	DELETE FROM Cliente
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_GetByID]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cliente_GetByID]
@id int
AS
BEGIN
	SELECT * FROM Cliente
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Insertar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cliente_Insertar]
@Nombre varchar(50),
@ApPaterno varchar(50),
@ApMaterno varchar(50),
@RFC varchar(13),
@Telefono varchar(50)
AS
BEGIN
	INSERT INTO Cliente
	(Nombre, ApPaterno, ApMaterno, RFC, Telefono)
	VALUES
	(@Nombre, @ApPaterno, @ApMaterno, @RFC, @Telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[Cliente_Listar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cliente_Listar]
AS
BEGIN
	SELECT * FROM Cliente
END
GO
/****** Object:  StoredProcedure [dbo].[DatosBaucher]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DatosBaucher]
AS
BEGIN
	SELECT C.Nombre, C.ApPaterno, C.ApMaterno, C.RFC, V.Nombre, B.SubTotal, B.Total
	FROM Baucher B 
	INNER JOIN Cliente C ON C.id = B.Cliente_id
	INNER JOIN Vendedor V ON V.id = B.Vendedor_id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleTicket_Actualizar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DetalleTicket_Actualizar]
@id int,
@Baucher_id int = null,
@Tomos_id int = null,
@Cantidad int = null
AS
BEGIN
	UPDATE DetalleTicket
	SET Ticket_id = ISNULL(@Baucher_id, Ticket_id), Tomos_id = ISNULL(@Tomos_id, Tomos_id), Cantidad = ISNULL(@Cantidad, Cantidad)
	WHERE @id = id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleTicket_Eliminar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DetalleTicket_Eliminar]
@id int
AS
BEGIN
	DELETE FROM DetalleTicket
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleTicket_GetByID]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DetalleTicket_GetByID]
@id int
AS
BEGIN
	SELECT * FROM DetalleTicket
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleTicket_Insertar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DetalleTicket_Insertar]
@Baucher_id int,
@Tomos_id int,
@Cantidad int
AS
BEGIN
	INSERT INTO DetalleTicket
	(Ticket_id, Tomos_id, Cantidad)
	VALUES
	(@Baucher_id, @Tomos_id, @Cantidad)
	SELECT id = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleTicket_Listar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DetalleTicket_Listar]
AS
BEGIN
	SELECT * FROM DetalleTicket
END
GO
/****** Object:  StoredProcedure [dbo].[StocTomos]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Query para obtener los datos de venta
CREATE PROC [dbo].[StocTomos]
@Stock int
AS
BEGIN
	IF(@Stock = 0)
	BEGIN
		SELECT C.Nombre, C.ApPaterno, C.ApMaterno, C.RFC, T.Titulo, T.Precio, T.Genero, T.Stock, B.SubTotal, B.Total
		FROM Baucher B
		INNER JOIN Tomos T ON T.id = T.id
		INNER JOIN Cliente C ON C.id = C.id
		WHERE T.Stock < 1
	END
	else
	BEGIN
		SELECT C.Nombre, C.ApPaterno, C.ApMaterno, C.RFC, T.Titulo, T.Precio, T.Genero, T.Stock, B.SubTotal, B.Total
		FROM Baucher B
		INNER JOIN Tomos T ON T.id = T.id
		INNER JOIN Cliente C ON C.id = C.id
		WHERE T.Stock > 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Tomo_Insertar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insertar
CREATE PROC [dbo].[Tomo_Insertar]
@Titulo varchar(100),
@Precio float,
@Stock int,
@Genero varchar(50),
@UrlFoto varchar(255)
AS 
BEGIN
	INSERT INTO Tomos
	(Titulo, Precio, Stock, Genero, Disponibilidad, UrlFoto)
	VALUES
	(@Titulo, @Precio, @Stock, @Genero, 1, @UrlFoto)
END
GO
/****** Object:  StoredProcedure [dbo].[Tomos_Actualizar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tomos_Actualizar]
@id int,
@Titulo varchar(100) = null,
@Precio float = null,
@Stock int = null,
@Genero varchar(50) = null,
@UrlFoto varchar(255) = null
AS
BEGIN
	UPDATE Tomos
	SET Titulo = ISNULL(@Titulo, Titulo), Precio = ISNULL(@Precio, Precio), Stock = ISNULL(@Stock, Stock), Genero = ISNULL(@Genero, Genero), UrlFoto = ISNULL(@UrlFoto, UrlFoto)
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Tomos_Eliminar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tomos_Eliminar]
@id int
AS
BEGIN
	DELETE FROM Tomos
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Tomos_GetByID]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tomos_GetByID]
@id int
AS
BEGIN
	SELECT * FROM Tomos
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Tomos_Listar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tomos_Listar]
@Disponibilidad bit = null
AS
BEGIN
	SELECT * FROM Tomos
	WHERE Disponibilidad = 
	ISNULL(@Disponibilidad, Disponibilidad)
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Actualizar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Vendedor_Actualizar]
@id int,
@Nombre varchar(50) = null,
@ApPaterno varchar(50) = null,
@ApMaterno varchar(50) = null,
@Puesto varchar(50) = null,
@UrlFoto varchar(255) = null
AS
BEGIN 
	UPDATE Vendedor
	SET Nombre = ISNULL(@Nombre, Nombre), ApPaterno = ISNULL(@ApPaterno, ApPaterno), Puesto = ISNULL(@Puesto, Puesto), UrlFoto = ISNULL(@UrlFoto, UrlFoto)
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Eliminar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Vendedor_Eliminar]
@id int
AS
BEGIN
	DELETE FROM Vendedor
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_GetByID]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Vendedor_GetByID]
@id int
AS
BEGIN
	SELECT * FROM Vendedor
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Insertar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Vendedor_Insertar]
@Nombre varchar(50),
@ApPaterno varchar(50),
@ApMaterno varchar(50),
@Puesto varchar(50),
@UrlFoto varchar(255)
AS
BEGIN
	INSERT INTO Vendedor
	(Nombre, ApPaterno, ApMaterno, Puesto, UrlFoto)
	VALUES
	(@Nombre, @ApPaterno, @ApMaterno, @Puesto, @UrlFoto)
END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_Listar]    Script Date: 10/02/2022 07:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Vendedor_Listar]
AS
BEGIN
	SELECT * FROM Vendedor
END
GO
