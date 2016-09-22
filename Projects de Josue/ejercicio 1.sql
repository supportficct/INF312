--10nom numero de oredenes por vendedor  con ordenes mayores a 1500
select nombre,COUNT(*) as [numero de ordenes]
from vendedor inner JOIN orden on vendedor.CI=orden.CI and  monto>1500
group by vendedor.nombre
--11n nombre edad  cliente de la paz
select  DISTINCT V.nombre,DATEDIFF(YEAR,fecha_nacimiento,GETDATE()) AS [FECHA DE NACIMIENTO]
from vendedor V,orden O, CLiente C 
where  V.CI=O.CI AND O.codcli=C.Codcli 
      AND C.ciudad='La paz'
--NOMBRE DE MAYOR A DOS ORDENES
SELECT  V.nombre,COUNT(*) AS [NUMERO DE VENTAS ]
FROM vendedor V ,orden O
WHERE V.CI=O.CI
GROUP BY V.CI,V.nombre
HAVING COUNT(O.CI)>=2
--13 ELIMINAR TODOS DE BETHA


SELECT DISTINCT V.nombre
FROM vendedor V, orden O
WHERE          v.CI NOT IN        (SELECT CI
                  FROM CLiente INNER JOIN orden ON CLiente.Codcli=orden.codcli AND CLiente.nombre='betha Lta '   )

DELETE FROM vendedor
WHERE vendedor.CI IN   (SELECT CI
                  FROM CLiente INNER JOIN orden ON CLiente.Codcli=orden.codcli AND CLiente.nombre='betha Lta '   )
SELECT * FROM vendedor
--14
UPDATE vendedor SET sueldo=4000 WHERE CI='329'
--15
UPDATE vendedor SET sueldo =sueldo+(01*sueldo)
--16
INSERT INTO vendedor VALUES ('181','FEDERICO','18-06-79',NULL)
--17 NOMBRE DE CLIENTE ,TIPO INDUSTRIA ,NOMBRE Y EDAD DE LOS VENDEDORES DE LA PAZ
SELECT C.nombre,tipo,V.nombre
FROM vendedor V , orden O , CLiente C
WHERE V.CI=O.CI AND O.codcli=C.Codcli AND C.ciudad='La paz'
--18 nombre v,el nom cli, monto  arriva de 5000
select v.nombre,c.nombre,monto
from vendedor v,orden o,CLiente c
where v.CI=o.CI and  o.codcli=c.Codcli and o.monto>=5000
--nom ven,fecha ,los que nacieron el jueves
select nombre,fecha_nacimiento
from vendedor
where DATENAME(dw,fecha_nacimiento)='jueves'

select * from 