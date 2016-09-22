select S.CI,S.nombre AS SUPERVISOR,E.nombre AS EMPLEADO
from empleado S,empleado E
where S.CI=E.cis AND E.nombre='pedro'