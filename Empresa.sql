DROP DATABASE IF EXISTS Emprea;
CREATE DATABASE Empresa CHARSET utf8mb4;
USE Empresa;

CREATE TABLE Departamentos (
Codigo_Departamento INT PRIMARY KEY,
Cantidad_Empleados INT NOT NULL
);

CREATE TABLE Empleados (
NIF VARCHAR(9) PRIMARY KEY,
Nombre VARCHAR(35) NOT NULL,
Apellido1 VARCHAR(50) NOT NULL,
Apellido2 VARCHAR(50),
Tiempo_Empresa DATE,
NIF_Jefe VARCHAR(9),
Departamento_Empleado INT NOT NULL,
FOREIGN KEY (NIF_Jefe) REFERENCES Empleados (NIF),
FOREIGN KEY (Departamento_Empleado) REFERENCES Departamentos (Codigo_Departamento)
);

CREATE TABLE Despachos (
Codigo INT PRIMARY KEY,
Zona VARCHAR(20) NOT NULL
);

CREATE TABLE Supervisores (
Codigo INT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Especialidad VARCHAR(40) NOT NULL,
Codigo_Despacho INT NOT NULL,
FOREIGN KEY (Codigo_Despacho) REFERENCES Despachos (Codigo)
);

CREATE TABLE Visitas (
Visita_Departamento INT NOT NULL,
Visita_Supervisor INT NOT NULL,
Fecha_Visita DATE NOT NULL,
Hora_Visita TIME,
PRIMARY KEY (Visita_Departamento, Visita_Supervisor, Fecha_Visita),
FOREIGN KEY (Visita_Departamento) REFERENCES Departamentos (Codigo_Departamento),
FOREIGN KEY (Visita_Supervisor) REFERENCES Supervisores (Codigo)
);

insert into Departamentos values (1, 5);
insert into Departamentos values (2, 6);
insert into Departamentos values (3, 4);
insert into Departamentos values (4, 3);

insert into Empleados values ('77777777B', 'Laura', 'Lopez', 'Gutierrez', '2014-11-15', NULL, 1);
insert into Empleados values ('11111111A', 'Pedro', 'Sevilla', 'Alcantara', '2012-06-01','77777777B', 1);
insert into Empleados values ('75125632L', 'Salvador', 'Esteban', 'Pereira', 'NULL', '77777777B', 1);
insert into Empleados values ('95647546E', 'Tamara', 'Castillo', 'Revilla', '2015-06-01', '77777777B', 1);
insert into Empleados values ('32598544T', 'Alicia Maria', 'Rueda', 'Galatea', NULL, '77777777B', 1);
insert into Empleados values ('88888888Y', 'Alejandro', 'Garcia', NULL, '2015-02-11', NULL, 2);
insert into Empleados values ('22222222B', 'Alberta', 'Sanchez', NULL, '2011-05-05','88888888Y', 2);
insert into Empleados values ('66645800B', 'Ignacio', 'Valero', 'Bravo', NULL, '88888888Y', 2);
insert into Empleados values ('33666578Y', 'Jose Maria', 'Castro', 'Bilbao', NULL, '88888888Y', 2);
insert into Empleados values ('88000697Y', 'Encarnacion', 'Gutierrez', 'Hernandez', '2010-03-15', '88888888Y', 2);
insert into Empleados values ('12305000T', 'Maria Isabel', 'Llorente', 'Martinez', NULL, '88888888Y', 2);
insert into Empleados values ('90000444H', 'Judith', 'Watson', NULL, NULL, '88888888Y', 2);
insert into Empleados values ('77151003X', 'Juan Benito', 'Carrera', 'Sanchez', 'NULL', NULL, 3);
insert into Empleados values ('10003124X', 'Ingrid', 'Martinez', 'Hernandez', '2013-07-29', '77151003X', 3);
insert into Empleados values ('41113267P', 'Pablo Antonio', 'Alcaraz', 'Tortosa', NULL, '77151003X', 3);
insert into Empleados values ('20100908N', 'Francisco', 'Moya', 'Luque', NULL, '77151003X', 3);
insert into Empleados values ('69875641Y', 'Emilio', 'Martinez', 'Ros', '2017-04-11', NULL, 4);
insert into Empleados values ('55477020P', 'Cristina', 'Gallego', 'Esteban', NULL, '69875641Y', 4);
insert into Empleados values ('32343536Q', 'Carmen', 'Saavedra', 'Safta', '2012-11-23', '69875641Y', 4);