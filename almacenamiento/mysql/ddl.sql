-- ============================================
-- BASE DE DATOS
-- ============================================

CREATE DATABASE IF NOT EXISTS medisistema_examen;
USE medisistema_examen;

-- ============================================
-- TABLA: Empleados
-- ============================================

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    tipo_empleado VARCHAR(30) -- titular, interino, sustituto
);

-- ============================================
-- TABLA: Medicos
-- ============================================

CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- ============================================
-- TABLA: Especialidades
-- ============================================

CREATE TABLE Especialidades (
    id_especialidad INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- ============================================
-- TABLA: Relación Medico - Especialidad
-- ============================================

CREATE TABLE Medico_Especialidad (
    id_medico INT,
    id_especialidad INT,
    PRIMARY KEY (id_medico, id_especialidad),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id_especialidad)
);

-- ============================================
-- TABLA: Pacientes
-- ============================================

CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- ============================================
-- TABLA: Consultas
-- ============================================

CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY,
    fecha DATE,
    id_medico INT,
    id_paciente INT,
    horas INT,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
);

-- ============================================
-- TABLA: Vacaciones
-- ============================================

CREATE TABLE Vacaciones (
    id_vacacion INT PRIMARY KEY,
    id_empleado INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20), -- planificada / disfrutada
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- ============================================
-- TABLA: Sustituciones
-- ============================================

CREATE TABLE Sustituciones (
    id_sustitucion INT PRIMARY KEY,
    id_medico_sustituto INT,
    id_medico_reemplazado INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_medico_sustituto) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_medico_reemplazado) REFERENCES Medicos(id_medico)
);
