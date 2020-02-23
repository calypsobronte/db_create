-- Usados la Base de datos DBBiblioteca
-- Lina María Montaño Ramírez
-- Web developer
use DBBiblioteca2016

-- Mostrar los datos de todos los usuarios Alba, Juan y Camila con un estado vigente.
SELECT * FROM  tblusuario
WHERE  (Nombre = 'Juan') AND
(Estado_usuario = 'Vigente') OR  
(Nombre = 'Alba') AND 
(Estado_usuario = 'Vigente') OR  
(Nombre = 'Camila') AND 
(Estado_usuario = 'Vigente')

-- Mostrar los datos de todos los materiales con un valor entre 30.000 y 80.000 y con un año mayor que 1.998
SELECT * FROM tblMaterial 
WHERE (Valor > 30000) AND 
(año > 1998) AND (Valor < 80000)

-- Mostrar los datos de todos los materiales  con un valor mayor que 35.000 y se han prestado
SELECT * FROM tblMaterial 
INNER JOIN tblPrestamo 
ON tblMaterial.Cod_material 
= tblPrestamo.Cod_Material 
where valor > 35000

-- Mostrar los datos de todos los materiales libros o revistas con un año mayor que 1.999 y se han reservado a usuarios de las dependencias Sistemas o judicial.
SELECT * FROM tblmaterial a inner join tblReserva i 
on a.Cod_material = i.Cod_Material 
inner join tblPertenece d on i.cedula=d.Cedula 
inner join tbldependencia b on 
d.Cod_Dependencia = b.Cod_Dependencia 
where a.año > 1999 and b.Nombre_Dependencia in ('Sistemas','Judicial')

-- Mostrar los datos de los materiales con un valor mayor que 30.000 y que se han reservado más de una vez.
SELECT DISTINCT Nombre_material, Valor, cantidad 
FROM tblMaterial m, 
(Select Cod_Material FROM tblReserva 
GROUP BY Cod_Material HAVING COUNT(*) >1) r  
WHERE m.Valor > 30000

-- Mostrar los datos de los usuarios que han prestado materiales más de 10 veces.
select * from tblusuario m,
(select cedula from tblPrestamo 
group by cedula having 
count (*)>10)g

--Mostrar los datos de todos los materiales con un valor mayor que 35.000 que no se han prestado
Select distinct tblMaterial.Cod_material, Nombre_material,Valor,año,cantidad,CodTipo_Material 
from tblMaterial where tblMaterial.Cod_Material 
not in (select tblPrestamo.Cod_Material from tblPrestamo) 
AND Valor>35000

-- Mostrar los datos de todos los usuarios con estado vigente y no han prestado materiales con año menor a 2.000.
select distinct tblusuario.cedula,Nombre, telefono, direccion, Cod_tipo,estado_usuario from tblusuario
where Cedula not in (select Cedula from tblPrestamo where Cod_Material in(select Cod_Material from tblMaterial 
where tblMaterial.año<2000)) and Estado_usuario='Vigente'

-- Mostrar los datos de los materiales que tienen un precio mayor que los materiales tipo audiovisual o revista.
select distinct tblMaterial.Cod_material, Nombre_material,Valor,año,cantidad,CodTipo_Material from tblMaterial
where valor > (select MAX(Valor) from tblMaterial 
where CodTipo_Material=2 or CodTipo_Material=4)