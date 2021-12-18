\c pokemones

-- Creando Base de Datos
DROP DATABASE biblioteca;

CREATE DATABASE biblioteca;

-- Conectando a base de datos

\c biblioteca

-- Creando Tablas

    -- Tabla Comunas
    CREATE TABLE comunas(
        id_comuna INT,
        comuna VARCHAR (30),
        PRIMARY KEY (id_comuna)
    );

    -- Tabla Socios
    CREATE TABLE socios (
        rut VARCHAR (9),
        nombre VARCHAR(30),
        apellido VARCHAR(30),
        telefono VARCHAR(9) UNIQUE,
        direccion VARCHAR(255) UNIQUE,
        id_comuna INT,
        PRIMARY KEY (rut),
        FOREIGN KEY (id_comuna) REFERENCES comunas(id_comuna)
    );

    -- Tabla Libros
    CREATE TABLE libros(
        isbn VARCHAR(15) UNIQUE,
        titulo VARCHAR(255),
        numero_de_paginas INT,
        PRIMARY KEY (isbn)
    );

    -- Tabla tipo de autor
    CREATE TABLE tipo_de_autor (
        id_tipo_de_autor INT,
        tipo_de_autor VARCHAR(30),
        PRIMARY KEY (id_tipo_de_autor)
    );

    -- Tabla autores
    CREATE TABLE autores(
        id_autor INT,
        nombre_autor VARCHAR(30),
        apellido_autor VARCHAR(30),
        ano_nacimiento INT,
        ano_defuncion INT,
        PRIMARY KEY (id_autor)
    );

    -- Tabla autor_inter
    CREATE TABLE autor_inter(
        autor_inter_id INT,
        isbn_libro VARCHAR(15),
        id_autor INT,
        id_tipo_de_autor INT,
        PRIMARY KEY (autor_inter_id),
        FOREIGN KEY (isbn_libro) REFERENCES libros(isbn),
        FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
        FOREIGN KEY (id_tipo_de_autor) REFERENCES tipo_de_autor(id_tipo_de_autor)
    );

    -- Tabla prestamos
    CREATE TABLE prestamos(
        id_prestamo INT,
        rut_socio VARCHAR(9),
        isbn_libro VARCHAR(15),
        fecha_prestamo DATE,
        fecha_devolucion DATE,
        fecha_real_de_devolucion DATE,
        PRIMARY KEY (id_prestamo),
        FOREIGN KEY (rut_socio) REFERENCES socios(rut),
        FOREIGN KEY (isbn_libro) REFERENCES libros(isbn)
    );

-- Insertando datos en tablas

    -- tabla comunas
    INSERT INTO comunas (id_comuna, comuna) VALUES (1, 'SANTIAGO');

    -- tabla socios
    INSERT INTO socios (rut, nombre, apellido, telefono, direccion, id_comuna) VALUES ('1111111-1', 'JUAN', 'SOTO', '911111111', 'AVENIDA 1', 1);
    INSERT INTO socios (rut, nombre, apellido, telefono, direccion, id_comuna) VALUES ('2222222-2', 'ANA', 'PEREZ', '922222222', 'PASAJE 2', 1);
    INSERT INTO socios (rut, nombre, apellido, telefono, direccion, id_comuna) VALUES ('3333333-3', 'SANDRA', 'AGUILAR', '933333333', 'AVENIDA 2', 1);
    INSERT INTO socios (rut, nombre, apellido, telefono, direccion, id_comuna) VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', '944444444', 'AVENIDA 3', 1);
    INSERT INTO socios (rut, nombre, apellido, telefono, direccion, id_comuna) VALUES ('5555555-5', 'SILVANA', 'MUÑOZ', '955555555', 'PASAJE 3', 1);

    -- Tabla libros
    INSERT INTO libros(isbn, titulo, numero_de_paginas) VALUES ('111-1111111-111', 'CUENTOS DE TERROR', 344);
    INSERT INTO libros(isbn, titulo, numero_de_paginas) VALUES ('222-2222222-222', 'POESIAS CONTEMPORANEAS', 167);
    INSERT INTO libros(isbn, titulo, numero_de_paginas) VALUES ('333-3333333-333', 'HISTORIA DE ASIA', 511);
    INSERT INTO libros(isbn, titulo, numero_de_paginas) VALUES ('444-4444444-444', 'MANUAL DE MECANICA', 298);

    -- Tabla préstamos
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (1,'1111111-1', '111-1111111-111', '2020-01-20', '2020-01-27', '2020-01-27');
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (2,'5555555-5', '222-2222222-222', '2020-01-20', '2020-01-27', '2020-01-30');
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (3,'3333333-3', '333-3333333-333', '2020-01-22', '2020-01-29', '2020-01-30');
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (4,'4444444-4', '444-4444444-444', '2020-01-23', '2020-01-30', '2020-01-30');
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (5,'2222222-2', '111-1111111-111', '2020-01-27', '2020-02-03', '2020-02-04');
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (6,'1111111-1', '444-4444444-444', '2020-01-31', '2020-02-07', '2020-02-12');
    INSERT INTO prestamos(id_prestamo, rut_socio, isbn_libro, fecha_prestamo, fecha_devolucion, fecha_real_de_devolucion) VALUES (7,'3333333-3', '222-2222222-222', '2020-01-31', '2020-02-07', '2020-02-12');

    -- Tabla autores
    INSERT INTO autores(id_autor, nombre_autor, apellido_autor, ano_nacimiento) VALUES (1, 'ANDRES', 'ULLOA', 1982);
    INSERT INTO autores(id_autor, nombre_autor, apellido_autor, ano_nacimiento, ano_defuncion) VALUES (2, 'SERGIO', 'MARDONES', 1950, 2012);
    INSERT INTO autores(id_autor, nombre_autor, apellido_autor, ano_nacimiento, ano_defuncion) VALUES (3, 'JOSE', 'SALGADO', 1968, 2020);
    INSERT INTO autores(id_autor, nombre_autor, apellido_autor, ano_nacimiento) VALUES (4, 'ANA', 'SALGADO', 1972);
    INSERT INTO autores(id_autor, nombre_autor, apellido_autor, ano_nacimiento) VALUES (5, 'MARTIN', 'PORTA', 1976);

    -- Tabla tipo de autor
    INSERT INTO tipo_de_autor(id_tipo_de_autor, tipo_de_autor) VALUES (1, 'PRINCIPAL');
    INSERT INTO tipo_de_autor(id_tipo_de_autor, tipo_de_autor) VALUES (2, 'COAUTOR');

    -- Tabla autor_inter (tabla intermedia)
    INSERT INTO autor_inter(autor_inter_id, isbn_libro, id_autor, id_tipo_de_autor) VALUES (1, '222-2222222-222', 1, 1);
    INSERT INTO autor_inter(autor_inter_id, isbn_libro, id_autor, id_tipo_de_autor) VALUES (2, '333-3333333-333', 2, 1);
    INSERT INTO autor_inter(autor_inter_id, isbn_libro, id_autor, id_tipo_de_autor) VALUES (3, '111-1111111-111', 3, 1);
    INSERT INTO autor_inter(autor_inter_id, isbn_libro, id_autor, id_tipo_de_autor) VALUES (4, '111-1111111-111', 4, 2);
    INSERT INTO autor_inter(autor_inter_id, isbn_libro, id_autor, id_tipo_de_autor) VALUES (5, '111-1111111-111', 5, 1);

-- Consultas

    -- Mostrar todos los libros que posean menos de 300 páginas.
    SELECT * FROM libros
    WHERE libros.numero_de_paginas <= 300;


    -- Mostrar todos los autores que hayan nacido después del 01-01-1970
    SELECT * FROM autores
    WHERE autores.ano_nacimiento >= 1970;

    -- ¿Cuál es el libro más solicitado?
    SELECT libros.titulo, COUNT (libros.titulo) as Libros_Mas_Solicitados
    FROM prestamos INNER JOIN libros ON prestamos.isbn_libro = libros.isbn
    GROUP BY libros.titulo
    ORDER BY Libros_Mas_Solicitados;

    -- Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.
    SELECT socios.nombre, socios.apellido, socios.rut, SUM (fecha_real_de_devolucion - fecha_devolucion)*100 AS deuda_socios
    FROM prestamos INNER JOIN socios ON socios.rut = prestamos.rut_socio
    GROUP BY socios.rut
    ORDER BY deuda_socios;
