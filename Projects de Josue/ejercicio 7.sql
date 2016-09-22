

             (
               select codC ,nombre,categoria
               from conductores
               where	categoria>15)
               --- decripcionm de los proyectpos 15 al 30 de septiembre 20
               select proyectos.codP,[maquinas ].codM,conductores.nombre
               from [maquinas ],proyectos,trabajos,conductores
				where proyectos.codP=trabajos.codp and conductores.codC=trabajos.codC and [maquinas ].codM=trabajos.codM 
				and (trabajos.fecha between '15-09-2003' and '30-09-2003')
				--nombre de las personas que han trabajado con volque
				select distinct conductores.nombre
				from conductores, trabajos, [maquinas ]
				where conductores.codC=trabajos.codC and trabajos.codM=[maquinas ].codM and [maquinas ].codM='mo3'
				order by nombre desc
				--proyectops de warnes que  trabajaron con una hormigera 
				select c.nombre,p.codP
				from conductores c ,trabajos t,proyectos p, [maquinas ] m
				where c.codC=t.codC and p.codP=t.codp and m.codM=t.codM and m.codM='mo2'
				       and p.localidad='warnes    '