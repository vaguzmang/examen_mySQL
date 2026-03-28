-- EMPLEADOS
INSERT INTO Empleados VALUES
(1,'Victor','Martinez','titular'),
(2,'Camilo','Silva','interino'),
(3,'Juan','Bermudez','sustituto');

-- MEDICOS
INSERT INTO Medicos VALUES
(1,1),(2,2),(3,3);

-- ESPECIALIDADES
INSERT INTO Especialidades VALUES
(1,'Pediatria'),(2,'Cardiologia');

-- RELACIONES
INSERT INTO Medico_Especialidad VALUES
(1,1),(2,2),(3,1);

-- PACIENTES
INSERT INTO Pacientes VALUES
(1,'Ana'),(2,'Luis'),(3,'Carlos');

-- CONSULTAS
INSERT INTO Consultas VALUES
(1,'2026-03-01',1,1,2),
(2,'2026-03-02',1,2,1),
(3,'2026-03-03',2,3,3);

-- VACACIONES
INSERT INTO Vacaciones VALUES
(1,1,'2026-01-01','2026-01-10','disfrutada'),
(2,2,'2026-02-01','2026-02-15','planificada');

-- SUSTITUCIONES
INSERT INTO Sustituciones VALUES
(1,3,1,'2026-03-01','2026-03-10');
