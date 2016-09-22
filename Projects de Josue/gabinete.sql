create database gabineteDeAbogados;
use gabineteDeAbogados;
create table abogado
(
  CI int not null,
  nombre varchar(50) not null,
  direccion varchar(50) not null,
  primary key (CI)
  );
  create table lleva
  (CIabogado int not null,
   NROExp varchar(50) not null,
   fechaIni date  not  null ,
   primary key (CIabogado,NROExp),
   
   foreign key (CIabogado) references abogado (CI)
    on update cascade
    on delete cascade ,
   foreign key (NROExp) references   asunto(numeroDeexpeniente)
  on update cascade
    on delete cascade 
  );
  create table asuntos
  (numeroDeexpeniente varchar(50) not null,
    fechadeInicio date not null,
    fecadeFin date not null,
    estado varchar(50) not null,
    CICL int not null,
    primary key (numeroDeexpeniente),
    foreign key (CICL) references cliente(CI)
    on update cascade
    on delete cascade 
      
  
  
  );
  create table cliente
  ( 
   CI int not null,
     nombre varchar (50) not null,
     direccion varchar (50) null,
     telefono int null,
     primary key (CI)
       
  );
  insert into abogado values (111,'juan mario','tokyo');
  
  insert into abogado values (112,'juana maria','osaka');
  
  
  insert into abogado values (113,'juan chumaciero','calle bolivia');
  
  
  
  insert into cliente values (111,'saturnino','tokyo',7804923);
  
  insert into cliente values (222,'saturnino','osaka',7804523);
  
  insert into cliente values (333,'saturnino','XDddd',7004923);
  

 select *
 from asuntos

 select *
 from cliente
   
  
 select *
 from abogado
 
 select *
 from lleva 
  
  insert into asuntos values (122,'10/01/2013','10/02/2013','habil',111);
  insert into asuntos values (124,'11/01/2013','10/02/2013','habil',222);
  insert into asuntos values (123,'12/01/2013','10/02/2013','habil',222);
  