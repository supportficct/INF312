use Clase_1

create table produc  ----------
(
cprd integer  primary key,
nomp char(40), --not null,
colo char(15)  -- not null
)

insert into produc values(1,'PRD1','ROJO')
insert into produc values(2,'PRD2','VERDE')
insert into produc values(3,'PRD3','AMARILLO')
insert into produc values(4,'PRD4','ROJO')
insert into produc values(5,'PRD5','AMARILLO')

delete from produc

select * 
from produc

BULK 
insert produc
from 'E:\BD\exportacion_productos.csv'
--with (firstrow = 1 ,fieldterminator = ';', Rowterminator = '\n')
with (firstrow = 5,fieldterminator = ';', Rowterminator = '\n')