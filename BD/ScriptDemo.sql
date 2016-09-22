use Core

--drop table prov
create table prov
(
cprv integer not null primary key,
nomb char(40) not null,
ciud char(2) not null
)

--drop table alma
create table alma
(
calm integer not null primary key,
noma char(40) not null,
ciud char(2) not null
)

---drop table prod
create table prod
(
cprd integer not null primary key,
nomp char(40) not null,
colo char(15) not null
)



--drop table sumi
create table sumi
(
cprv integer not null,
calm integer not null,
cprd integer not null,
ftra date not null,
cant decimal(12,2) not null,
prec decimal(12,2) not null,
impt decimal(12,2) not null,
foreign key(cprv) references prov,
foreign key(calm) references alma,
foreign key(cprd) references prod
)

insert into prov values(1,'PRV1','SC')
insert into prov values(2,'PRV2','LP')
insert into prov values(3,'PRV3','CB')

insert into alma values(1,'ALM1','CB')
insert into alma values(2,'ALM2','SC')
insert into alma values(3,'ALM3','LP')

insert into prod values(1,'PRD1','ROJO')
insert into prod values(2,'PRD2','VERDE')
insert into prod values(3,'PRD3','AMARILLO')
insert into prod values(4,'PRD4','ROJO')
insert into prod values(5,'PRD5','AMARILLO')

---delete from prod

insert into sumi values(1,3,1,'1/1/2012',20,5,100)
insert into sumi values(1,2,1,'25/2/2012',10,5,50)
insert into sumi values(1,2,3,'10/1/2012',80,2,160)
insert into sumi values(3,2,3,'15/3/2012',10,2,20)
insert into sumi values(3,1,3,'12/4/2012',40,2,80)
insert into sumi values(1,1,1,'1/1/2011',2,4,8)
insert into sumi values(1,2,1,'20/2/2011',100,5,500)
insert into sumi values(1,2,2,'11/12/2011',40,2,80)
insert into sumi values(3,3,3,'15/3/2012',1,2,2)
insert into sumi values(3,1,2,'12/4/2012',25,2,50)
insert into sumi values(3,1,4,'12/6/2012',15,3,45)

select*from prov
select*from alma
select*from prod 
select*from sumi  

-- Mostrar los productos de color ROJO
select *
from prod
where colo = 'Rojo'

-- Mostrar los Proveedores de las ciudades de Santa y La Paz`
select *
from prov
where ciud = 'Santa' or ciud = 'La Paz'

-- Mostrar los Almacenes de SC, CB, PA, BE Y TA

select *
from alma
where ciud IN  ('SC','CB','PA','BE','TA')

-- Mostrar los productos existente en cada alamacen
select distinct sumi.calm,noma,sumi.cprd,nomp
from alma,sumi,prod
where alma.calm = sumi.calm and sumi.cprd = prod.cprd
order by sumi.calm,sumi.cprd


-- Mostrar los Almacenes de la ciudad de Cochabamba
select *
from alma
where ciud = 'CB'

-- Mostrar los Productos Existentes en los almacenes de la ciudad de Santa Cruz
select nomp
from prod,sumi,alma
where alma.calm = sumi.calm and sumi.cprd = prod.cprd and alma.ciud = 'SC' 

select nomp 
from prod
where cprd in ( 
				select cprd
				from sumi,alma
				where alma.calm = sumi.calm and alma.ciud = 'SC')
				
select nomp 
from prod
where cprd in ( 
				select cprd
				from sumi
				where calm in ( 
							select calm
							from alma
							where ciud = 'SC'))
							
-- Mostrar los Proveedores que Suministraron algun Producto 
select nomb
FROM prov
where cprv in (
				select cprd               /*****/
				from sumi  )
				
-- Mostrar los Productos Suminstrados por el Proveedor PRV3
select distinct prod.*
from prod,sumi
where prod.cprd=sumi.cprd and  sumi.cprv =3
				
-- Mostrar los nombres de los proveedores que suministraron algun producto color rojo
select nomb
from prov
where cprv in (
				select cprd                     /*****/
				from prod
				where colo = 'rojo')
				
				
select nomb
from prov
where cprv in (
				select cprv                     
				from sumi
				where cprd in ( select cprd
				from prod
				where colo = 'Rojo'))
							
-- Mostrar los Productos existente en el Alamcenes 1,que fueron suministrado por el Proveedor PRV1 

select prod.*
from prod,alma,sumi,prov
where prod.cprd=sumi.cprd and  sumi.calm = alma.calm and alma.noma = 'ALM1'
 and prov.cprv = sumi.cprv and prov.nomb = 'PRV1'

--Mostrar los Productos de color Amarillo sunistrados por el Proveedor PRV2
select prod.*
from prod,sumi,prov
where prod.cprd=sumi.cprd and prod.colo = 'Amarrillo' and
prov.nomb = 'PRV2'

-- Mostrar los nombres de los productos sunistrados el año pasado por el proveedor PRV1
select distinct prod.nomp
from prod,sumi,prov
where prod.cprd=sumi.cprd and YEAR(sumi.ftra)<2012 and prov.cprv = sumi.cprv and prov.nomb = 'PRV1'

-- Mostrar los nombres de los productos sunistrados el primer trimestre del año 2012 
select distinct prod.nomp
from prod,sumi
where prod.cprd=sumi.cprd and MONTH(sumi.ftra)<4 and YEAR(sumi.ftra) = 2012

-- Mostrar las transaciones sumistradas cuyas cantidades superan al promedio de cantidades suministradas 
select sumi.*
from sumi
where cant > ( select AVG(cant) --as promedio
				from sumi)
-- Mostrar los nombres de proveedores y las ciudades donde los proveedores suministraron productos
select distinct prov.cprv, prov.nomb,alma.ciud
from prov,sumi,prod,alma
where prov.cprv = sumi.cprv and alma.calm = sumi.calm and  prod.cprd = sumi.cprd

-- Mostrar los nombres de los proveedores que suministraron algun producto
   select distinct prov.nomb
   from prov,sumi,prod
   where prov.cprv = sumi.cprv and prod.cprd = sumi.cprd
   
-- Mostrar los nombres de los proveedores que suministraron algun producto color rojo
   select distinct prov.nomb
   from prov,sumi,prod
   where prov.cprv = sumi.cprv and prod.cprd = sumi.cprd and prod.colo = 'Rojo'
   
-- Mostrar los nombres de los proveedores que suministraron algun producto fuera de su ciudad
   select distinct prov.*  , alma.ciud
   from prov,sumi,prod,alma
   where prov.cprv = sumi.cprv and prod.cprd = sumi.cprd  and alma.calm=sumi.calm 
   and prov.ciud <> alma.ciud
   