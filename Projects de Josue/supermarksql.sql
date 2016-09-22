create database prestamos;
use prestamos;
create table cliente
(CI int not null,
nombre varchar(30) not null,
sexo char not null
primary key (CI)

);
create table notaDeVenta
(NRO int not null,
fecha date not null,
monto float not  null,
CIC int not null
primary key (NRO)
foreign key(CIC) references cliente(CI)
on update cascade
on delete cascade
);

create table detalle 
( NROP int not null,
codigoP varchar(4) not null,
cantidad int not null,
precico float not null
primary key (NROP,codigoP)
foreign key (NROP) references notaDeVenta(NRO)
on update cascade
on delete cascade,
foreign key (codigoP) references producto(codigo)
on update cascade
on delete cascade



);

create table producto
(
  codigo varchar(4) not null,
  nombre varchar (30) not null,
  precio FLOAT not null
primary key(codigo)
);
insert into cliente values(111,'joaquin chumacero','M');
insert into cliente values(222,'saturnino mamani','M');
insert into cliente values(333,'patricia landivar','F');




insert into notaDeVenta values(1,'10/02/2013',130,222);
insert into notaDeVenta values(2,'10/02/2013',40,333);
insert into notaDeVenta values(3,'11/02/2013',170,111);
insert into notaDeVenta values(4,'11/02/2013',600,222);
insert into notaDeVenta values(5,'12/02/2013',60,333);




insert into producto values('PO2','mouse',10);
insert into producto values('PO1','teclado',15);
insert into producto values('PO3','monitor flatpanel',100);
insert into producto values('PO4','disco duro 1TB',300);
insert into producto values('PO5','router wireless',45);
insert into producto values('PO6','parlantes',10);
/*delete 
 from
  where*/

insert into detalle values(1,'PO2',2,15);
insert into detalle values(1,'PO3',1,100);
insert into detalle values(2,'PO5',1,40);
insert into detalle values(3,'PO2',5,10);
insert into detalle values(3,'PO1',2,10);
insert into detalle values(3,'PO6',10,10);
insert into detalle values(4,'PO4',2,300);
insert into detalle values(5,'PO2',4,15);
--cual es la suma total de venta?
select SUM(monto) as total
From notaDeVenta 
--cual es la venta mas alta
select max(monto) as ventaalta
From notaDeVenta ;
--cual es la venta mas baja
select min(monto) as ventabaja
From notaDeVenta ;
--venta promedio

select AVG(monto) as PROMEDIO
From notaDeVenta ;
--cuantas ventas se an realizado
--cuando es asteristico * cuenta los numero de filas 
--cuando pongo monto cuenta las filas hay sin contar los null
select COUNT(*) as cantidadventas
From notaDeVenta ;
select COUNT(monto) as cantidadventas
From notaDeVenta ;
--¿cuanto a gastado en total  juaqui chuma?
select sum(monto) as montop
from cliente,notaDeVenta
where nombre='joaquin chumacero' and 
         CI=CIC 
--¿cuatas veces ha comprado patricia ladivar?
select COUNT(*)
from cliente,notaDeVenta,detalle
where nombre='patricia landivar' and 
         CI=CIC and 
         NRO=NROP
  --mostrar la cantidad total de mouse que se han vendido 
  select  sum(cantidad) as cantidad
  from producto,detalle
  where nombre='mouse' and codigo=codigoP
 --cuantas veces ha comprado teclado saturnino mamani
 select COUNT(*)
 From cliente cli,notaDeVenta,detalle,producto p
 where cli.nombre='saturnino mamani' and
  CI=CIC and 
 NRO=NROP and 
 p.nombre='mouse' and 
 p.codigo=codigoP
 --cual es la cantidad maxima de teclados se a vendido
  select MAX(cantidad)
 From detalle,producto
 where nombre='mouse' and codigo=codigoP
 --GROUP  agrupa  alos datos y lo suma 
 select  CIC,sum/*min max count (veces que compra el producto )*/(monto) total
 from notaDeVenta
 group by CIC;
 --cantodad de ventas por cliente 
 select  CIC,nombre,count /*min max count (veces que compra el producto )*/(monto) total
 from notaDeVenta,cliente
 where CIC=CI
 group by CIC,nombre;
 --cantodad de ventas por cliente  varones 
 select  CIC,nombre,count /*min max count (veces que compra el producto )*/(monto) total
 from notaDeVenta,cliente
 where CIC=CI and sexo='M'
 group by CIC,nombre;
 -- cual es la cantidad maxima vendida por producto?
 select codigo,nombre,MAX(cantidad)
 from   producto,detalle
 where codigo=codigoP
 group by codigo,nombre
 order by codigo,nombre

 --HAVING-----
 select codigo,nombre,MAX(cantidad)
 from   producto,detalle
 where codigo=codigoP
 group by codigo,nombre

 having max(cantidad)>3;
 
 --mostrar los clientes que han realizado mas de una compra
 
 select CI,nombre,COUNT(*)
 from  cliente,notaDeVenta 
 where   CIC=CI 
 group by CI,nombre
 having COUNT(*)>1;
 --mostrar cuantos productos se han vendido por cada nota de venta?
 
 select NRO,fecha,count(codigoP)
 from  notaDeVenta,detalle
 where   NRO=NROP
 group by NRO,fecha
 
 
 
 
 --DEScargar   
 --SQLITE3   www.sqlite.org
 -- sqlite3 XXXXXXXX.db
   --NAVi CAT PREMIUM
 
 
 select * from cliente;
 select * from notaDeVenta;
 
 
 select * from detalle;
 
 select * from producto;