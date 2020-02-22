/*Creacion Base de Datos*/
create database DBBiblioteca2016
use  DBBiblioteca2016

/*Crear tabla Tipo_usuario*/
create table tblTipo_Usuario
(
 Cod_tipo int identity (1,1),
 Nom_Tipo varchar(30) not null,
 Primary Key (Cod_tipo)
)
/*Datos Para Tipo de usuario*/

Insert into tblTipo_Usuario values('Estudiante')
Insert into tblTipo_Usuario values('Profesor')
Insert into tblTipo_Usuario values('Directivo')
Insert into tblTipo_Usuario values('Empleado')
Select * from tblTipo_Usuario
/*Crear tabla usuario*/
create table tblusuario
(
 Cedula int,
 Nombre varchar(30)not null,
 telefono int not null,
 Direccion varchar(30) not null,
 Cod_Tipo int not null,
 Estado_usuario varchar(30) not null,
 Primary Key (Cedula),
 Foreign key (Cod_Tipo)references 
 tblTipo_Usuario (Cod_Tipo) on delete cascade on update cascade
)
/*Datos para tabla usuario*/
Insert into tblusuario values(123,'Daniela','9541','751',1,'Vigente')
Insert into tblusuario values(124,'Camilo','9542','752',2,'Betado')
Insert into tblusuario values(125,'Ramon','9543','753',3,'Vigente')
Insert into tblusuario values(126,'Daniel','9541','751',1,'Vigente')
Insert into tblusuario values(127,'Camila','9542','752',2,'Betado')
Insert into tblusuario values(128,'Clara','9543','753',3,'Vigente')
Insert into tblusuario values(129,'Daniel','9541','751',1,'Vigente')
Insert into tblusuario values(130,'Camila','9542','752',2,'Betado')
Insert into tblusuario values(131,'Ramiro','9543','753',3,'Vigente')
Select * from tblTipo_Usuario

/*Crear Tabla dependencia*/
Create table tbldependencia
(
 Cod_Dependencia int identity (1,1),
 Nombre_Dependencia varchar(30)not null,
 Ubicacion  varchar(30)not null,
 Primary key (Cod_Dependencia)
)
/*Datos para Dependencia*/
Insert into tbldependencia values('Judicial','B1_103')
Insert into tbldependencia values('Sistemas','B5_203')
Insert into tbldependencia values('Administración','B3_106')
Insert into tbldependencia values('Educación','B3_107')
Insert into tbldependencia values('Agroambiental','B5_101')
Insert into tbldependencia values('electronica','B1_101')

/*Crear tabla Pertenece*/
create table tblPertenece
(
 Cedula int,
 Cod_Dependencia int not null,
 Primary key (Cedula,Cod_Dependencia),
 Foreign Key (Cedula) references
 tblusuario (Cedula) on delete cascade on update cascade,
 Foreign Key (Cod_Dependencia) references
 tblDependencia (Cod_Dependencia)on delete cascade on update cascade
)
/*Datos para Pertenece*/
Insert into tblPertenece values(123,1)
Insert into tblPertenece values(124,2)
Insert into tblPertenece values(125,3)
Insert into tblPertenece values(126,1)
Insert into tblPertenece values(127,2)
Insert into tblPertenece values(128,3)

/*crear tabla Tipo Material*/
create table tblTipo_Material
(
 CodTipo_Material int identity (1,1),
 NombreTipo_Material varchar(30)not null,
 CantidadTipo_Material int not null,
 Primary key(CodTipo_Material),
)
Insert into tblTipo_Material values('Libro',5000)
Insert into tblTipo_Material values('Revistas',4000)
Insert into tblTipo_Material values('Periodico',3000)
Insert into tblTipo_Material values('Audiovisual',3000)
/*Crear tabla Material*/

create table tblMaterial
(
 Cod_material int identity (1,1),
 Nombre_material varchar (30) not null,
 Valor int not null,
 año int  not null,
 CodTipo_Material int not null,
 check (Valor between 1000 and 200000),
 check (año between 1930 and 2012),
 cantidad int check (cantidad between 1 and 20),
 Primary Key (Cod_material),
 foreign key (CodTipo_Material) references
 tblTipo_Material (CodTipo_Material) on delete cascade on update cascade
)
/*Crear Index Unico para Nombre del material */
create unique index Nombre_material on tblMaterial (Nombre_material)

/*Datos para Material*/
Insert into tblMaterial values('Fundamentos de Bases de datos',50000,1989,1,4)
Insert into tblMaterial values('Modelos de bases de datos',50000,1990,1,2)
Insert into tblMaterial values('Nueva tecnología',70000,1990,2,2)
Insert into tblMaterial values('colombiano',90000,2012,3,5)
Insert into tblMaterial values('Sql 2008',50000,1999,1,2)
Insert into tblMaterial values('Al día',70000,1990,2,2)
Insert into tblMaterial values('Matemáticas operativas',90000,1991,1,2)
/*Crear tabla Ejemplar*/
create table tblEjemplar
(
 Num_Ejemplar int identity (1,1),
 Cod_Material int,
 estado varchar (30) not null,
 check (estado ='Prestado'OR estado ='Disponible'OR estado ='En reparacion'OR estado ='Reservado'),
 Primary key(Num_Ejemplar,Cod_Material),
 Foreign key (Cod_Material) references
 tblMaterial (Cod_Material)on delete cascade on update cascade
)
/*Datos para Ejemplar*/
Insert into tblEjemplar values(1,'disponible')
Insert into tblEjemplar values(2,'disponible')
Insert into tblEjemplar values(3,'disponible')
Insert into tblEjemplar values(1,'disponible')
Insert into tblEjemplar values(2,'disponible')
Insert into tblEjemplar values(3,'disponible')


/*Crear Tabla Prestamo*/
create table tblPrestamo
(
 Cod_Prestamo int identity (1,1),
 Fecha_Entrega datetime not null default getdate(),
 Fecha_Devolucion datetime not null,
 Cod_Material int not null,
 Num_Ejemplar int not null,
 Cedula int not null,
 Primary Key(Cod_Prestamo),
 Foreign Key (Num_Ejemplar,Cod_Material) references
 tblEjemplar (Num_Ejemplar,Cod_Material) on delete cascade on update cascade,
 Foreign Key (Cedula) references
 tblUsuario (Cedula) on delete cascade on update cascade
)
/*Datos para Prestamo*/
Insert into tblPrestamo values(getdate(),'03/10/2011',1,1,123)
Insert into tblPrestamo values(getdate(),'05/10/2011',2,2,124)
Insert into tblPrestamo values(getdate(),'06/10/2010',3,3,125)
Insert into tblPrestamo values(getdate(),'03/10/2011',1,1,123)
Insert into tblPrestamo values(getdate(),'05/10/2010',2,2,124)
Insert into tblPrestamo values(getdate(),'06/10/2011',3,3,125)
Insert into tblPrestamo values(getdate(),'03/10/2011',1,1,123)
Insert into tblPrestamo values(getdate(),'05/10/2011',2,2,124)
Insert into tblPrestamo values(getdate(),'06/10/2010',3,3,125)
Insert into tblPrestamo values(getdate(),'03/10/2011',1,1,123)
Insert into tblPrestamo values(getdate(),'05/10/2010',2,2,124)
Insert into tblPrestamo values(getdate(),'06/10/2011',3,3,125)
Insert into tblPrestamo values(getdate(),'03/10/2011',1,1,123)
Insert into tblPrestamo values(getdate(),'05/10/2011',2,2,124)
Insert into tblPrestamo values(getdate(),'06/10/2010',3,3,125)
Insert into tblPrestamo values(getdate(),'03/10/2011',1,1,123)
Insert into tblPrestamo values(getdate(),'05/10/2010',2,2,124)
Insert into tblPrestamo values(getdate(),'06/10/2011',3,3,125)

/*Crear tabla Reserva*/
create table tblReserva
(
 Cod_reserva int identity (1,1),
 Fecha datetime default getdate() not null,
 Cedula int not null,
 Cod_Material int not null,
 Primary key (Cod_reserva),
 Foreign Key (Cedula) references
 tblUsuario (Cedula) on delete cascade on update cascade,
 Foreign Key (Cod_Material) references
 tblMaterial (Cod_Material) on delete cascade on update cascade
)
/*Datos para Reserva*/

Insert into tblReserva values(getdate(),123,1)
Insert into tblReserva values(getdate(),124,2)
Insert into tblReserva values(getdate(),125,3)
Insert into tblReserva values(getdate(),123,1)
Insert into tblReserva values(getdate(),124,2)
Insert into tblReserva values(getdate(),125,3)
Insert into tblReserva values(getdate(),123,1)
Insert into tblReserva values(getdate(),124,2)
Insert into tblReserva values(getdate(),125,3)

/*Crear Tabla Devolucion*/
create table tblDevolucion
(
 Cod_Devolucion int identity (1,1),
 Fecha_Devolucion datetime default getdate() not null,
 Num_Prestamo int not null,
 Primary key (Cod_Devolucion),
 Foreign Key (Num_Prestamo) references
 tblPrestamo (Cod_Prestamo) on delete cascade on update cascade 
)
/*Datos para Devolucion*/

Insert into tblDevolucion values(getdate(),1)
Insert into tblDevolucion values(getdate(),2)
Insert into tblDevolucion values(getdate(),3)

select * from tblTipo_Usuario
select * from tblusuario
select * from tbldependencia
select * from tblpertenece
select * from tblmaterial
select * from tblejemplar
select * from tblusuario
select * from tblreserva
select * from tblprestamo
select * from tbldevolucion