-- 1. Mostrar todos los animales que viven en el habitat Santuario de aves tropicales

SELECT a.Nombre 
FROM animales a
JOIN habitat h ON a.IDHabitat = h.ID
WHERE h.Nombre = 'Santuario de aves tropicales';

-- 2. Mostrar el nombre del cuidador, con el alias cuidador, ordenados alfabeticamente.

SELECT DISTINCT c.Nombre AS cuidador
FROM cuidador c
ORDER BY c.Nombre;

-- 3. Mostrar el nombre y el ID de la especie, de los animales que viven en
--  Reserva de fauna

SELECT e.Nombre, e.ID
FROM animales a
JOIN especie e ON a.IDEspecie = e.ID
JOIN habitat h ON a.IDHabitat = h.ID
WHERE h.Nombre = 'Reserva de fauna';


