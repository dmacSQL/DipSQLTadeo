create database Libreria

create schema Catalogo
go

create schema Ventas
go

create table Catalogo.Autores
(
	AutorID int IDENTITY(1, 1) primary key,
	Nombre varchar (80),
	Apellido nvarchar (80)
);


Create Table Catalogo.Categorias
(
	CategoriaID int IDENTITY(1, 1)primary key,
	Nombre nvarchar (80)
);


CREATE TABLE Catalogo.Libros
(
    LibroID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo VARCHAR(100),
    Precio MONEY,
    AutorID INT,
    CategoríaID INT,
    CONSTRAINT fk_Cat_lib_AutorId_cat_autores_AutorId FOREIGN KEY (AutorID)
        REFERENCES Catalogo.Autores (AutorID),
    CONSTRAINT fk_Cat_lib_CategoríaID_cat_Categorias_CategoriaID FOREIGN KEY (CategoríaID)
        REFERENCES Catalogo.Categorias (CategoriaID)
);

------------------------

CREATE TABLE Ventas.Clientes
(
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(100),
	Apellido nvarchar (80),
	Email nvarchar(300) unique not null
)


CREATE TABLE Ventas.Ventas
(
	VentaID INT IDENTITY(1,1) PRIMARY KEY,
	FechaVenta date,
	ClienteID int,
	 CONSTRAINT fk_ventas_cliente_clienteID_ventas_ClienteId FOREIGN KEY (ClienteID)
        REFERENCES Ventas.Clientes (ClienteID)
)


CREATE TABLE Ventas.DetalleVentas
(
	DetalleID  INT IDENTITY(1,1) PRIMARY KEY,
	Cantidad int,
	PrecioVenta money,
	VentaID int,
	LibroID int,
	CONSTRAINT fk_ventas_Detallesventas_ventas_ventas FOREIGN KEY (VentaID)
        REFERENCES Ventas.Ventas (VentaID),
	CONSTRAINT fk_ventas_Detalleventas_catalogo_libros FOREIGN KEY (LibroID)
        REFERENCES Catalogo.Libros (LibroID)
)


---------------------------------------------

select * from Catalogo.Autores

insert into Catalogo.Autores (Nombre,Apellido)
	values ('Gabriel','Garcia Marquez')

insert into Catalogo.Autores (Nombre,Apellido)
	values ('Julio','Verne')


insert into Catalogo.Autores (Nombre,Apellido)
	values ('Rafael','Pombo')

insert into Catalogo.Autores (Nombre,Apellido)
	values ('Julie','Kagawa')


insert into Catalogo.Autores (Nombre,Apellido)
	values ('George','Martin')


insert into Catalogo.Autores (Nombre,Apellido)
	values ('Julie','Kagawa')


insert into Catalogo.Autores (Nombre,Apellido)
	values ('J.K','Rowling')


insert into Catalogo.Autores (Nombre,Apellido)
	values ('Mario','Vargas LLosa')

	
insert into Catalogo.Autores (Nombre,Apellido)
	values ('Juan Carlos','Onetti')

insert into Catalogo.Autores (Nombre,Apellido)
	values ('Hector','Abad')

	
insert into Catalogo.Autores (Nombre,Apellido)
	values ('Celso ','Roman')


--------------

select * from Catalogo.Categorias

insert into Catalogo.Categorias (Nombre)
	values ('Acción')
insert into Catalogo.Categorias (Nombre)
	values ('Ficción')
insert into Catalogo.Categorias (Nombre)
	values ('Drama')
insert into Catalogo.Categorias (Nombre)
	values ('Comico')
insert into Catalogo.Categorias (Nombre)
	values ('Historia')
insert into Catalogo.Categorias (Nombre)
	values ('Infantil')
insert into Catalogo.Categorias (Nombre)
	values ('Juvenil')
insert into Catalogo.Categorias (Nombre)
	values ('Poesía')
insert into Catalogo.Categorias (Nombre)
	values ('Naturaleza')
insert into Catalogo.Categorias (Nombre)
	values ('Terror')
insert into Catalogo.Categorias (Nombre)
	values ('Novela')

-------------------------------

select * from Catalogo.Libros

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Cien Años de Soleda', 80000,1,11 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('De la tierra a la Luna', 40000,2,11 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('El Gatoa Bandido', 40000,3,6 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Sombra del Zorro', 80000,4,7 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Fuego y Sangre', 70000,5,2 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Animales Fantasticos y Donde Encontrarlos', 85000,7,2 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Travesuras de una Niña Mala', 55000,8,3 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Travesuras de una Niña Mala', 55000,8,3 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Tan triste como ella', 45000,9,11 )

Insert into Catalogo.Libros (Titulo, Precio,AutorID,CategoríaID)
	values ('Los Amigos Del Hombre', 40000,10,6 )




