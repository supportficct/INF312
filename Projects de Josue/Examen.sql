create database examen
use  examen
create table estrella(
codigo int not null,
nombre varchar(20) not null,
direccion varchar(20) not null,
sexo varchar(1) not null,
fecha_nac date not null,
primary key(codigo)

);


insert into estrella values(1,'Pablo Peña','Av. Moscu Nro 300','m','01/02/1960');

insert into estrella values(2,'Pedro Marmol','Urb.los totaises','m','03/05/1970');
insert into estrella values(3,'Tatiana Limpias','AVv.medoza','f','01/03/1965');
insert into estrella values(4,'Samuel Mansilla','Barrio moscu','m','01/07/1975');

create table estudio
(
codigo int not null,
nombre varchar(20) not null,
direccion varchar(20) not null
primary key(codigo)

);

insert into estudio values (01,'Piramide','TEXAS-USA');
insert into estudio values (02,'MXG','SANTACRUZ-BOLIVIA');
insert into estudio values (03,'UMF','CAMIRI-bolivia');
 
 
 create table pelicula 
 (
   ID int not null,
   titulo varchar (20) not null,
   Anio int not null,
   duracion float not null,
   COD_estudio  int not null
   primary key (ID)
   foreign key (COD_estudio) references estudio(codigo)
   on update cascade
   on delete cascade
 
 
 );
 insert into pelicula values(1,'Titanic',2000,2,01);
  insert into pelicula values(2,'El zorro',1980,1.5,02);
 insert into pelicula values(3,'Amor salvaje',2001,2,01);
 insert into pelicula values(4,'Goliat I',1980,1,03);
 create table protagoniza
 (
 ID_pelicula int not null,
 COD_estrella int not null

 foreign key(ID_pelicula) references pelicula(ID)
 on update cascade
 on delete cascade,
 foreign key(COD_estrella) references estrella(codigo)
 on update cascade
 on delete cascade
 
 );
 
 insert into protagoniza values (1,2);
  insert into protagoniza values (2,1);
   insert into protagoniza values (3,1);
    insert into protagoniza values (3,3);
     insert into protagoniza values (4,2);
     
     
     select *from protagoniza 
        
     select *from pelicula
     select *from estrella  
     select *from estudio
     

 --;;;;;;;;;;;;;;;;;;;;;preguntas del examen;;;;;;;;;;;;
 --B mostrar las estrella que han protagonizado mayor o igual a dos peliculas
 select  codigo, nombre,COUNT(COD_estrella) as numero_que_participa_en_peliculas
 from estrella,protagoniza
 where   codigo=COD_estrella
 group by codigo,nombre
 having COUNT(COD_estrella)>=2
 --c)¿que mujer no ha protagonizado ninguna pelicula
            
   select distinct codigo,nombre
   from protagoniza,estrella
   where codigo=COD_estrella and sexo='f'
   group by codigo,nombre,COD_estrella
   having count(COD_estrella)=0
      
   -- d)mostrar la candita de peliculas por estudio 
   select codigo,nombre,COUNT(COD_estudio)
   from estudio,pelicula
   where  codigo=COD_estudio
   group by codigo,COD_estudio,nombre
      