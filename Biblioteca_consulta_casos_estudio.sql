use DBBiblioteca2016

-- 1. Mostrar los datos de todos los materiales con un aumento del 5% si se han prestado en fechas mayores a 01/01/2010.
select * from tblMaterial a inner join tblPrestamo b on a.Cod_material = b.Cod_Material where b.Fecha_Entrega > 01/01/2010
update tblMaterial set Valor = Valor + Valor * 0.05 where Valor > 40000

-- 2. Mostrar el tipo de material y su promedio en valor de materiales que se ha prestado.
select tblTipo_Material.NombreTipo_Material, AVG(tblMaterial.Valor) as Promedio from tblTipo_Material
inner join tblMaterial on tblMaterial.CodTipo_Material = tblTipo_Material.CodTipo_Material
group by tblTipo_Material.NombreTipo_Material

-- 3. Mostrar los datos de los usuarios con estado pendiente que pertenecen a todas las dependencias.
select * from tblusuario a, tbldependencia b where Estado_usuario = 'pendiente' and b.Nombre_Dependencia
in ('judicial', 'sistemas', 'administracion', 'educacion', 'agroambiental', 'electronica')
