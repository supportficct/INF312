--EMPLEADOPS QUE TRABAJAN  EN EL MISMO PROYECTO QUE  ALFREDO
 
 
SELECT DISTINCT empleado1.CI,empleado1.nombre,proyecto.nombre
FROM [empleado proyecto],empleado1,proyecto
WHERE    empleado1.CI=[empleado proyecto].CI and [empleado proyecto].NP=proyecto.NP AND   [empleado proyecto].NP  IN ( SELECT [empleado proyecto].NP
                                    FROM empleado1,[empleado proyecto],proyecto
                                    WHERE empleado1.CI=[empleado proyecto].CI AND proyecto.NP=[empleado proyecto].NP AND empleado1.nombre='ALFREDO')
                                           AND empleado1.nombre IN (
                                    SELECT empleado1.nombre
                                    FROM empleado1,[empleado proyecto],proyecto
                                    WHERE  empleado1.CI =[empleado proyecto].CI 
                                    and proyecto.NP=[empleado proyecto].NP and  proyecto.NP <=all (
                                    SELECT [empleado proyecto].NP
                                    FROM empleado1,[empleado proyecto]
                                    
                                    WHERE empleado1.CI=[empleado proyecto].CI AND empleado1.nombre= 'ALFREDO'
                                    ))