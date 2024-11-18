-- SUM Calcular salario total de todos los cuidadores en el zoologico.

SELECT SUM(salario)
 FROM cuidador 

-- AVG Obtener el salario promedio de los cuidadores agrupados por especialidad.

SELECT 
 E.id AS especialidad,
 E.nombre AS nombre,
 AVG(salario) AS salario_promedio
 FROM cuidador C JOIN especialidad E ON C.idespecialidad = E.id
 GROUP BY E.id,E.nombre;

-- COUNT Contar el número total de animales en cada hábitad.

 SELECT 
 H.nombre AS habitat,
 COUNT(A.id) AS Total_animales 
 FROM Animales A JOIN habitat H ON A.idhabitat = H.id
 GROUP BY H.nombre;

 -- MIN Y MAX Mostrar la fecha de contratación más antigua y la más reciente de los cuidadores.
 
 SELECT 
 Max(C.fechacontratacion) AS Fecha_más_reciente,
 Min(C.fechacontratacion) AS Fecha_más_antigua
 FROM cuidador C;