c/ marlen

DROP DATABASE biblioteca;
CREATE DATABASE biblioteca;

\c biblioteca
----AQUI COMIENZA LA PARTE 2 DE LA EVALUACION
--1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas definidas y sus atributos. (2 puntos).

--Crearemos la Entidad con sus atributos estas entidades son: Socio y Libro
CREATE TABLE socios(
    rut VARCHAR(40),
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    PRIMARY KEY (rut)
);


CREATE TABLE libros(
    isbn VARCHAR(80),
    titulo VARCHAR(60),
    pagina INT,
    PRIMARY KEY (isbn)
);


--Paso a crear la relacion(rombo) Esta se llama 'prestamo'que existira entre las entidades  Socio y Libro
CREATE TABLE prestamos(
    socio_id VARCHAR(40),
    libro_id VARCHAR(80),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (socio_id) REFERENCES socios(rut),
    FOREIGN KEY (libro_id) REFERENCES libros(isbn)
);

--La tabla Libros la dividi dividi en 2 tablas la cual ya hice arriba 'libros' solo con datos de libros, ahora creare de esa misma tabla la detabla o Entida de Autor
CREATE TABLE autores(
    codigo_autor INT,
    nombre_autor VARCHAR(40),
    apellido_autor VARCHAR(40),
    fecha_nacimiento DATE NOT NULL,
    fecha_muerte DATE,
    tipo_autor VARCHAR(20),
    PRIMARY KEY (codigo_autor)
);


--Paso a crear la relacion(rombo) que conecta a las entidades LIBROS CON AUTORES Esta se llamara ESCRITOR LIBROS
CREATE TABLE libros_autores(
    libro_id VARCHAR(80),
    codigo_autor INT,
    nombre_autor VARCHAR(40),
    FOREIGN KEY (libro_id) REFERENCES libros(isbn),
    FOREIGN KEY (codigo_autor) REFERENCES autores(codigo)    
);
--SELECT * FROM libros_autores;

--2. Se deben insertar los registros en las tablas correspondientes (1 punto).
--Empezare con la tabla 'SOCIOS' de acuerdo al orden de la creacion de las entidades sus atributos y su relacion.
INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '91111111');

INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('2222222-2', 'ANA', 'PEREZ', 'PASAJE2, SANTIAGO', '922222222');

INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');

INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444');

INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3, SANTIAGO', '955555555');
--SELECT * FROM socios;

--ENTIDAD LIBROS
INSERT INTO libros (isbn, titulo, paginas)
VALUES ('111-1111111-111', 'CUENTOS DE TERROR', '344');

INSERT INTO libros (isbn, titulo, paginas)
VALUES ('222-2222222-222', 'POESÍAS CONTEMPORANEAS', '167');

INSERT INTO libros (isbn, titulo, paginas)
VALUES ('333-3333333-333', 'HISTORIA DE ASIA','511');

INSERT INTO libros (isbn, titulo, paginas)
VALUES ('444-4444444-444', 'MANUAL DE MECANICA', '298');
--SELECT * FROM libros;

--ROMBO RELACION 'TABLA PRESTAMO'
INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('1111111-1', '111-1111111-111', '20-01-2020', '27-01-2020');

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('5555555-5', '222-2222222-222', '20-01-2020', '30-01-2020');

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('3333333-3', '333-3333333-333', '22-01-2020', '30-01-2020');

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('4444444-4', '444-4444444-444', '23-01-2020', '30-01-2020');

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('2222222-2', '111-1111111-111','27-01-2020', '04-02-2020');

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('1111111-1', '444-4444444-444', '31-01-2020', '12-02-2020');

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion)
VALUES ('3333333-3', '222-2222222-222','31-01-2020', '12-02-2020');
--SELECT * FROM prestamos;

--Procedere a crear la Tabla o Entidad 'AUTORES'
INSERT INTO autores (codigo, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor)
VALUES ('3', 'JOSE', 'SALGADO', '1968-01-01', '2020-01-01', 'PRINCIPAL');

INSERT INTO autores (codigo, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor)
VALUES ('4', 'ANA', 'SALGADO', '1972-01-01', '0', 'COAUTOR');

INSERT INTO autores (codigo, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor)
VALUES ('1', 'ANDRES', 'ULLOA', '1982-01-01', '0', 'PRINCIPAL');

INSERT INTO autores (codigo, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor)
VALUES ('2', 'SERGIO', 'MARDONES', '1950-01-01', '2012-01-01', 'PRINCIPAL');

INSERT INTO autores (codigo, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor)
VALUES ('5', 'MARTIN', 'PORTA', '1976-01-01', '0', 'PRINCIPAL');

SELECT * FROM autores;

--3. Realizar las siguientes consultas:
--a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)
SELECT * FROM libros WHERE paginas < 300;
--b. Mostrar todos los autores que hayan nacido después del 01-01-1970. (0.5 puntos)
SELECT * FROM autores WHERE fecha_nacimiento < '1970-01-01';
--c. ¿Cuál es el libro más solicitado? (0.5 puntos).
--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
--debería pagar cada usuario que entregue el préstamo después de 7 días. (0.5 puntos)
