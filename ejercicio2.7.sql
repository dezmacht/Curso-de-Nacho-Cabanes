CREATE DATABASE ejercicio2;
USE ejercicio2;
CREATE TABLE marcas(
codigo VARCHAR(3) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
pais_origen VARCHAR(30)
);

CREATE TABLE modelos(
codigo_marca VARCHAR(3),
nombre VARCHAR(30) NOT NULL,
segmento VARCHAR(30)
);

INSERT INTO marcas VALUES('F','Ferrari','Italia'),('SAL','Saleen','Estados Unidos');

INSERT INTO modelos VALUES('SAL', 'S7', 'deportivo'),('F', 'F40', 'deportivo');

SELECT marcas.nombre AS 'Marca', modelos.nombre AS 'Modelo'
FROM marcas, modelos
WHERE segmento="deportivo"
AND modelos.codigo_marca=marcas.codigo;

SELECT marcas.nombre AS 'Marca',marcas.pais_origen AS 'Pais', modelos.nombre AS 'Modelo'
FROM marcas, modelos
WHERE marcas.nombre LIKE '%F'
AND modelos.codigo_marca=marcas.codigo;

SELECT marcas.nombre AS 'Marca',marcas.pais_origen AS 'Pais', modelos.segmento AS 'Segmento'
FROM marcas, modelos
WHERE modelos.nombre LIKE '%S%'
AND modelos.codigo_marca=marcas.codigo;

SELECT * FROM modelos ORDER BY segmento;

