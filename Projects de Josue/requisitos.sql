create database materias
use materias

create table materia 
( sigla varchar(7)  not null,
nombre varchar(5)  not null,
creditos int  not null
primary key (sigla)



);
create table prerequisito
(
siglaM int varchar (7) not null ,


);