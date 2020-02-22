/* Para crear una B de D*/
create database BD_Constructora
use  BD_Constructora

/* Crear tabla oficio mirar el comando abajo*/
create table tblOficio(Tipo_Oficio varchar(30),
Bonificacion int,
check(Bonificacion >= 30000 and Bonificacion <= 80000),
Horas_Semanas int,
check(Horas_Semanas >= 30 and Horas_Semanas <= 60),
Primary key (Tipo_Oficio))

/*Crear tabla Trabajador*/
create table tblTrabajador(Cedula int,
Nombre varchar(50) not null,
Valor_Hora int,
/*check es el comando que se utiliza para hacer las validaciones*/
check(Valor_Hora >= 7000 and Valor_Hora <= 20000),
Tipo_Oficio varchar(30),
primary key (Cedula),
foreign key (Tipo_Oficio)references
tblOficio(Tipo_Oficio))

/*Crear tabla Area*/
create table tblArea(Cod_Area varchar(10),
Nom_Area Varchar(30),
Estrato int,
check(Estrato >= 1 and Estrato <= 7),
primary key (Cod_Area))

/*Crear tabla edificio*/
create table tblEdificio(Iden_Edif int,
Direccion varchar(30),
Tipo varchar (30),
Calidad int,
check (Calidad >= 1 and Calidad <= 5),
Categoria int,
check(Categoria >= 1 and Calidad <= 5),
Cod_Area varchar (10)
primary key (Iden_Edif),
foreign key(Cod_Area)references tblArea(Cod_Area))

/*Crear tabla Asignar*/
create table tblAsignar(Cedula int,
Iden_Edif int,
Fecha_I datetime,
Num_Dias int,
check (Num_Dias > 0),
Primary key(Cedula,Iden_edif),
foreign key(Cedula) references tbltrabajador(cedula),
foreign key(Iden_edif) references tblEdificio(Iden_Edif))

/********insertar registros para trabajador************/
/*sugerencia ejecute por linea para que reconozca facilmente el erro si lo hay**/ 

Insert into tbloficio values('Decorador',30000,35)
Insert into tbloficio values('Albañil',35000,37)
Insert into tbloficio values('Carpintero',31000,40)
Insert into tbloficio values('Electrico',35000,35)
Insert into tbloficio values('Arquitecto',40000,30)

Insert into tbltrabajador values(1235,'Annie',12500,'Electrico')
Insert into tbltrabajador values(1311,'Roberto',15750,'Decorador') 
Insert into tbltrabajador values(1412,'Carlos',13700,'Decorador') 
Insert into tbltrabajador values(1415,'Lina',12500,'Decorador') 
Insert into tbltrabajador values(1418,'Pedro',10000,'Carpintero')
Insert into tbltrabajador values(1520,'Luis',11750,'Electrico') 
Insert into tbltrabajador values(1525,'Juan',20000,'Arquitecto')
Insert into tbltrabajador values(2920,'Raul',10000,'Carpintero')
Insert into tbltrabajador values(3001,'Gabriel',15500,'Decorador')
Insert into tbltrabajador values(3231,'Alvaro',17400,'Decorador') 
Insert into tbltrabajador values(4446,'Mario',8200,'Albañil') 
Insert into tbltrabajador values(8520,'Bernardo',8500,'Albañil')


Insert into tblarea values('a10','Sur',2)
Insert into tblarea values('a11','Sur',4)
Insert into tblarea values('a12','Norte',3)
Insert into tblarea values('a13','Norte',2)

Insert into tbledificio values(111,'calle1213','Oficina',3,2,'a10')
Insert into tbledificio values(210,'calle1222','Oficina',4,3,'a10')
Insert into tbledificio values(215,'calle1215','Comercio',5,3,'a11')
Insert into tbledificio values(312,'calle1313','Oficina',5,2,'a13')
Insert into tbledificio values(435,'calle1513','Comercio',2,4,'a13')
Insert into tbledificio values(460,'calle1263','Almacen',4,4,'a12')
Insert into tbledificio values(520,'calle1223','Residencia',3,5,'a10')
Insert into tbledificio values(820,'calle1245','Almacen',3,5,'a10')

Insert into tblasignar values(1235,111,'02/02/02',25)
Insert into tblasignar values(1235,210,'01/03/02',5)
Insert into tblasignar values(1235,520,'02/02/02',25)
Insert into tblasignar values(1235,820,'01/03/02',5)
Insert into tblasignar values(1235,215,'02/07/02',10)
Insert into tblasignar values(1235,312,'02/02/02',10)
Insert into tblasignar values(1235,435,'01/02/04',22)
Insert into tblasignar values(1235,460,'02/02/05',21)
Insert into tblasignar values(1412,210,'02/02/02',22)                                   
Insert into tblasignar values(1412,312,'02/02/02',14)
Insert into tblasignar values(1418,435,'02/02/02',23)
Insert into tblasignar values(1418,460,'02/02/02',10)       
Insert into tblasignar values(3231,312,'02/02/02',25)       
Insert into tblasignar values(3231,111,'02/02/02',13)       
Insert into tblasignar values(4446,111,'02/02/02',18)

Select * from tblasignar