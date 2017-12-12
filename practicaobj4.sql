CREATE DATABASE ejercicio4;
USE ejercicio4;
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

SELECT articulo.titulo, revista.anio FROM articulo,revista
WHERE articulo.revista_id=revista.codigo
ORDER BY revista.anio, revista.mes, articulo.titulo;

SELECT titulo AS 'Articulos de Byte 9' FROM articulo
WHERE titulo LIKE '%Pc%'
AND revista_id='BY009'
ORDER BY titulo;

CREATE TABLE CopiaDeArticulo(
codigo VARCHAR(12) NOT NULL PRIMARY KEY,
titulo VARCHAR(50) NOT NULL,
revista_id VARCHAR(8),
pag_inicial INT(4) NOT NULL,
pag_final INT(4) NOT NULL
);

INSERT INTO CopiaDeArticulo (SELECT * FROM articulo);

DELETE FROM CopiaDeArticulo WHERE pag_inicial>120;
SELECT titulo, pag_inicial FROM CopiaDeArticulo;

DELETE FROM CopiaDeArticulo WHERE revista_id='BY009';
SELECT titulo, revista.nombre FROM CopiaDeArticulo, revista
WHERE CopiaDeArticulo.revista_id=revista.codigo; 
 
DROP TABLE IF EXISTS CopiaDeArticulo;
