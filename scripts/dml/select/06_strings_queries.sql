-- Mostrar el nombre cientifico de las familias
-- en mayuscula sostenida, y el nombre comun.

SELECT 
    UPPER(f.nombrecientifico) AS nombre_cientifico_mayuscula,
    f.nombrecomun 
FROM familia f;

-- Mostrar los codigos del estado de conservacion 
-- en minuscula.

SELECT 
    LOWER(ec.codigo) AS codigo_minuscula
FROM estado_conservacion ec;

-- Mostrar el nombre de los 5 primeros animales ordenados 
-- alfabeticamente, junto con la frase lo cuida, 
-- y el nombre de su cuidador.

SELECT A.NOMBRE AS ANIMAL,
       CONCAT(A.nombre, ' lo cuida ', CU.nombre) AS FRASE
FROM ANIMALES A
INNER JOIN CUIDADOR CU ON A.IDCuidador = CU.ID
ORDER BY A.NOMBRE
LIMIT 5;

-- Mostrar el nombre del animal, con la longitud mas larga. 
-- Si la longitud se repite muchas veces, escoger 
-- el primero que arroje la consulta.

SELECT NOMBRE AS ANIMAL,
       LENGTH(NOMBRE) AS LONGITUD_NOMBRE
FROM ANIMALES
WHERE LENGTH(NOMBRE) = (SELECT MAX(LENGTH(NOMBRE)) FROM ANIMALES)
LIMIT 1;

-- Extraer la inicial del primer nombre concatenado 
-- con un punto y el apellido del cuidador.

SELECT 
    CONCAT(SUBSTRING(nombre FROM 1 FOR 1), '. ', SPLIT_PART(nombre, ' ', 2)) AS nombre_formato
FROM CUIDADOR;

SELECT DISTINCT NOMBRE AS NOMBRE_COMPLETO,
       CONCAT(SUBSTRING(NOMBRE, 1, 1)
       , '. ',SPLIT_PART(nombre, ' ', 2)) AS NOMBRE_FORMATEADO
FROM CUIDADOR;