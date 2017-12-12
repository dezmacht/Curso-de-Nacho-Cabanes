CREATE DATABASE ejercicio11;
USE ejercicio11;

CREATE TABLE deporte(
codigo VARCHAR(3) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE deportista(
codigo VARCHAR(3) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
pais_codigo VARCHAR(3)
);

CREATE TABLE practicar(
deportista_codigo VARCHAR(3),
deporte_codigo VARCHAR(3),
PRIMARY KEY(deporte_codigo, deportista_codigo)
);

CREATE TABLE pais(
codigo VARCHAR(3) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

INSERT INTO pais VALUES
('JAM', 'Jamaica'),
('ESP', 'Espania'),
('USA', 'Estados Unidos'),
('AUS', 'Australia'),
('RUS', 'Rusia');

INSERT INTO deportista VALUES
('BOL', 'Usain', 'Bolt', 'JAM'),
('POW', 'Asafa', 'Powell', 'JAM'),
('CRA', 'Saul', 'Craviotto', 'ESP'),
('TAU', 'Diana', 'Taurasi', 'USA'),
('PHE', 'Michael', 'Phelps', 'USA');

INSERT INTO deporte VALUES
('ATL', 'Atletismo'),
('REM', 'Remo'),
('BAL', 'Baloncesto'),
('NAT', 'Natacion'),
('BAD', 'Badminton');

INSERT INTO practicar VALUES
('BOL', 'VEL'),
('CRA', 'REM'),
('TAU', 'BAL'),
('PHE', 'NAT');

SELECT deportista.nombre, deportista.apellidos, pais.nombre AS 'Pais de origen'
FROM deportista LEFT JOIN pais
ON deportista.pais_codigo=pais.codigo;

SELECT pais.nombre as 'Pais', deportista.apellidos FROM pais
LEFT JOIN deportista ON pais.codigo=deportista.pais_codigo;

SELECT deportista.nombre, deportista.apellidos, deporte.nombre
FROM deporte, deportista, practicar
WHERE deporte.codigo=practicar.deporte_codigo
AND deportista.codigo=practicar.deportista_codigo;

SELECT * FROM
(
SELECT CONCAT(deportista.apellidos, ' ', deportista.nombre) AS nombre,
deporte.nombre disciplina
FROM practicar
LEFT OUTER JOIN deporte ON deporte.codigo=practicar.deporte_codigo
LEFT OUTER JOIN deportista ON deportista.codigo=practicar.deportista_codigo
union
SELECT CONCAT(deportista.apellidos, ' ', deportista.nombre),
deporte.nombre
FROM practicar
RIGHT OUTER JOIN deporte ON deporte.codigo=practicar.deporte_codigo
RIGHT OUTER JOIN deportista ON deportista.codigo=practicar.deportista_codigo
) deportistas
ORDER BY nombre;
