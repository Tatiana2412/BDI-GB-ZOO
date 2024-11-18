--

SELECT E.nombre as especie,
ec.nombre as estado_conservacion, 
FA.nombrecomun

FROM especie E 
INNER JOIN estado_conservacion EC ON E.idestadoconservacion = EC.id
INNER JOIN familia FA ON E.idfamilia = FA.ID 
WHERE E.nombre LIKE'%Delfín%';

-- INNER JOIN Listar los animales con el nombre de su cuidador y el habitad en el que viven.


SELECT A.nombre as animales,
CU.nombre as cuidador, 
HA.nombre as habitat

FROM animales A 
INNER JOIN  cuidador CU ON A.idcuidador = CU.id
INNER JOIN habitat HA ON A.idhabitat = HA.id

-- LEFT JOIN Listar todos los animales, incluyendo aquellos que no tienen hábitat asignado. 

SELECT A.nombre as animales,
HA.nombre as habitat

FROM animales A LEFT JOIN habitat HA ON A.idhabitat = HA.id

-- RIGHT JOIN Listar todos los cuidadores y los animales que tienen asignados, incluyendo cuidadores que no tienen animales a su cargo.

SELECT A.nombre as animales,
CU.nombre as cuidador 

FROM animales A RIGHT JOIN cuidador CU ON A.idcuidador = CU.id

-- FULL JOIN Listar todas las especialidades y los cuidadores que las poseen, incluyendo especialidades que no estan asignadas a ningun cuidador y cuidadores sin especialidad.

SELECT CU.nombre as cuidadores,
ES.nombre as especialidad

FROM cuidador CU
FULL JOIN especialidad ES ON CU.idespecialidad = ES.id

-- SELF JOIN Encontrar pares de animales que enten bajo el mismo cuidador.

SELECT a1.nombre AS animal_1, 
a2.nombre AS animal_2, 
a1.idcuidador as cuidador

FROM animales a1
JOIN animales a2 ON a1.idcuidador = a2.idcuidador
WHERE a1.id < a2.id;
