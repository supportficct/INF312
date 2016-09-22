create database videoclub1;
use videoclub1;

create table director 
(
 Id int not null, 
 Nombre varchar (50) not null, 
 Nacionalidad varchar (50) not null, 
 primary key (Id)
); 

insert into director values (200,'STEVEN SPILBERT', 'USA');
insert into director values (201,'JOAQUIN CHUMACERO', 'BOLIVIANO');

create table actor 
(
 Id int not null, 
 Nombre varchar (50) not null, 
 Nacionalidad varchar (50) not null, 
 Sexo char not null , 
 Papel varchar (20) not null 
 primary key (Id)
);

insert into actor values (1,'dwayne jhonson','americana','M','principal'); 
insert into actor values (2,'vin diesel','americanas','M','principal'); 
insert into actor values (3,'angelina jolie','americanas','F','principal'); 
insert into actor values (4,'robert daynet jr','americanas','M','principal'); 

create table pelicula
(
 Cod int not null, 
 Titulo varchar (50) not null, 
 Nacionalidad varchar (50) not null, 
 Productora varchar (50), 
 Año int,
 IdDirector int not null, 
 primary key (Cod),
 foreign key (iddirector) references director (id)
   on update cascade
   on delete cascade
 
);

insert into pelicula values (100,'gi-joe','americana','dreamwork',2013,200);
insert into pelicula values (101,'iron man 3','americana','disney',2013,201);
insert into pelicula values (102,'rapido y furioso 6','americana','paramount pictures',2013,200);
insert into pelicula values (103,'se busca',        'americana','dreamworks',2008,200);

Create table participa
(
  codPel int not null,
  idactor int not null,
  papel varchar (50) not null,
  primary key(codpel,idactor),
  foreign key (codpel) references pelicula(cod)
    on update cascade
    on delete cascade,
  foreign key (idactor) references actor(id)
    on update cascade
    on delete cascade  
);

insert into participa values (100,1,'Protagonista');
insert into participa values (100,3,'Secundario');
insert into participa values (101,4,'Protagonista');
insert into participa values (102,1,'Protagonista');
insert into participa values (102,3,'Secundario');
insert into participa values (103,2,'Protagonista');

create table ejemplar 
(
 CodigoPeli int not null ,
 NroE int not null, 
 Estado varchar (50) not null, 
 primary key (CodigoPeli,NroE),
 foreign key (CodigoPeli) references pelicula (Cod)
 on update cascade 
 on delete cascade
);

insert into ejemplar values (100,1,'Excelente');
insert into ejemplar values (100,2,'Excelente');
insert into ejemplar values (100,3,'Bueno');
insert into ejemplar values (101,1,'Excelente');
insert into ejemplar values (101,2,'Excelente');
insert into ejemplar values (102,1,'Bueno');
insert into ejemplar values (103,1,'Excelente');
insert into ejemplar values (103,2,'Bueno');

create table socio 
(
 Ci int not null, 
 Nombre varchar (50) not null, 
 Direccion varchar(50) not null, 
 Telefono int ,
 CiA int, 
 primary key (ci), 
);

 alter table socio 
 add foreign key (CiA) references socio (Ci)
 on update no action 
 on delete no action;


insert into socio values (111,'Saturnino Mamani','av.irala',null,null);
insert into socio values (222,'Pedro yupanqui','Av. landivar',67655,111);
insert into socio values (333,'Patricia Landivar','c. urkupiña 77',71077,null);

create table notaalquiler 
(
 Nro int not null, 
 FechaAlqui date not null, 
 Dias int not null, 
 IdSocio int not null, 
 primary key (Nro), 
 foreign key (IdSocio) references socio (Ci)
 on update cascade
 on delete cascade
); 

insert into notaalquiler values (1,'10/01/2013',2,111);
insert into notaalquiler values (2,'11/01/2013',3,333);
insert into notaalquiler values (3,'10/01/2013',2,111);

create table alquila 
(
 NroNota int not null,
 CodPeli int not null , 
 NroEjemplar int not null, 
 primary key (NroNota,CodPeli,NroEjemplar), 
 
 foreign key (NroNota) references notaalquiler (Nro)
 on update cascade 
 on delete cascade,
 
 foreign key (CodPeli,NroEjemplar) references Ejemplar (CodigoPeli,NroE)
 on update cascade
 on delete cascade,
 
); 
insert into alquila values (1,100,1);
insert into alquila values (1,101,2);
insert into alquila values (2,102,1);
insert into alquila values (2,103,1);
insert into alquila values (3,100,1);
insert into alquila values (3,103,2);

select * from socio;
select * from notaalquiler;
select * from alquila;
select * from ejemplar;
select * from pelicula;
select * from director;


select * from actor;


--mostrar la cantidad de veces que ha sido alquila la pelicula GI-joe
select   COUNT(NroNota) as cantidadDeveces
from pelicula,alquila
where Cod=CodPeli and Titulo='gi-joe'
--mostrar las peliculas alquiladas por saturnino mamani
select DISTINCT Cod,Titulo
from socio S,notaalquiler N,alquila A,ejemplar E,pelicula P
where  Nombre ='Saturnino Mamani' and 
Ci=IdSocio and Nro=NroNota  and CodPeli=CodigoPeli and Cod=CodigoPeli
--MOSTRAR LOS SOCIO S QUE HA SACADO PELICULAS Y NO TIEMEN QUIEN LOS AVALEN
SELECT  distinct S.Ci , S.Nombre
FROM socio S,notaalquiler,socio A
WHERE S.Ci=IdSocio and 
      A.CiA is  null
      
--mostrar la cnatidad de veces que han alqilado por socio
SELECT  Ci,Nombre,COUNT(*)
FROM socio ,notaalquiler
where Ci=IdSocio
GROUp by Ci,nombre;