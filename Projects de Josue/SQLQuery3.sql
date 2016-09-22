select vendedor.fecha_nacimiento,vendedor.sueldo
from vendedor


-----obtener la edad
select DATEDIFF(year,fecha_nacimiento,GETDATE()) as edad,sueldo
from vendedor
---obtener nombre edad y sueldo de todos los vendedores que ha ejecutado alguana orden 
select  vendedor.nombre,DATEDIFF(year,fecha_nacimiento,GETDATE()),vendedor.sueldo
from vendedor,orden
where vendedor.CI=orden.CI	