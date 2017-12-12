CREATE DATABASE empresa;
USE empresa;
CREATE TABLE empleados(
nombre varchar(100) NOT NULL,
codigo INT(3) NOT NULL PRIMARY KEY AUTO_INCREMENT
);
CREATE TABLE idiomas(
nombre varchar(30) NOT NULL,
codigo varchar(12) NOT NULL PRIMARY KEY
);
CREATE TABLE habilidadesTecnicas(
nombre varchar(30) NOT NULL,
codigo varchar(12) NOT NULL PRIMARY KEY
);
CREATE TABLE conoceHabilidadTecnica(
codigo_persona INT(3) NOT NULL,
codigo_habilidadTecnica varchar(12) NOT NULL,
nivel DECIMAL(1) NOT NULL,
PRIMARY KEY(codigo_persona, codigo_habilidadTecnica)
);
CREATE TABLE hablaIdioma(
codigo_persona INT(3) NOT NULL,
codigo_idioma varchar(12) NOT NULL,
nivel DECIMAL(1) NOT NULL,
PRIMARY KEY(codigo_persona, codigo_idioma)
);

INSERT INTO empleados VALUES
('Aurora', NULL),
('Adrian', NULL),
('Enrique', NULL),
('Gala', NULL);
INSERT INTO habilidadesTecnicas VALUES
('PHP', 'PHP'),
('Javascript', 'JSC'),
('Diseno Grafico', 'GRD'),
('Montaje de equipos', 'EQS'),
('Electronica', 'ELC'),
('Atención al cliente', 'CSP');
INSERT INTO idiomas VALUES
('Ingles', 'ENG'),
('Frances', 'FRE');
INSERT INTO conoceHabilidadTecnica VALUES
(1, 'PHP',5),
(1, 'JSC',4),
(1, 'GRD',5),
(2, 'PHP',4),
(2, 'JSC',4),
(2, 'EQS',5),
(3, 'ELC',5),
(4, 'CSP',5);
INSERT INTO hablaIdioma VALUES
(1, 'ENG',3),
(2, 'ENG',2),
(3, 'ENG',2),
(4, 'ENG',5),
(4, 'FRE',5);

SELECT empleados.nombre
FROM empleados, hablaIdioma
WHERE hablaIdioma.codigo_idioma='FRE'
AND empleados.codigo=hablaIdioma.codigo_persona;

SELECT empleados.nombre, conoceHabilidadTecnica.nivel
FROM empleados, conoceHabilidadTecnica
WHERE conoceHabilidadTecnica.codigo_habilidadTecnica='GRD'
AND empleados.codigo=conoceHabilidadTecnica.codigo_persona
ORDER BY conoceHabilidadTecnica.nivel DESC;

SELECT empleados.nombre, habilidadesTecnicas.nombre, conoceHabilidadTecnica.nivel
FROM empleados, habilidadesTecnicas, conoceHabilidadTecnica
WHERE conoceHabilidadTecnica.codigo_persona=2
AND conoceHabilidadTecnica.codigo_persona=empleados.codigo
AND conoceHabilidadTecnica.codigo_habilidadTecnica=habilidadesTecnicas.codigo
ORDER BY conoceHabilidadTecnica.nivel DESC;

SELECT empleados.nombre, hablaIdioma.nivel AS 'Nivel Ingles', conoceHabilidadTecnica.nivel AS 'Nivel PHP'
FROM empleados, hablaIdioma, conoceHabilidadTecnica
WHERE conoceHabilidadTecnica.codigo_habilidadTecnica='PHP'
AND hablaIdioma.codigo_idioma='ENG'
AND empleados.codigo=conoceHabilidadTecnica.codigo_persona
AND empleados.codigo=hablaIdioma.codigo_persona
ORDER BY hablaIdioma.nivel DESC, conoceHabilidadTecnica.nivel DESC
