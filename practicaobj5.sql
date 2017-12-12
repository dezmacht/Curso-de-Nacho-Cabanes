CREATE DATABASE ejercicio5;
USE ejercicio5;
CREATE TABLE revista(
codigo VARCHAR(8) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
anio INT(4),
mes INT(2)
);
CREATE TABLE articulo(
codigo VARCHAR(12) NOT NULL PRIMARY KEY,
titulo VARCHAR(50) NOT NULL,
revista_id VARCHAR(8),
pag_inicial INT(4) NOT NULL,
pag_final INT(4) NOT NULL
);
INSERT INTO revista VALUES
('BY009', 'Byte 9', 1984,10),
('PCWE195', 'PcWorld Espana', 2003,2);
INSERT INTO articulo VALUES
('AT', 'The IBM PC AT', 'BY009',108,111),
('DbTypes', 'Database Types', 'BY009',138,142),
('DistLinux', '12 Distribuciones Linux', 'PCWE195',96,109);

SELECT revista.nombre, revista.mes, revista.anio, articulo.titulo, articulo.pag_inicial
FROM revista, articulo
WHERE revista.codigo=articulo.revista_id
ORDER BY articulo.titulo;
UPDATE articulo SET pag_inicial=137 WHERE pag_inicial=138;
UPDATE articulo SET titulo='12 Distribuciones GNU/Linux'
WHERE titulo='12 Distribuciones Linux';

ALTER TABLE revista ADD pais_edicion VARCHAR(30);
ALTER TABLE articulo ADD autor VARCHAR(60) AFTER revista_id;
