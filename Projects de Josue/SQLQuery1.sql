create database biblioteca;
use biblioteca;
create table personas
(
	CI int not null,
	nombre varchar(50) not null,
	sexo char not null,
	telefono int,
	primary key (CI)
);
select *
from persona;
--insertar
insert into personas values(111,'Joaquin Chumacero','M',75421689);
insert into personas values(222,'Saturmino Mamani','M',null);
insert into personas values(333,'Patricia Landivar','F',null);
--actualizar
update persona set nombre='Joaquin Schumager' where CI=111;
update persona set nombre ='XXX' where sexo='M';
--Borrar
delete from persona where CI=333;
--Consultas
select *
from persona
where sexo='M';
--Mostrar todas las personas que no tienen telefono
select *
from persona
where telefono is null;

--Mostrar todas las personas que tiene telefono
select *
from persona
where telefono is not null;
--mostrar todas las personas que sean mujeres y tengan telefono
select *
from persona
where sexo='F' and telefono is  null;

--borrar una tabla
drop table persona;

--borrar la base de datos
drop database biblioteca;














---------------------------------
Create  table libro
(
codigo int identity  (1001,1) not null,
titulo varchar (40) not null,
anio   int not null,
primary key (codigo)
);

insert into libro values('fundamentos de bd',2000);
insert into libro values('compiladores',2005);
insert into libro values('fundamenmtos de sql',2000);
insert into libro values('fundamentos de bd',2003); 
insert into libro values('fundamentos de bd2',2005); 

insert into libro values('Criptografia Rapida',2005); 

update libro set titulo='Criptografia Para Expertos' where codigo = 1006 
select *
from libro;
--mostrar  los libros del año 2000
select *
from libro 
where anio=2000;
--crear la tabla de FICHADEPRESTAMO
create table fichadDePrestamoss
(
nro  int not null,
fecha date not null,
dias int not null,
cip int not null,---tiene que ser del mismo dominio que la llave primaria de la otra tabla 
primary key (nro),
foreign key (cip) references personas (CI)
on update cascade ---mantienen la integidad referencial 
on delete cascade ---borra 
)

insert into fichadDePrestamoss values (1,'10/01/2013',2,111);--
insert into fichadDePrestamoss values (2,'10/01/2013',3,333);
insert into fichadDePrestamoss values (3,'10/01/2013',2,222);

select *

from fichadDePrestamoss;

--mostrar todas las fichas realizadas pos juaquin
select nro,fecha,dias
from  fichadDePrestamoss,personas
where cip=CI and 
  nombre ='juaqui chumacero' 
  
--mostrar todas las fichas realizadas pos juaquin donde el plazo se (mayor o igual 3) 

select nro,fecha,dias
from  fichadDePrestamoss,personas
where cip=CI and 
  nombre ='juaqui chumacero' and 
  dias>=3;

--utilizando consultas anidadas
select nro,fecha,dias
from fichadDePrestamoss
where cip in (--despues se ejecuta lo de afuera
select CI--primero se ejecuta loque esta en ()
from personas
where nombre='Joaquin Chumacero' ); 