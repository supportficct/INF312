create database VideoClub;
use VideoClub;

create table director
(
ID int not null,
nombre varchar(30) not null,
nacionalidad varchar (30) not null
primary key (ID)
 

);

create table socio
(
   CI int not null,
   nombreS varchar(30) not null,
   direccion varchar(30) null,
   CIAV int null
   primary key (CI)

);
alter table socio
add foreign key (CIAV) references socio(CI)
on delete no action 
on update no action;
create table autor
(
ID int not null,
nombre varchar not null,
nacionalidad varchar null
primary key (ID)
);
create table pelicula
(
COP varchar(10) not null,
IDD int not null,
titulo varchar(30) not null,
nacionalidad varchar(30) not null
primary key (COP)
foreign key (IDD) references director(ID)
on update cascade
on delete cascade 
);


create table  dirige(
CODPEL varchar(10) not null,
IDA int not null,
papel varchar(20) 
primary key (CODPEL,IDA)
foreign key (CODPEL) references pelicula(COP)
on update cascade 
on delete cascade ,
foreign key (IDA) references autor(ID)
on update cascade 
on delete cascade 

);
create table ejemplares 
(
  CDP varchar (10) not null,
  NRO int not null,
  estado varchar(20) not null
  primary key (NRO,CDP)
  foreign key (CDP) references pelicula(COP)   
  on update cascade 
  on delete cascade

);
create table alquila
(
CDPE varchar (10) not null,
NROE int not null,
NUMALQUILER int not null
primary key (CDPE,NROE,NUMALQUILER)

foreign key (NUMALQUILER) references notadealqui(NUMAL)
on update cascade 
on delete cascade

);
alter table alquila
add foreign key (CDPE) references ejemplares(CDP)
on delete no action
on update no action ;

create table notadealqui
(
   NUMAL int not null,
   DIAS int not null,
   FECHA date not null,
   CIS INT not null
   primary key (NUMAL)
   foreign key (CIS) references socio(CI)
   on update cascade 
   on delete cascade
   

);

