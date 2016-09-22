--1 CU ,nombre ,direc ,num cel ,num tel ,
select [tabla cliente].CI,[tabla cliente].nombre,[tabla Celular].celular,[tabla telefono].telefono
from [tabla Celular] left join [tabla telefono] on [tabla Celular].CI=[tabla telefono].ci
      inner join [tabla cliente] on [tabla Celular].CI=[tabla cliente].CI
      union 
      select [tabla cliente].CI,[tabla cliente].nombre,[tabla Celular].celular,[tabla telefono].telefono
      from [tabla telefono] left join [tabla Celular] on [tabla Celular].CI=[tabla telefono].ci
      inner join  [tabla cliente] on [tabla telefono].ci=[tabla cliente].CI
--diferencia  ci,num cel ,
select distinct [tabla Celular].CI,[tabla Celular].celular
from [tabla Celular],[tabla telefono]
where  [tabla Celular].CI <> [tabla telefono].ci and [tabla Celular].CI not in   (   select [tabla telefono].ci
                from [tabla telefono] inner join [tabla Celular] on [tabla telefono].ci=[tabla Celular].CI
                )
             
--
select ci
from [tabla Celular] except select ci from [tabla telefono]
--
select  CI,celular
from [tabla Celular]
except

select [tabla Celular].CI,[tabla Celular].celular
from  [tabla telefono] left join [tabla Celular] on [tabla telefono].ci=[tabla Celular].CI
--
select [tabla Celular].CI
from [tabla Celular],[tabla telefono]
where [tabla telefono].ci=[tabla Celular].CI
--
select CI
from [tabla Celular]
intersect
select ci
from [tabla telefono]