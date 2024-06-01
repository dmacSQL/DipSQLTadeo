
create table Proveedores.Datos
(
Nit_prov int primary key,
Nombre nvarchar(80) not null,
Telefono nvarchar(12) Not null,
Direccion nvarchar (30)
)

create table Proveedores.producto
(
id_prod int primary key,
Nombre nvarchar(80) not null,
Precio_prod int,
Nit_prov int,
 CONSTRAINT FK_Prove_Produc FOREIGN KEY (Nit_prov)
    REFERENCES Proveedores.Datos(Nit_prov)
)

------------------------------------
create schema  empleados

create table empleados.Datos
(
id int primary key,
Nombre nvarchar(80) not null,
Telefono nvarchar(12) Not null,
Direccion nvarchar (30)
)

create table empleados.login
(
id nvarchar(15) primary key,
password nvarchar(80) not null
)

------------------------------------

create table Sucursales
(
id int primary key,
Nombre nvarchar(30) not null,
Direccion nvarchar(30) not null,
Telefono nvarchar(12) Not null
)

-------------------------

create table Ventas
(
	id_venta int identity (1,1) primary key,
	cantidad float,
	id_vendedor int,
	constraint fk_id_ventas_id_empleados foreign key (Id_vendedor)references empleados.datos(id),
	Id_prod int,
	constraint fk_id_ventas_id_prov foreign key (Id_prod) references  [Proveedores].[producto](id_prod),
	Id_suc int,
    constraint fk_id_sucursal foreign key (Id_suc) references [dbo].[Sucursales] (id)
)


----------------------------
select * from Sucursales

insert into Sucursales
(id,Nombre,  Direccion,Telefono)values (1,'Bogota','kr 15 N 10 20',3104142324)
go

insert into Sucursales
(id,Nombre,  Direccion,Telefono)values (2,'Medellin','cll 1 N 15 24',3184253477)
go

insert into Sucursales
(id,Nombre,  Direccion,Telefono)values (3,'Cartagena','cll 6 N 5 12',3102453412)
go

--------------------------

select * from empleados.Datos

insert into empleados.Datos (id, Nombre,  Direccion,Telefono)values(1,'Sonia','kr 12 N 15.01',3105213410)
insert into empleados.Datos (id, Nombre,  Direccion,Telefono)values(2,'Camilo','cl 13 N 25 41',3204613810)
insert into empleados.Datos (id, Nombre,  Direccion,Telefono)values(3,'Emiliano','kr 98 N 05 119',3102340987)

-------------------------------

select * from empleados.login

Insert into empleados.login (id,password) values ('soni10','Prueba.123')
Insert into empleados.login (id,password) values ('Cami20','Prueba.123')
Insert into empleados.login (id,password) values ('Eimi30','Prueba.123')


---------------------------------

select * from [Proveedores].[Datos]

insert into Proveedores.Datos (nit_prov, Nombre,Telefono, Direccion ) values (123,'Cafelocal','6014253321','cll 122 n 45 12')
insert into Proveedores.Datos (nit_prov, Nombre,Telefono, Direccion ) values (234,'tienda campiña','60183456789','cll 12 n 55 42')
insert into Proveedores.Datos (nit_prov, Nombre,Telefono, Direccion ) values (100,'Productos naturales','6012345612','cll 2 n 15 67')


----------------------------------

select * from [Proveedores].[producto]

insert into proveedores.producto (id_prod,nombre,precio_prod,nit_prov) values (1,'CafeExpress',2000,123)
insert into proveedores.producto (id_prod,nombre,precio_prod,nit_prov) values (2,'Gaseosa 350',4000,234)
insert into proveedores.producto (id_prod,nombre,precio_prod,nit_prov) values (3,'Tarta Zanahoria',9000,100)

-------------------------------------------
select * from [dbo].[Ventas]

insert into ventas (cantidad,id_vendedor,id_prod,id_suc) values (1,2,3,3)

insert into ventas (cantidad,id_vendedor,id_prod,id_suc) values (3,1,1,1)

insert into ventas (cantidad,id_vendedor,id_prod,id_suc) values (4,3,2,2)




select * from ventas.Caja

update ventas.Empleado
set Direccion = 'Cll 24 N 14 52'
where Nombre = 'Dario'



insert into ventas.Caja (cantidad,id_prod,id_empleado) values (2,1,2)

insert into ventas.Caja (cantidad,id_prod,id_empleado) values (1,3,1)

insert into ventas.Caja (cantidad,id_prod,id_empleado) values (5,2,3)



select pr.Precio_prod * ca.cantidad as precio  from ventas.Caja ca
inner join ventas.producto pr
on  ca.id_prod = pr.id_prod
where ca.id_caja = 3



select * from ventas.Caja c
inner join ventas.producto pr
on  ca.id_prod = pr.id_prod
where ca.id_caja = 3






