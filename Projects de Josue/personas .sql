create database persona
use persona

create table personas
(
ID int not null,
nombre varchar(30) not null,
sexo   char not null,
idpadre int null ,
idmadre int null,
primary key (ID)
);

 alter table personas
	      add foreign key (idpadre)references personas(ID)
	      on update no action
	      on delete no action ;
	      
 alter table personas
	      add foreign key (idmadre)references personas(ID)
	      on update no action
	      on delete no action ;
	      insert into personas values (1,'jorge saucedo','M',null,null);
	      insert into personas values (2,'MARIANELA HUANACU','F',null,null);
	      insert into personas values (3,'FRANCISCO SAUSEDO','M',1,2);
	      insert into personas values (4,'SALOMONE CORTEZ','F',null,null);
	      insert into personas values (5,'HUGO SAUSEDO ','M',3,4);
	      insert into personas values (6,'ELIZABETH ACARAPI','F',null,null);
	      insert into personas values (7,'JODUE SAUSEDO','M',5,6);
	      insert into personas values (8,'jKEYLA SAUSEDO','M',5,6);
	      
	      
	      SELECT * FROM personas;
	      
	      
	     ---QUIENES SON LOS HIJOS DE HUGO SAUSEDO
	     SELECT  HIJ.ID,HIJ.nombre
	     FROM personas PA,personas HIJ 
	     WHERE PA.ID=HIJ.idpadre AND PA.nombre='HUGO SAUSEDO';
	      
	SELECT ID,NOMBRE
	FROM personas
	WHERE   IDPADRE IN(
	SELECT  ID 
	FROM personas
	WHERE nombre='HUGO SAUSEDO'
	
	);   
	      
	 --quien es la esposa de hugo sausedo 
	select  ID,nombre
	from personas
	where ID in
	                 ( SELECT idmadre
	                    FROM personas
	                    WHERE   IDPADRE IN(
	                     SELECT  ID 
	                    FROM personas
	                   WHERE nombre='HUGO SAUSEDO'
	
	                                       ));   
	--quienes son los nietos de francisco sausedo
                           
   SELECT  ID, nombre
   FROM personas
   WHERE idpadre in 
    (SELECT ID
	FROM personas
	WHERE   IDPADRE IN(
	SELECT  ID 
	FROM personas
	WHERE nombre='FRANCISCO SAUSEDO'
	
	));   
	--quien es la abulela
	                                
	                                
	                                
	                                
	                                
	                                
	                                
	                                SELECT * FROM personas;