CREATE DATABASE PROYECTO
USE PROYECTO
	
	CREATE TABLE CLIENTE(
		CI_CLIENTE INT NOT NULL,
		NOMBRE_CLIENTE VARCHAR(50)NOT NULL,
		NIT_CLIENTE INT,
		PRIMARY KEY(CI_CLIENTE)
	);
	
	CREATE TABLE FACTURA(
		NRO_FACTURA INT NOT NULL,
		CI_CLIENTES INT NOT NULL,
		CODIGO_EMPLEADOS INT NOT NULL,
		FECHA DATE NOT NULL,
		TOTAL INT NOT NULL,
		PRIMARY KEY(NRO_FACTURA),
		FOREIGN KEY(CI_CLIENTES) REFERENCES CLIENTE(CI_CLIENTE)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		FOREIGN KEY(CODIGO_EMPLEADOS) REFERENCES EMPLEADO(CODIGO_EMPLEADO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	
	CREATE TABLE DETALLE_VENTA(
		NRO_FACTURAS INT NOT NULL,
		ID_PRODUCTOS INT NOT NULL,
		PRECIO_UNITARIO INT NOT NULL,
		CANTIDAD INT NOT NULL,
		TOTAL_PARCIAL INT NOT NULL,
		PRIMARY KEY(NRO_FACTURAS,ID_PRODUCTOS),
		FOREIGN KEY(NRO_FACTURAS)REFERENCES FACTURA(NRO_FACTURA)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		FOREIGN KEY(ID_PRODUCTOS)REFERENCES PRODUCTO(ID_PRODUCTO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	
	CREATE TABLE PRODUCTO(
		ID_PRODUCTO INT NOT NULL,
		DESCRIPCION_PRODUCTO VARCHAR(50)NOT NULL,
		COSTO INT NOT NULL,
		ID_TIPO_PRODUCTO INT NOT NULL,
		PRIMARY KEY(ID_PRODUCTO),
		FOREIGN KEY(ID_TIPO_PRODUCTO)REFERENCES TIPO_PRODUCTO(ID_TIPO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	CREATE TABLE DETALLE_DE_PREPARACION
	(ID_PRO INT NOT NULL,
	  ID_INSUM INT NOT NULL
	  FOREIGN KEY(ID_PRO)REFERENCES PRODUCTO(ID_PRODUCTO)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		FOREIGN KEY(ID_INSUM)REFERENCES INSUMO(ID_INSUMO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	  );
	CREATE TABLE TIPO_PRODUCTO(
		ID_TIPO INT NOT NULL,
		DESCRIPCION_TIPO VARCHAR(50)NOT NULL
		PRIMARY KEY(ID_TIPO)
	);
	
	CREATE TABLE INSUMO(
		ID_INSUMO INT NOT NULL,
		NOMBRE_INSUMO VARCHAR(50)NOT NULL,
		PRIMARY KEY(ID_INSUMO)
	);
	
	CREATE TABLE MEDIDA(
		ID INT NOT NULL,
		DESCRIPCION VARCHAR(20) NOT NULL,
		PRIMARY KEY(ID)
	);
	
	CREATE TABLE DETALLE_COMPRA(
		NRO_RECIBOS INT NOT NULL,
		ID_INSUMOS INT NOT NULL,
		CANTIDAD INT NOT NULL,
		ID_MEDIDAS INT NOT NULL,
		TOTAL_PARCIAL INT NOT NULL,
		FOREIGN KEY(NRO_RECIBOS)REFERENCES RECIBO(NRO_RECIBO)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		FOREIGN KEY(ID_INSUMOS)REFERENCES INSUMO(ID_INSUMO)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		FOREIGN KEY(ID_MEDIDAS)REFERENCES MEDIDA(ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	
	CREATE TABLE RECIBO(
		NRO_RECIBO INT NOT NULL,
		ID_PROVEEDORES INT NOT NULL,
		CODIGO_EMPLEADOS INT NOT NULL,
		FECHA DATE NOT NULL,
		TOTAL INT NOT NULL
		PRIMARY KEY(NRO_RECIBO),
		FOREIGN KEY(ID_PROVEEDORES)REFERENCES PROVEEDOR(ID_PROVEEDOR)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
		FOREIGN KEY(CODIGO_EMPLEADOS)REFERENCES EMPLEADO(CODIGO_EMPLEADO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	
	CREATE TABLE PROVEEDOR(
		ID_PROVEEDOR INT NOT NULL,
		NOMBRE_PROVEEDOR VARCHAR(50) NOT NULL,
		NIT_PROVEEDOR INT NOT NULL,
		ID_TIPO_PROVEEDOR INT NOT NULL,
		PRIMARY KEY(ID_PROVEEDOR),
		FOREIGN KEY(ID_TIPO_PROVEEDOR)REFERENCES TIPO_PROVEEDOR(ID_TIPO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	
	CREATE TABLE TIPO_PROVEEDOR(
		ID_TIPO INT NOT NULL,
		DESCRIPCION_TIPO VARCHAR(20) NOT NULL,
		PRIMARY KEY(ID_TIPO)
	);
	
	CREATE TABLE EMPLEADO(
		CODIGO_EMPLEADO INT NOT NULL,
		NOMBRE_EMPLEADO VARCHAR(50) NOT NULL,
		ID_TIPO_EMPLEADO INT NOT NULL,
		PRIMARY KEY(CODIGO_EMPLEADO),
		FOREIGN KEY(ID_TIPO_EMPLEADO)REFERENCES TIPO_EMPLEADO(ID_TIPO)
		ON UPDATE CASCADE
		ON DELETE CASCADE
	);
	
	CREATE TABLE TIPO_EMPLEADO(
		ID_TIPO INT NOT NULL,
		DESCRPCION VARCHAR(30),
		PRIMARY KEY(ID_TIPO)
	);
SELECT CODIGO_EMPLEADO,NOMBRE_EMPLEADO,COUNT(CI_CLIENTE)
FROM EMPLEADO,FACTURA,CLIENTE
WHERE CODIGO_EMPLEADO=CODIGO_EMPLEADOS
GROUP BY CODIGO_EMPLEADO,NOMBRE_EMPLEADO,CI_CLIENTE
	--POBLACION
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,1);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,2);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,3);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,4);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,5);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,6);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,7);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,17);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(1,15);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,1);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,2);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,3);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,4);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,5);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,6);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(2,16);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,1);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,2);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,3);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,4);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,5);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,6);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,7);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,17);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,15);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(3,13);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(8,1);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(8,1);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(8,2);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(8,3);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(8,4);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(8,5);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,1);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,2);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,3);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,4);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,5);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,6);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,7);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,17);
	INSERT INTO DETALLE_DE_PREPARACION VALUES(11,15);
INSERT INTO DETALLE_DE_PREPARACION VALUES(8,17);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,2);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,3);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,9);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,12);
INSERT INTO DETALLE_DE_PREPARACION VALUES(10,2);
INSERT INTO DETALLE_DE_PREPARACION VALUES(16,3);
INSERT INTO DETALLE_DE_PREPARACION VALUES(16,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(16,6);
INSERT INTO DETALLE_DE_PREPARACION VALUES(16,17);
INSERT INTO DETALLE_DE_PREPARACION VALUES(17,3);
INSERT INTO DETALLE_DE_PREPARACION VALUES(17,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(17,6);
INSERT INTO DETALLE_DE_PREPARACION VALUES(17,13);
INSERT INTO DETALLE_DE_PREPARACION VALUES(17,17);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,2);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,3);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,6);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,12);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,15);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,16);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(32,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,2);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,3);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,6);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,13);
INSERT INTO DETALLE_DE_PREPARACION VALUES(33,17);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,1);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,2);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,3);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,6);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,10);
INSERT INTO DETALLE_DE_PREPARACION VALUES(34,17);
INSERT INTO DETALLE_DE_PREPARACION VALUES(36,6);
INSERT INTO DETALLE_DE_PREPARACION VALUES(36,4);
INSERT INTO DETALLE_DE_PREPARACION VALUES(36,20);

	--INSERTANDO VALORES A LA TABLA CLIENTE
	
	INSERT INTO CLIENTE VALUES(9812734,'JOSE ARMADO CASTA�EDA',8124357);
	INSERT INTO CLIENTE VALUES(9382748,'SARA MARTINEZ',7834417);
	INSERT INTO CLIENTE VALUES(8234723,'MARIA CESPEDES LUJAN',9384273);
	INSERT INTO CLIENTE VALUES(8423428,'ARCOS ALVARES ABDIEL SALVADOR',8382734);
	INSERT INTO CLIENTE VALUES(8767427,'ARGUELLO SANCHEZ ALEJANDRO',3847293);
	INSERT INTO CLIENTE VALUES(5673452,'BANDA ESTRADA DAVID ABRAHAM',4735489);
	INSERT INTO CLIENTE VALUES(8787644,'CARBALLO LUCERO JOSE LUIS',1283746);
	INSERT INTO CLIENTE VALUES(7567544,'D�AZ MARTIN RODRIGO',9837463);
	INSERT INTO CLIENTE VALUES(7654346,'GUERRERO ARROYO EDGAR ALEJANDRO',3728374);
	INSERT INTO CLIENTE VALUES(0923094,'SANCHEZ CASTELLANOS VILLAFUERTE FERNANDO',2038492);
	INSERT INTO CLIENTE VALUES(8234723,'TRUJILLO RIVERA EDUARDO ANTONIO',9847372);
	INSERT INTO CLIENTE VALUES(8223523,' VERA VALDEZ JOSE EDUARDO',8372832);
	INSERT INTO CLIENTE VALUES(8232434,' S�NCHEZ ARGAEZ DANIEL ARTURO',7563234);
	INSERT INTO CLIENTE VALUES(6234723,' ROLDAN PENSADO EDGARDO',3821723);
	INSERT INTO CLIENTE VALUES(4233355,'REYES AHUMADA GRACIELA ASTRID',2837347);
	INSERT INTO CLIENTE VALUES(6674344,'ORTEGA CASTILLO SOFIA',8374344);
	INSERT INTO CLIENTE VALUES(3464723,'LARA MALDONADO ANDRES',7364534);
	INSERT INTO CLIENTE VALUES(8233428,'HERNANDEZ SANCHEZ EDGAR SAID',2345654);
	INSERT INTO CLIENTE VALUES(6232322,' GUZM�N S�NCHEZ SERGIO',2634946);
	INSERT INTO CLIENTE VALUES(8000292,'CAMPOS MORA HECTOR FABIAN',3746844);
	INSERT INTO CLIENTE VALUES(9032423,'S�NCHEZ RAMOS MARCOS JULIAN',6452244);
	INSERT INTO CLIENTE VALUES(9034232,'RUEDA CONTRERAS MARA REGINA',8466734);
	INSERT INTO CLIENTE VALUES(9023442,'HERRERA SALDA�A ERNESTO DANIEL',1666224);
	INSERT INTO CLIENTE VALUES(9058583,'PERALES AGUILAR RAQUEL DEL CARMEN',3647765);
	INSERT INTO CLIENTE VALUES(8938943,'GONZALEZ TOKMAN MARIANO RAUL',4637778);
	INSERT INTO CLIENTE VALUES(8492343,'GARCIA PULIDO ANA LUCIA',8002387);
	INSERT INTO CLIENTE VALUES(8098595,'TRUJILLO RIVERA EDUARDO ANTONIO',8038746);
	INSERT INTO CLIENTE VALUES(9048332,'LOPEZ KOLKOVSKY ALFREDO LIOBOMIR',8067501);
	INSERT INTO CLIENTE VALUES(9484383,'GUTIERREZ QUINTAL LAURA MIREYA',8213245);
	INSERT INTO CLIENTE VALUES(6032342,'HERRERA REYES ALEJANDRA DONAJI',9030360);
	INSERT INTO CLIENTE VALUES(5958403,'LOPEZ KOLKOVSKY ALFREDO LIOBOMIR',5033540);
	
	--INSERTANDO VALORES A LA TABLA FACTURA
	      
	INSERT INTO FACTURA VALUES(123,5958403,2008,'2013/01/01',78);
	INSERT INTO FACTURA VALUES(124,6032342,2008,'2013/01/01',32);
	INSERT INTO FACTURA VALUES(126,9484383,2008,'2013/01/03',12);
	INSERT INTO FACTURA VALUES(127,9048332,2008,'2013/01/02',20);
	INSERT INTO FACTURA VALUES(128,8098595,2008,'2013/01/05',53);
	INSERT INTO FACTURA VALUES(129,8098595,2008,'2013/01/05',5);
	INSERT INTO FACTURA VALUES(130,8938943,2007,'2013/01/03',55);
	INSERT INTO FACTURA VALUES(131,9484383,2007,'2013/01/02',7);
	INSERT INTO FACTURA VALUES(132,9034232,2007,'2013/01/04',8);
	INSERT INTO FACTURA VALUES(133,9034232,2007,'2013/01/03',65);
	INSERT INTO FACTURA VALUES(134,9034232,2007,'2013/01/06',43);
	INSERT INTO FACTURA VALUES(135,8000292,2006,'2013/01/05',2);
	INSERT INTO FACTURA VALUES(136,8233483,2006,'2013/02/01',12);
	INSERT INTO FACTURA VALUES(137,6232323,2006,'2013/02/01',15);
	INSERT INTO FACTURA VALUES(138,8234723,2006,'2013/02/03',45);
	INSERT INTO FACTURA VALUES(139,8787644,2006,'2013/02/01',62);
	INSERT INTO FACTURA VALUES(140,4233352,2005,'2013/02/10',19);
	INSERT INTO FACTURA VALUES(141,8000292,2005,'2013/02/05',45);
	INSERT INTO FACTURA VALUES(142,9484383,2005,'2013/02/02',32);
	INSERT INTO FACTURA VALUES(143,6234723,2005,'2013/02/04',12);
	INSERT INTO FACTURA VALUES(145,6234723,2005,'2013/02/04',5);
	INSERT INTO FACTURA VALUES(146,6234723,2005,'2013/02/04',4);
	INSERT INTO FACTURA VALUES(147,9812734,2005,'2013/02/04',24);
	INSERT INTO FACTURA VALUES(148,8234723,2009,'2013/02/12',25);
	INSERT INTO FACTURA VALUES(149,8423428,2009,'2013/02/22',50);
	INSERT INTO FACTURA VALUES(150,8767427,2009,'2013/02/12',14);
	INSERT INTO FACTURA VALUES(151,8767427,2009,'2013/02/11',15);
	INSERT INTO FACTURA VALUES(152,6234723,2009,'2013/02/12',55);
	INSERT INTO FACTURA VALUES(153,6234723,2009,'2013/02/12',16);
	INSERT INTO FACTURA VALUES(154,5673452,2009,'2013/02/11',14);
	INSERT INTO FACTURA VALUES(155,5673452,2007,'2013/02/02',5);
	INSERT INTO FACTURA VALUES(156,8767427,2007,'2013/02/04',7);
	INSERT INTO FACTURA VALUES(157,8232434,2007,'2013/02/05',9);
	 	         
    --INSERTANDO VALORES A LA TABLA DETALLE DE VENTA
    INSERT INTO DETALLE_VENTA VALUES(123,1,4,20,80);
    INSERT INTO DETALLE_VENTA VALUES(124,2,3,10,30);
    INSERT INTO DETALLE_VENTA VALUES(126,9,4,5,20);
    INSERT INTO DETALLE_VENTA VALUES(127,20,3,5,15);
    INSERT INTO DETALLE_VENTA VALUES(128,7,4,11,44);
    INSERT INTO DETALLE_VENTA VALUES(129,13,2,1,2);
    INSERT INTO DETALLE_VENTA VALUES(130,34,50,1,55);
    INSERT INTO DETALLE_VENTA VALUES(131,16,7,1,7);
    INSERT INTO DETALLE_VENTA VALUES(132,17,7,1,7);
    INSERT INTO DETALLE_VENTA VALUES(133,19,4,15,60);
    INSERT INTO DETALLE_VENTA VALUES(134,35,15,2,30);
    INSERT INTO DETALLE_VENTA VALUES(135,6,2,1,2);
    INSERT INTO DETALLE_VENTA VALUES(136,9,12,1,12);
    INSERT INTO DETALLE_VENTA VALUES(137,35,15,1,15);
    INSERT INTO DETALLE_VENTA VALUES(138,38,20,1,20);
    INSERT INTO DETALLE_VENTA VALUES(139,8,15,4,60);
    INSERT INTO DETALLE_VENTA VALUES(140,9,3,5,20);
    INSERT INTO DETALLE_VENTA VALUES(141,38,20,2,40);
    INSERT INTO DETALLE_VENTA VALUES(142,10,10,3,30);
    INSERT INTO DETALLE_VENTA VALUES(143,20,2,6,12);
    INSERT INTO DETALLE_VENTA VALUES(145,3,3,2,6);
    INSERT INTO DETALLE_VENTA VALUES(146,2,2,2,4);
    INSERT INTO DETALLE_VENTA VALUES(147,11,5,4,20);
    INSERT INTO DETALLE_VENTA VALUES(148,2,1,20,20);
    INSERT INTO DETALLE_VENTA VALUES(149,11,5,10,50);
    INSERT INTO DETALLE_VENTA VALUES(150,16,3,5,15);
    INSERT INTO DETALLE_VENTA VALUES(151,10,15,1,15);
    INSERT INTO DETALLE_VENTA VALUES(152,8,15,3,45);
    INSERT INTO DETALLE_VENTA VALUES(153,17,4,4,16);
    INSERT INTO DETALLE_VENTA VALUES(154,2,2,7,14);
    INSERT INTO DETALLE_VENTA VALUES(155,5,5,1,5);
    INSERT INTO DETALLE_VENTA VALUES(156,3,3,2,6);
    INSERT INTO DETALLE_VENTA VALUES(157,19,3,3,9);
	
    
NRO_FACTURAS INT NOT NULL,
		ID_PRODUCTOS INT NOT NULL,
		PRECIO_UNITARIO INT NOT NULL,
		CANTIDAD INT NOT NULL,
		TOTAL_PARCIAL INT NOT NULL,
    --INSERTANDO VALORES A LA TABLA TIPO DE PRODUCTO

	INSERT INTO TIPO_PRODUCTO VALUES(1,'BEBIDAS');
	INSERT INTO TIPO_PRODUCTO VALUES(2,'POSTRES');
	INSERT INTO TIPO_PRODUCTO VALUES(3,'PANES');
	INSERT INTO TIPO_PRODUCTO VALUES(4,'JUGOS');
	
	--INSERTANDO VALORES A LA TABLA PRODUCTO
	
	--PRODUCTO TIPO PAN
	INSERT INTO PRODUCTO VALUES(1,'Pan aflorado',2,3);		 	         
	INSERT INTO PRODUCTO VALUES(2,'Pan bazo',2,3);		 	         
	INSERT INTO PRODUCTO VALUES(3,'Pan bon',3,3);		 	         
	INSERT INTO PRODUCTO VALUES(4,'Pan candeal',4,3);		 	         
	INSERT INTO PRODUCTO VALUES(5,'Pan ca��n',5,3);		 	         
	INSERT INTO PRODUCTO VALUES(6,'Pan cence�o',2,3);		 	         
	INSERT INTO PRODUCTO VALUES(7,'Pan de az�car o pil�n',6,3);		 	         
	INSERT INTO PRODUCTO VALUES(8,'Pan de molde',15,3);		 	         
	INSERT INTO PRODUCTO VALUES(9,'Pan de Pascua',12,3);		 	         
	INSERT INTO PRODUCTO VALUES(10,'Pan dulce',15,3);		 	         
	INSERT INTO PRODUCTO VALUES(11,'Pan franc�s',5,3);		 	         
	INSERT INTO PRODUCTO VALUES(12,'Pan pintado',12,3);		 	         
	INSERT INTO PRODUCTO VALUES(13,'Bodigo',4,3);		 	         
	INSERT INTO PRODUCTO VALUES(14,'Mollete',5,3);		 	         
	INSERT INTO PRODUCTO VALUES(15,'Morena',5,3);		 	         
	INSERT INTO PRODUCTO VALUES(16,'Donas',3,3);		 	         
	INSERT INTO PRODUCTO VALUES(17,'Empanadas',4,3);		 	         
	INSERT INTO PRODUCTO VALUES(18,'Panquesitos',5,3);		 	         
	INSERT INTO PRODUCTO VALUES(19,'Cuernos',3,3);		 	         
	INSERT INTO PRODUCTO VALUES(20,'Pan blanco',2,3);		 	         
	--PRODUCTO TIPO POSTRE
	INSERT INTO PRODUCTO VALUES(32,'Brownies',10,2);		
	INSERT INTO PRODUCTO VALUES(33,'Tarta de Queso',28,2);	
	INSERT INTO PRODUCTO VALUES(34,'Tarta de manzana',14,2);	
	INSERT INTO PRODUCTO VALUES(35,'Pie de manzana',15,2);	
	INSERT INTO PRODUCTO VALUES(36,'Arroz con Leche',6,2);	
	INSERT INTO PRODUCTO VALUES(37,'Tarta de Chocolate',18,2);	
	INSERT INTO PRODUCTO VALUES(38,'Crema Catalana ',20,2);	
	
	--INSERTANDO VALORES A LA TABLA INSUMO
	
	INSERT INTO INSUMO VALUES(1,'Mantequilla');	
	INSERT INTO INSUMO VALUES(2,'Manteca');
	INSERT INTO INSUMO VALUES(3,'Harina');
	INSERT INTO INSUMO VALUES(4,'Azucar');
	INSERT INTO INSUMO VALUES(5,'Levadura');
	INSERT INTO INSUMO VALUES(6,'Leche');
	INSERT INTO INSUMO VALUES(7,'Sesamo');
	INSERT INTO INSUMO VALUES(8,'Papaya');
	INSERT INTO INSUMO VALUES(9,'Platano');
	INSERT INTO INSUMO VALUES(10,'Manzana');
	INSERT INTO INSUMO VALUES(12,'Chocolate');
	INSERT INTO INSUMO VALUES(13,'Queso');
	INSERT INTO INSUMO VALUES(14,'Durazno');
	INSERT INTO INSUMO VALUES(15,'Crema de leche');
	INSERT INTO INSUMO VALUES(16,'Frutilla');
	INSERT INTO INSUMO VALUES(17,'Huevo');
	INSERT INTO INSUMO VALUES(18,'Limon');
	INSERT INTO INSUMO VALUES(19,'Tamarido');
	INSERT INTO INSUMO VALUES(20,'Arroz');
	INSERT INTO INSUMO VALUES(21,'Maiz');
	INSERT INTO INSUMO VALUES(22,'Wiski');	
	  
	--INSERTANDO VALORES A LA TABLA MEDIDA

	INSERT INTO MEDIDA VALUES(3,'Kilogramos');
	INSERT INTO MEDIDA VALUES(4,'Litros');
	INSERT INTO MEDIDA VALUES(5,'Cajas');
	
	--INSERTANDO VALORES A LA TABLA TIPO PROVEEDOR
	
	INSERT INTO TIPO_PROVEEDOR VALUES(1,'Empresa');
	INSERT INTO TIPO_PROVEEDOR VALUES(2,'Particular');
	
	--INSERTANDO VALORES A LA TABLA PROVEEDOR 
	
	INSERT INTO PROVEEDOR VALUES(4223,'Harina Princesa',800.293-2,1);
	INSERT INTO PROVEEDOR VALUES(4224,'Leche Pil',800.293-4,1);
	INSERT INTO PROVEEDOR VALUES(4225,'Queso',800.234-2,2);
	INSERT INTO PROVEEDOR VALUES(4226,'Chocolate Dely',800.234-2,1);-- 
	INSERT INTO PROVEEDOR VALUES(4227,'Familia Fernandez',800.234-2,2);
	INSERT INTO PROVEEDOR VALUES(4228,'Saborizantes y Usos de pasteliria',800.124-2,1);
	
	--INSERTANDO VALORES A LA TABLA EMPLEADO 
	
	INSERT INTO EMPLEADO VALUES (2003,'ALCANTARA ALONZO FILOMENO ALBERTO',2);
	INSERT INTO EMPLEADO VALUES (2004,'LOREDO MENDEZ MARIA DEL ROSARIO',2);
	INSERT INTO EMPLEADO VALUES (2005,'RODRIGUEZ GALLARDO CLAUDIA ARACELI',1);
	INSERT INTO EMPLEADO VALUES (2006,'RUIZ AGUILAR ROXANA WENDOLINE',1);
	INSERT INTO EMPLEADO VALUES (2007,'SANTANA BEJARANO HILDEGARDO',1);
	INSERT INTO EMPLEADO VALUES (2008,'TORRES FLORES DAVID GUADALUPE',1);
	INSERT INTO EMPLEADO VALUES (2009,'VILLANUEVA GUTIERREZ JOSE IBRAHIM',1);
	
	--INSERTANDO VALORES A LA TABLA TIPO DE EMPLEADO 
	
	INSERT INTO TIPO_EMPLEADO VALUES (1,'CAJERO');
	INSERT INTO TIPO_EMPLEADO VALUES (2,'ENCARGADO');
	
	--INSERTANDO VALORES A LA TABLA RECIBO
	--INSERTANDO VALORES A LA TABLA DETALLE DE COMPRA
	  
	INSERT INTO DETALLE_COMPRA VALUES(53,3,20,3,30);
	INSERT INTO DETALLE_COMPRA VALUES(53,20,44,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(53,21,23,3,129);
	INSERT INTO DETALLE_COMPRA VALUES(54,6,20,4,234);
	INSERT INTO DETALLE_COMPRA VALUES(56,12,10,3,120);
	INSERT INTO DETALLE_COMPRA VALUES(53,3,20,3,30);
	INSERT INTO DETALLE_COMPRA VALUES(58,22,34,3,234);
	INSERT INTO DETALLE_COMPRA VALUES(59,8,10,5,190);
	INSERT INTO DETALLE_COMPRA VALUES(59,9,10,5,180);
	INSERT INTO DETALLE_COMPRA VALUES(59,10,10,5,120);
	INSERT INTO DETALLE_COMPRA VALUES(59,14,10,5,190);
	INSERT INTO DETALLE_COMPRA VALUES(56,12,30,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(54,20,30,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(55,13,15,3,120);
	INSERT INTO DETALLE_COMPRA VALUES(56,20,30,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(57,20,30,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(58,5,30,3,45);
	INSERT INTO DETALLE_COMPRA VALUES(59,20,30,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(60,20,44,3,123);
	INSERT INTO DETALLE_COMPRA VALUES(61,6,20,4,220);
	INSERT INTO DETALLE_COMPRA VALUES(62,13,10,3,123);
	INSERT INTO DETALLE_COMPRA VALUES(63,12,5,115);
	INSERT INTO DETALLE_COMPRA VALUES(64,20,14,3,130);
	INSERT INTO DETALLE_COMPRA VALUES(64,20,30,3,234);
	INSERT INTO DETALLE_COMPRA VALUES(65,2,30,3,145);
	INSERT INTO DETALLE_COMPRA VALUES(66,8,10,5,155);
	INSERT INTO DETALLE_COMPRA VALUES(67,20,30,3,245);
	INSERT INTO DETALLE_COMPRA VALUES(68,6,20,4,140);
	INSERT INTO DETALLE_COMPRA VALUES(69,13,10,3,149);
	INSERT INTO DETALLE_COMPRA VALUES(70,12,10,3,142);
	INSERT INTO DETALLE_COMPRA VALUES(71,12,30,3,324);
	INSERT INTO DETALLE_COMPRA VALUES(72,4,30,3,324);
	INSERT INTO DETALLE_COMPRA VALUES(73,12,10,3,139);
	INSERT INTO DETALLE_COMPRA VALUES(74,10,20,3,200);
	INSERT INTO DETALLE_COMPRA VALUES(75,6,20,4,150);
	INSERT INTO DETALLE_COMPRA VALUES(76,13,10,3,124);
	INSERT INTO DETALLE_COMPRA VALUES(77,12,10,3,134);
	INSERT INTO DETALLE_COMPRA VALUES(78,20,40,3,468);
	INSERT INTO DETALLE_COMPRA VALUES(79,5,3,3,40);
	INSERT INTO DETALLE_COMPRA VALUES(80,12,10,3,120);
	    