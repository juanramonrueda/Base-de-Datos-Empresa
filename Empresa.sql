DROP DATABASE IF EXISTS Empresa;
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
Nombre VARCHAR(50) NOT NULL,
Especialidad VARCHAR(70) NOT NULL,
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

INSERT INTO Departamentos VALUES (1, 5);
INSERT INTO Departamentos VALUES (2, 6);
INSERT INTO Departamentos VALUES (3, 4);
INSERT INTO Departamentos VALUES (4, 3);

INSERT INTO Empleados VALUES ('77777777B', 'Laura', 'Lopez', 'Gutierrez', '2014-11-15', NULL, 1);
INSERT INTO Empleados VALUES ('11111111A', 'Pedro', 'Sevilla', 'Alcantara', '2012-06-01','77777777B', 1);
INSERT INTO Empleados VALUES ('75125632L', 'Salvador', 'Esteban', 'Pereira', NULL, '77777777B', 1);
INSERT INTO Empleados VALUES ('95647546E', 'Tamara', 'Castillo', 'Revilla', '2015-06-01', '77777777B', 1);
INSERT INTO Empleados VALUES ('32598544T', 'Alicia Maria', 'Rueda', 'Galatea', NULL, '77777777B', 1);
INSERT INTO Empleados VALUES ('88888888Y', 'Alejandro', 'Garcia', NULL, '2015-02-11', NULL, 2);
INSERT INTO Empleados VALUES ('22222222B', 'Alberta', 'Sanchez', NULL, '2011-05-05','88888888Y', 2);
INSERT INTO Empleados VALUES ('66645800B', 'Ignacio', 'Valero', 'Bravo', NULL, '88888888Y', 2);
INSERT INTO Empleados VALUES ('33666578Y', 'Jose Maria', 'Castro', 'Bilbao', NULL, '88888888Y', 2);
INSERT INTO Empleados VALUES ('88000697Y', 'Encarnacion', 'Gutierrez', 'Hernandez', '2010-03-15', '88888888Y', 2);
INSERT INTO Empleados VALUES ('12305000T', 'Maria Isabel', 'Llorente', 'Martinez', NULL, '88888888Y', 2);
INSERT INTO Empleados VALUES ('90000444H', 'Judith', 'Watson', NULL, NULL, '88888888Y', 2);
INSERT INTO Empleados VALUES ('77151003X', 'Juan Benito', 'Carrera', 'Sanchez', NULL, NULL, 3);
INSERT INTO Empleados VALUES ('10003124X', 'Ingrid', 'Martinez', 'Hernandez', '2013-07-29', '77151003X', 3);
INSERT INTO Empleados VALUES ('41113267P', 'Pablo Antonio', 'Alcaraz', 'Tortosa', NULL, '77151003X', 3);
INSERT INTO Empleados VALUES ('20100908N', 'Francisco', 'Moya', 'Luque', NULL, '77151003X', 3);
INSERT INTO Empleados VALUES ('69875641Y', 'Emilio', 'Martinez', 'Ros', '2017-04-11', NULL, 4);
INSERT INTO Empleados VALUES ('55477020P', 'Cristina', 'Gallego', 'Esteban', NULL, '69875641Y', 4);
INSERT INTO Empleados VALUES ('32343536Q', 'Carmen', 'Saavedra', 'Safta', '2012-11-23', '69875641Y', 4);

INSERT INTO Despachos VALUES (1, 'Primera Planta');
INSERT INTO Despachos VALUES (2, 'Segunda Planta');
INSERT INTO Despachos VALUES (3, 'Tercera Planta');
INSERT INTO Despachos VALUES (4, 'Cuarta Planta');

INSERT INTO Supervisores VALUES (01, 'Adrian Ugarte', 'Desarrollador de Aplicaciones Multiplataforma', 4);
INSERT INTO Supervisores VALUES (02, 'Maria Isabel Rodriguez', 'Ingeniera de Datos', 3);
INSERT INTO Supervisores VALUES (03, 'Maria Belen Casado', 'Administradora de Sistemas', 2);
INSERT INTO Supervisores VALUES (04, 'Pedro Vazquez', 'Desarrollador de Aplicaciones Web', 1);

INSERT INTO Visitas VALUES (1, 4, '2014-03-28', '10:59:15');
INSERT INTO Visitas VALUES (1, 4, '2014-06-16', NULL);
INSERT INTO Visitas VALUES (2, 3, '2014-02-14', '09:15:20');
INSERT INTO Visitas VALUES (2, 3, '2014-07-01', '08:56:01');
INSERT INTO Visitas VALUES (2, 3, '2015-08-17', NULL);
INSERT INTO Visitas VALUES (3, 2, '2014-12-19', '12:40:07');
INSERT INTO Visitas VALUES (3, 2, '2015-02-26', NULL);
INSERT INTO Visitas VALUES (4, 1, '2015-08-18', '13:01:47');
INSERT INTO Visitas VALUES (4, 1, '2015-09-22', NULL);
INSERT INTO Visitas VALUES (4, 1, '2015-08-24', NULL);
INSERT INTO Visitas VALUES (4, 1, '2015-10-16', NULL);