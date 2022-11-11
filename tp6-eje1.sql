DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
CREATE TABLE paises (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_pais VARCHAR (100)
);
CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_prov VARCHAR (100),
idpais INT UNSIGNED,
FOREIGN KEY (idpais) REFERENCES paises(id)
);
CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_loc VARCHAR (100),
cp INT UNSIGNED,
idprov INT UNSIGNED,
FOREIGN KEY (idprov) REFERENCES provincias(id)
);
ALTER TABLE empleados
add direccion varchar (45),
add  id_localidad int unsigned,
add  email varchar (100),
add telefono int unsigned, 
add fecha_ingreso date, 
add tms timestamp,
add foreign key (id_localidad) references localidades(id);
alter table departamentos
add gastos double,
add tms timestamp;
INSERT INTO paises VALUES(1,'Argentina');
INSERT INTO paises VALUES(2,'Brasil');
INSERT INTO paises VALUES(3,'Portugal');
INSERT INTO paises VALUES(4,'España');
INSERT INTO paises VALUES(5,'México');

INSERT INTO provincias VALUES(1,'Misiones',1);
INSERT INTO provincias VALUES(2,'Corrientes',1);
INSERT INTO provincias VALUES(3,'Barcelona',4);
INSERT INTO provincias VALUES(4,'Madrid',4);
INSERT INTO provincias VALUES(5,'Puebla',5);

INSERT INTO localidades VALUES(1,'Posadas',3300,1);
INSERT INTO localidades VALUES(2,'Virasoro',2985,2);
INSERT INTO localidades VALUES(3,'Andresito',3366,1);
INSERT INTO localidades VALUES(4,'Azul',1500,null);
INSERT INTO localidades VALUES(5,'Río',null,null );

INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true, 5000, '2021-03-12');
INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true, 3500, '2022-09-24');
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true, 2950, '2020-05-25');
INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true, 3000,null);
INSERT INTO departamentos VALUES(5, 'I+D', 375000, true, null, null );

INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true, 'Libertad',2, 'aaronriv@email.com','3764324815','2018-12-10',null );
INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true, 'Saavedra',3, 'adelas@email.com','3757455658','2015-11-20','2016-05-15, 12:30:25');
INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true, 'San Martín',1, 'adolfr@email.com','3764252525','2018-06-01','2014-07-15,12:30:25');
INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez', 4, true, 'Bolívar',1, 'adrians@email.com','3764555555','2020-09-21','2020-08-20, 12:59:50');
INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true, null,5, 'Marcosl@email.com','3757555500','2021-01-01',null);

select * from empleados;
select * from departamentos;
select * from localidades;
select * from provincias;
select * from paises;
alter table pedidos rename movimientos;
select*from movimientos;
describe movimientos;
create table cajas (id int unsigned auto_increment primary key, horainicio time, horacierre time, estado boolean, 
tms timestamp
);
create table proveedores (id int unsigned auto_increment primary key, razon_social varchar (45), nombre varchar (45), apellido varchar (45), naturaleza varchar(45),
cuit VARCHAR(15) NOT NULL UNIQUE, id_localidad int unsigned, estado boolean ,tms timestamp,
FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);
create table marcas (id int unsigned auto_increment primary key, nombre varchar (45), descripción text , imagen text , id_proveedor int unsigned, estado boolean not null,
 tms timestamp,
 foreign key (id_proveedor) references proveedores(id)
 );
create table productos (id int unsigned auto_increment primary key, 
nombre varchar (45), descripcion text , id_marca int unsigned, stock int unsigned, precio float, estado boolean not null, tms timestamp,
FOREIGN KEY (id_marca) REFERENCES marcas(id)
);
insert into cajas values (1, '08:00:00','20:00:00',true, '2018-03-19');
insert into cajas values (2, '08:00:00','20:00:00',true, '2018-03-19');
insert into cajas values (3, '08:00:00','20:00:00',true, '2019-01-20');
insert into cajas values (4, '08:00:00','20:00:00',true, '2020-03-22');
insert into cajas values (5, '08:00:00','20:00:00',true, '2022-02-21');

insert into proveedores values (1, "comercial posadas", "ELbio", "Romero", "jurídica", '20-17087203-3',1, true, '2021-03-24');
insert into proveedores values (2, "diarco", "Carlos", "Alvarez", "jurídica", '30-17258987-2',2, true, '2022-10-11');
insert into proveedores values (3, "Disco", "Maria", "Radaelli", "física", '24-358987568-7',3, true, '2021-05-02');
insert into proveedores values (4, "Grido", "Juan", "Perez", "física", '33-225300789-5',1, true, '2020-05-08');
insert into proveedores values (5, "Musimundo", "Juana", "Pellegrini", "física", '21-45632528-8',1, true, '2018-10-14');

insert into marcas values (1, "marolio", "la económica", "una letra M jpg", 1, true, "2020-03-05");
insert into marcas values (2, "Grido", "helados de calidad", "imagen2.jpg", 4, true, "2021-12-12");
insert into marcas values (3, "samsung", "excelencia en tecnología", "imagen3.jpg",2 , true, "2010-08-17");
insert into marcas values (4, "Nokia", "eternos", "celular.jpg",5 , true, "2022-10-30");
insert into marcas values (5, "Arcor", "Alimento saludable", "imagen5.jpg",1 , true, "2020-04-18");

insert into productos values (1, "arroz", "seleccionado", 1, 150, 230, true, "2020-10-02");
insert into productos values (2, "azúcar", "alta calidad", 1, 120, 125, true, "2020-09-12");
insert into productos values (3, "Heladera", "400 litros", 3, 13, 300000, true, "2021-11-12");
insert into productos values (4, "celular", "N90", 4, 120, 125000, true, "2022-04-15");
insert into productos values (5, "postre helado", "postre helado tres cremas", 5, 100, 115, true, "2022-11-11");


select nombre, presupuesto, gastos, (presupuesto - gastos) as diferencia from departamentos
where estado = 1;

select nombre_loc, nombre_pais from localidades left join provincias on localidades.idprov = provincias.id inner join paises
on provincias.idpais = paises.id group by nombre_loc, nombre_pais;

update empleados set telefono = '3764888888' where idemplaedo = 1;
update empleados set fecha_ingreso = '2016-12-21', id_localidad ='3' where idemplaedo = 2;

INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
-- Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,
-- tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
-- 13. Insertar 5 movimientos distintos.

alter table movimientos 
add id_producto INT UNSIGNED not null,
add estado boolean not null,
add tms timestamp,
add tipo_movimiento varchar (45),
add FOREIGN KEY (id_producto) REFERENCES productos(id);
INSERT INTO movimientos VALUES(1, 150.5, '2020-10-05', 1, 2, 1, true, '2020-07-01', 'egreso');
INSERT INTO movimientos VALUES(2, 270.65, '2019-09-10', 1, 5, 1, true, '2020-07-01', 'ingreso');
INSERT INTO movimientos VALUES(3, 65.26, '2022-10-05', 1, 1, 1, true, '2020-07-01', 'pedido');
INSERT INTO movimientos VALUES(4, 110.5, '2021-08-17', 1, 3, 1, true, '2020-07-01', 'egreso');
INSERT INTO movimientos VALUES(5, 948.5, '2021-09-10', 1, 2, 1, true, '2020-07-01', 'egreso');

insert into clientes values(1, 'Jose', 'Lopez','25-325654789-2', 1, null);

-- Borrar lógicamente (UPDATE de la columna estado):
-- 2 movimientos que fueron cargados mal
update movimientos set estado = false where id = 2;
update movimientos set estado = false where id = 3;

-- un pais que tenga al menos 3 localidades
select * from paises inner join provincias inner join localidades on paises.id = provincias.idpais and provincias.id = localidades.idprov;
-- update paises inner join provincias inner join localidades on paises.id = provincias.idpais and provincias.id = localidades.idprov
-- set nombre_pais = '' where count(nombre_pais)>= 3; -- con esta consulta no me saleeee...

-- delete nombre_pais from paises inner join provincias inner join localidades on paises.id = provincias.idpais and provincias.id = localidades.idprov
 -- where count(nombre_pais)>= 3;

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
-- de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. 
-- Es decir deben haber 5 updates de la tabla producto.
update productos inner join movimientos on productos.id = movimientos.id set stock = (productos.stock - movimientos.cantidad)
where productos.id = 1;
update productos inner join movimientos on productos.id = movimientos.id set stock = (productos.stock + movimientos.cantidad)
where productos.id = 2;
update productos inner join movimientos on productos.id = movimientos.id set stock = productos.stock
where productos.id = 3;
update productos inner join movimientos on productos.id = movimientos.id set stock = (productos.stock - movimientos.cantidad)
where productos.id = 4;
update movimientos set cantidad = 50 where id= 5;
update productos inner join movimientos on productos.id = movimientos.id set stock = (productos.stock - movimientos.cantidad)
where productos.id = 5;
select * from productos inner join movimientos on productos.id = movimientos.id;
describe movimientos;


-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
drop table parametros;
create table parametros  (
id int unsigned auto_increment primary key,
tms timestamp,
cosas json,
id_usuario int unsigned
);
insert into parametros values (1, '2021-09-05', '{"idDeLaCosa": 101, "permisos": "PUT, GET"}', 2);
insert into parametros values (2, '2022-03-05','{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}', 3);
insert into parametros values (3,'2021-09-05', '{"zonaHoraria": "America/Argentina/BuenosAires"}', 2);
insert into parametros values (4,'2021-09-05', '{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}', 2);
insert into parametros values (5, '2021-09-05', '{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
"31634912,57","egreso": "9757142,66"}}}', 2);
