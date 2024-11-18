-- Calcular el promedio de edad de los animales en cada hábitat y mostrar solo los habitats donde el promedio de edad supera los 5 años.

SELECT H.nombre AS habitat,
 ROUND(AVG(EXTRACT(YEAR FROM AGE(A.FechaNac))),2) AS EDAD_PROMEDIO_ANIMALES
 FROM Animales A  
 JOIN habitat H ON A.idhabitat = H.id
 GROUP BY H.nombre
 HAVING AVG(EXTRACT(YEAR FROM AGE(A.FechaNac))) > 5;

-- Contar el número de visitas por cada hábitat y mostrar solo aquellos hábitats que han recibido más de 50 visitas en total 
SELECT H.nombre AS habitat,
    COUNT(HV.id) AS total_visitantes
FROM habitat H
INNER JOIN habitat_visitantes HV ON H.id = HV.idhabitat
GROUP BY H.nombre
HAVING COUNT(HV.id) > 50  


--Calcular el salario promedio de los cuidadores por fecha de contratación
--(año) y mostrar solo los años donde el salario promedio es mayor a $3,200,000.
SELECT 
    EXTRACT(YEAR FROM fechacontratacion) AS Año, 
    AVG(salario) AS SalarioPromedio
FROM 
    Cuidador
GROUP BY 
    Año
HAVING 
    AVG(salario) > 3200000.00;

--Contar el número de especies bajo cada estado de conservación y 
--mostrar solo aquellos estados de conservación con más de 10 especies.
SELECT 
    ec.Nombre AS EstadoConservacion, 
    COUNT(e.ID) AS NumeroEspecies
FROM 
    ESPECIE e
JOIN 
    ESTADO_CONSERVACION ec ON e.IDEstadoConservacion = ec.ID
GROUP BY 
    ec.Nombre
HAVING 
    COUNT(e.ID) > 10;

--Calcular el promedio de antigüedad de los cuidadores por habitat y mostrar solo los 
--habitats con un promedio de antiguedad de cuidadores superior a 3 años.
SELECT 
    h.Nombre AS Habitat, 
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.FechaContratacion))) AS PromedioAntiguedad
FROM 
    CUIDADOR c
JOIN 
    ESPECIALIDAD e ON c.IDEspecialidad = e.ID
JOIN 
    HABITAT h ON h.ID = e.ID 
GROUP BY 
    h.Nombre
HAVING 
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, c.FechaContratacion))) > 3;