
/******* TALLER Libreria***********/


CREATE DATABASE Libreria
GO
------------------------
CREATE SCHEMA Catalogo
GO
------------------------
CREATE SCHEMA Ventas
GO
------------------------
CREATE TABLE Catalogo.Autores
(
	AutorID int IDENTITY(1, 1) PRIMARY KEY,
	Nombre varchar (80),
	Apellido nvarchar (80)
	
);


--- Cambiar nombre de columna (1)

--ALTER TABLE Catalogo.Autores            ----------- Sale error
--RENAME COLUMN Nombre TO Nomb_Autor;


EXEC sp_rename 'Catalogo.Autores.Nombre', 'Nomb_Autor', 'COLUMN';

------------------------

CREATE TABLE Catalogo.Categorias
(
	CategoriaID int IDENTITY(1, 1)PRIMARY KEY,
	Nombre nvarchar (80)
);

--- Cambiar nombre de columna (2)


EXEC sp_rename 'Catalogo.Categorias.Nombre', 'Nomb_Categoria', 'COLUMN';

------------------------

CREATE TABLE Catalogo.Libros
(
    LibroID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo VARCHAR(100),
    Precio MONEY,
    AutorID INT,
     CONSTRAINT fk_Cat_lib_AutorId_cat_autores_AutorId FOREIGN KEY (AutorID)
     REFERENCES Catalogo.Autores (AutorID),
);


---- Adicionar Columna  (1)

ALTER TABLE Catalogo.Libros
 add   CategoriaID int;
GO

------- Relaciones despues de crear la tabla (1)

ALTER TABLE Catalogo.Libros
 ADD FOREIGN KEY (CategoriaID) 
 REFERENCES Catalogo.Categorias(CategoriaID); 


--- Cambiar nombre de columna (3)


EXEC sp_rename 'Catalogo.Libros.Precio', 'Valor_Libro', 'COLUMN';


---- Adicionar Columna  (2)

ALTER TABLE Catalogo.Libros
 add  Idioma varchar(30);



-------------------------
/*
CREATE TABLE Catalogo.NacionalidadAutores
(
	AutorId INT primary KEY,
	EsExtrangero bit,
      CONSTRAINT fk_Cat_Nacionalidad_AuditorID FOREIGN KEY (AutorId)
	  REFERENCES Catalogo.Autores (AutorId)
);
*/
------------------------

CREATE TABLE Ventas.Clientes
(
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(100),
	Apellido nvarchar (80),
	Email nvarchar(300) unique not null
);

------------------------

CREATE TABLE Ventas.Ventas
(
	VentaID INT IDENTITY(1,1) PRIMARY KEY,
	FechaVenta date,
	ClienteID int,
	 CONSTRAINT fk_ventas_cliente_clienteID_ventas_ClienteId FOREIGN KEY (ClienteID)
     REFERENCES Ventas.Clientes (ClienteID)
);

---- Adicionar Columna  (2)

ALTER TABLE Ventas.Ventas
 add  Modo_Pago Varchar(30);


ALTER TABLE Ventas.Ventas
 add  Ciudad Varchar(30);

------------------------

CREATE TABLE Ventas.DetalleVentas
(
	DetalleID  INT IDENTITY(1,1) PRIMARY KEY,
	Cantidad int,
	PrecioVenta money,
	VentaID int,
	 CONSTRAINT fk_ventas_Detallesventas_ventas_ventas FOREIGN KEY (VentaID)
     REFERENCES Ventas.Ventas (VentaID),

);


---- Adicionar Columna (3)

ALTER TABLE Ventas.DetalleVentas
 add   LibroID int;


------- Relaciones despues de crear la tabla (2)

ALTER TABLE Ventas.DetalleVentas
 ADD FOREIGN KEY (LibroID) 
 REFERENCES Catalogo.Libros(LibroID); 

------------------------ Inserts

select * from Catalogo.Autores

insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Gabriel','Garcia Marquez')

insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Julio','Verne')


insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Rafael','Pombo')

insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Julie','Kagawa')


insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('George','Martin')


insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Julie','Kagawa')


insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('J.K','Rowling')


insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Mario','Vargas LLosa')

	
insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Juan Carlos','Onetti')

insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Hector','Abad')

	
insert into Catalogo.Autores (Nomb_Autor,Apellido)
	values ('Celso ','Roman')


-------------------------------



select * from Catalogo.Categorias

insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Acción')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Ficción')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Drama')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Comico')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Historia')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Infantil')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Juvenil')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Poesía')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Naturaleza')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Terror')
insert into Catalogo.Categorias (Nomb_Categoria)
	values ('Novela')

-------------------------------

select * from Catalogo.Libros

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Cien Años de Soleda', 80000,1,11 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('De la tierra a la Luna', 40000,2,11 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('El Gatoa Bandido', 40000,3,6 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Sombra del Zorro', 80000,4,7 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Fuego y Sangre', 70000,5,2 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Animales Fantasticos y Donde Encontrarlos', 85000,7,2 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Travesuras de una Niña Mala', 55000,8,3 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Travesuras de una Niña Mala', 55000,8,3 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Tan triste como ella', 45000,9,11 )

Insert into Catalogo.Libros (Titulo, Valor_Libro,AutorID,CategoriaID)
	values ('Los Amigos Del Hombre', 40000,10,6 )

------------------------------------

select * from Ventas.clientes


insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Anna','lee','alee@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Fernando','Prieto','fprieto@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Jose','Martin','JJMartin@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Alcaro','Restrepo','Arestrepo1@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Alicia','Castro','Acastro22@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Sonia','univio','sonUnivio@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Sofia','Mesa','MesaSof@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Martha','Rodriguez','roro@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Emma','Ho','EmmaH@correo.com')

insert into  Ventas.clientes (Nombre,Apellido,Email)
	values ('Emmanuel','Santos','SantosE@correo.com')

------------------------------------

Select * from Ventas.ventas


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-01-13',1,'Efectivo', 'Bogota')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-02-17',2,'Tarjeta', 'Medellin')

	
insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2023-11-18',2,'Efectivo', 'Medellin')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-04-13',5,'Efectivo', 'Bogota')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2023-12-24',10,'Tarjeta', 'Barranquilla')

	
insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2023-09-22',9,'Efectivo', 'Bogota')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-05-10',8,'Efectivo', 'Bogota')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-05-10',3,'Tarjeta', 'Medellin')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-04-20',4,'Tarjeta', 'Barranquilla')


insert into  Ventas.ventas (FechaVenta,ClienteId,Modo_Pago,Ciudad)
	values ('2024-06-01',6,'Efectivo', 'Barranquilla')


------------------------------------


select * from Ventas.Detalleventas    

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,85000,3,1)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,85000,4,4)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,45000,5,2)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,45000,6,3)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,55000,6,5)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,90000,7,6)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,60000,8,7)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,45000,8,10)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,45000,9,13)

insert into  Ventas.Detalleventas (Cantidad,PrecioVenta,VentaID,LibroID)
	values (1,75000,10,15)
