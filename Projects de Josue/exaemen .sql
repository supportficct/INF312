--2 Examen parcial Base de Datos I
--Lopez Sandi Luis Daniel (212012398)

if db_id('Examen2') is not null
	begin
		use master
		drop database Examen2
	end
go	

USE MASTER
CREATE DATABASE Examen2
GO

use Examen2


create table lector
(
cilector int not null,
nombrelector varchar(50) not null,
direccion varchar(50) not null,
telefonolector int,
primary key (cilector),
);
create table encargado
(
ciencargado int not null,
nombreencargado varchar(50),
telefonoencargado int,
primary key (ciencargado),
);
create table libro
(
codigolibro int not null,
titulo varchar(50),
año int not null,
primary key (codigolibro),
);
create table prestamo
(
nroprestamo int not null,
fecha date not null,
dias int not null,
cilecto int not null,
ciencargad int not null,
monto int not null,
primary key (nroprestamo),
foreign key (cilecto) references lector(cilector)
on update cascade
on delete cascade,
foreign key (ciencargad) references encargado(ciencargado)
on update cascade
on delete cascade,
);
create table detalleprestamo
(
nroprestam int not null,
codigolibr int not null
primary key (nroprestam,codigolibr)
foreign key (nroprestam) references prestamo(nroprestamo)
on update cascade
on delete cascade,
foreign key (codigolibr) references libro(codigolibro)
on update cascade
on delete cascade
);


--Poblar Tablas
insert into lector values (111,'Joaquin Chumacero Yupanqui','Los Totaises',3563030);
insert into lector values (222,'Saturnino Mamani','Av. Cumavi',3558999);
insert into lector values (333,'Patricia Yucra','Barrio Cruz del Sur',7102030);

insert into encargado values (121,'Panfilio Cusicanqui',3561111);
insert into encargado values (122,'Fabiola Aguilera',7212323);

insert into libro values (101,'Introduccion a la programación',2000);
insert into libro values (102,'Fundamentos de bases de datos',2005);
insert into libro values (103,'Java para principiantes',2000);
insert into libro values (104,'Informacion aplicada',2009);

insert into prestamo values (1,'10/01/2009',1,222,122,5);
insert into prestamo values (2,'11/01/2009',2,111,121,2);
insert into prestamo values (3,'11/01/2009',3,333,122,5);
insert into prestamo values (4,'12/01/2009',2,111,121,4);
insert into prestamo values (5,'13/01/2009',2,111,122,4);

insert into detalleprestamo values(1,102);
insert into detalleprestamo values(1,103);
insert into detalleprestamo values(2,102);---///
insert into detalleprestamo values(3,104);
insert into detalleprestamo values(4,103);--
insert into detalleprestamo values(4,101);--
insert into detalleprestamo values(4,102);--///
insert into detalleprestamo values(5,104);---



select * from prestamo
select * from detalleprestamo
select * from lector
select * from encargado
select * from libro


--Consultas
--b)Mostrar los préstamos (nro,fecha,dias) que han tenido mayor o igual a 3 libros sacados
select p.nroprestamo,  p.fecha , p.dias 
from prestamo p 
where p.cilecto in (
						select p.cilecto 
						from prestamo p 
						group by p.cilecto
						having count(p.cilecto) >= 3
						)

		
--c)Mostrar una lista de todos los libros del año 2000(orden desc),donde encargado del préstamo no haya sino FABIOLA AGUILERA
select distinct l.*
from libro l ,detalleprestamo dp , prestamo p, lector le, encargado en
where l.codigolibro = dp.codigolibr
		and dp.nroprestam = p.nroprestamo
			and l.año = 2000 
				and p.ciencargad = en.ciencargado
					and en.nombreencargado != 'Fabiola Aguilera'
order by titulo asc


--d)Mostrar el monto total pagado por el libro FUNDAMENTOS DE BASE DE DATOS , donde el lector es JOAQUIN CHUMACERO YUPANQUI
select distinct le.nombrelector,sum(p.monto) as Total_Pagar
from libro l ,detalleprestamo dp , prestamo p, lector le
where l.codigolibro = dp.codigolibr
		and dp.nroprestam = p.nroprestamo
		  and p.cilecto = le.cilector
			and  le.nombrelector = 'Joaquin Chumacero Yupanqui'
				and l.titulo = 'Fundamentos de bases de datos'
group by le.nombrelector



---///
select nroprestamo,fecha,dias from prestamo ,  detalleprestamo , lector , libro
where	nroprestam = nroprestamo and
		codigolibr = codigolibro and
		cilector = cilecto
group by nroprestamo,fecha,dias
having Count(nroprestamo) >=3
order by  nroprestamo desc



select distinct titulo , año from libro, lector, encargado A , encargado B,prestamo , detalleprestamo
where	nroprestam = nroprestamo and
		codigolibr = codigolibro and
		cilector = cilecto and
		año = 2000 and
		a.nombreencargado not in (	select b.nombreencargado
									where b.nombreencargado = 'Fabiola Aguilar')
order by titulo asc
		



select  Sum(monto)as monto_total from prestamo , detalleprestamo , lector , libro
where	nroprestamo = nroprestam and
		codigolibr = codigolibro and
		cilecto = cilector and
		nombrelector ='Joaquin Chumacero Yupanqui' and
		titulo = 'Fundamentos de bases de datos';
