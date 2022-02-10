--Tomos
--Listar
CREATE PROC Tomos_Listar
@Disponibilidad bit = null
AS
BEGIN
	SELECT * FROM Tomos
	WHERE Disponibilidad = 
	ISNULL(@Disponibilidad, Disponibilidad)
END
GO

--Insertar
ALTER PROC Tomo_Insertar
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

--Actualizar
CREATE PROC Tomos_Actualizar
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

--Eliminar
CREATE PROC Tomos_Eliminar
@id int
AS
BEGIN
	DELETE FROM Tomos
	WHERE id = @id
END
GO

--GetByID
CREATE PROC Tomos_GetByID
@id int
AS
BEGIN
	SELECT * FROM Tomos
	WHERE id = @id
END
GO

--Vendedor
--Listar
CREATE PROC Vendedor_Listar
AS
BEGIN
	SELECT * FROM Vendedor
END
GO

--Insertar
CREATE PROC Vendedor_Insertar
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

--Actualizar
CREATE PROC Vendedor_Actualizar
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

--Eliminar
CREATE PROC Vendedor_Eliminar
@id int
AS
BEGIN
	DELETE FROM Vendedor
	WHERE id = @id
END
GO

--GetByID
CREATE PROC Vendedor_GetByID
@id int
AS
BEGIN	
	SELECT * FROM Vendedor
	WHERE id = @id
END
GO

--Cliente
--Listar
CREATE PROC Cliente_Listar
AS
BEGIN
	SELECT * FROM Cliente
END
GO

--Insertar
CREATE PROC Cliente_Insertar
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

--Actualizar
CREATE PROC Cliente_Actualizar
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

--Eliminar
CREATE PROC Cliente_Eliminar
@id int
AS
BEGIN
	DELETE FROM Cliente
	WHERE id = @id
END
GO

--GetByID
CREATE PROC Cliente_GetByID
@id int
AS
BEGIN
	SELECT * FROM Cliente
	WHERE id = @id
END
GO

--Baucher
--Listar
CREATE PROC Baucher_Listar
AS
BEGIN
	SELECT * FROM Baucher
END
GO

--Insertar
CREATE PROC Baucher_Insertar
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

--Actualizar
CREATE PROC Baucher_Actualizar
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

--Eliminar
CREATE PROC Baucher_Eliminar
@id int
AS
BEGIN
	DELETE FROM Baucher
	WHERE id = id
END
GO

--GetByID
CREATE PROC Baucher_GetByID
@id int
AS
BEGIN
	DELETE FROM Baucher
	WHERE @id = id
END
GO

--DetalleTicket
--Listar
CREATE PROC DetalleTicket_Listar
AS
BEGIN
	SELECT * FROM DetalleTicket
END
GO

--Insertar
CREATE PROC DetalleTicket_Insertar
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

--Actualizar
CREATE PROC DetalleTicket_Actualizar
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

--Eliminar
CREATE PROC DetalleTicket_Eliminar
@id int
AS
BEGIN
	DELETE FROM DetalleTicket
	WHERE id = @id
END
GO

--GetByID
CREATE PROC DetalleTicket_GetByID
@id int
AS
BEGIN
	SELECT * FROM DetalleTicket
	WHERE id = @id
END
GO