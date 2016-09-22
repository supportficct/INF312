--numero ,nombre no tienen empleados 
select NROF,nombre
from oficina
where NROF not in(  
              select oficina.NROF from oficina inner join  empleado on oficina.NROF=empleado.NROF
              )
--nombre ,edad,numero 
select ci,nombre,DATEDIFF(year,fecha,GETDATE()) as edad  ,NROF
from empleado
where     ci not in  (select  ci
             from empleado inner join  oficina on empleado.NROF=oficina.NROF
             )
 ----------------------------------------------------------            
             select COUNT(*)
             from  empleado,oficina 
             where empleado.NROF=oficina.NROF and oficina.nombre='producc   '
 --------------------------------------------------------------
 select empleado.nombre,DATEDIFF(YEAR,fecha,GETDATE()) as año ,oficina.nombre
 from empleado left join  oficina on empleado.NROF=oficina.NROF 
 where  empleado.nombre  like'm%' 
 ----no pertenecen a o5,o6,o2		
 select empleado.nombre,oficina.nombre,empleado.NROF
 from  empleado inner join oficina on empleado.NROF=oficina.NROF
  where oficina.NROF not in ('o5','o6','o2')
 