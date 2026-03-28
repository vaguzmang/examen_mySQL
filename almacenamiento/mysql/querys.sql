-- ============================================
-- 1. Número de pacientes atendidos por cada médico
-- ============================================

SELECT m.id_medico, COUNT(c.id_paciente) AS total_pacientes
FROM Medicos m
JOIN Consultas c ON m.id_medico = c.id_medico
GROUP BY m.id_medico;

-- ============================================
-- 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado
-- ============================================

SELECT v.id_empleado, 
       SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS total_dias
FROM Vacaciones v
GROUP BY v.id_empleado;

-- ============================================
-- 3. Médicos con mayor cantidad de horas de consulta en la semana
-- ============================================

SELECT m.id_medico, SUM(c.horas) AS total_horas
FROM Medicos m
JOIN Consultas c ON m.id_medico = c.id_medico
GROUP BY m.id_medico
ORDER BY total_horas DESC;

-- ============================================
-- 4. Número de sustituciones realizadas por cada médico sustituto
-- ============================================

SELECT s.id_medico_sustituto, COUNT(*) AS total_sustituciones
FROM Sustituciones s
GROUP BY s.id_medico_sustituto;

-- ============================================
-- 5. Número de médicos que están actualmente en sustitución
-- ============================================

SELECT COUNT(DISTINCT s.id_medico_sustituto) AS medicos_en_sustitucion
FROM Sustituciones s
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;

-- ============================================
-- 6. Horas totales de consulta por médico por día de la semana
-- ============================================

SELECT c.id_medico, DAYNAME(c.fecha) AS dia_semana, SUM(c.horas) AS total_horas
FROM Consultas c
GROUP BY c.id_medico, DAYNAME(c.fecha);

-- ============================================
-- 7. Médico con mayor cantidad de pacientes asignados
-- ============================================

SELECT c.id_medico, COUNT(*) AS total_pacientes
FROM Consultas c
GROUP BY c.id_medico
ORDER BY total_pacientes DESC
LIMIT 1;

-- ============================================
-- 8. Empleados con más de 10 días de vacaciones disfrutadas
-- ============================================

SELECT v.id_empleado, 
       SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS dias_disfrutados
FROM Vacaciones v
WHERE v.estado = 'disfrutada'
GROUP BY v.id_empleado
HAVING dias_disfrutados > 10;

-- ============================================
-- 9. Médicos que actualmente están realizando una sustitución
-- ============================================

SELECT s.id_medico_sustituto
FROM Sustituciones s
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;

-- ============================================
-- 10. Total de días de vacaciones por tipo de empleado
-- ============================================

SELECT e.tipo_empleado, 
       SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS total_dias
FROM Vacaciones v
JOIN Empleados e ON v.id_empleado = e.id_empleado
GROUP BY e.tipo_empleado;

-- ============================================
-- 11. Total de pacientes por cada tipo de médico
-- ============================================

SELECT e.tipo_empleado, COUNT(c.id_paciente) AS total_pacientes
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
JOIN Empleados e ON m.id_empleado = e.id_empleado
GROUP BY e.tipo_empleado;

-- ============================================
-- 12. Número de sustituciones por tipo de médico
-- ============================================

SELECT e.tipo_empleado, COUNT(*) AS total
FROM Sustituciones s
JOIN Medicos m ON s.id_medico_sustituto = m.id_medico
JOIN Empleados e ON m.id_empleado = e.id_empleado
GROUP BY e.tipo_empleado;

-- ============================================
-- 13. Total de pacientes por médico y por especialidad
-- ============================================

SELECT m.id_medico, e.nombre AS especialidad, COUNT(c.id_paciente) AS total_pacientes
FROM Medicos m
JOIN Medico_Especialidad me ON m.id_medico = me.id_medico
JOIN Especialidades e ON me.id_especialidad = e.id_especialidad
JOIN Consultas c ON m.id_medico = c.id_medico
GROUP BY m.id_medico, e.nombre;

-- ============================================
-- 14. Empleados con más de 20 días de vacaciones planificadas
-- ============================================

SELECT v.id_empleado, 
       SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS total_dias
FROM Vacaciones v
WHERE v.estado = 'planificada'
GROUP BY v.id_empleado
HAVING total_dias > 20;

-- ============================================
-- 15. Total de horas de consulta por especialidad y día de la semana
-- ============================================

SELECT e.nombre AS especialidad, 
       DAYNAME(c.fecha) AS dia_semana, 
       SUM(c.horas) AS total_horas
FROM Consultas c
JOIN Medicos m ON c.id_medico = m.id_medico
JOIN Medico_Especialidad me ON m.id_medico = me.id_medico
JOIN Especialidades e ON me.id_especialidad = e.id_especialidad
GROUP BY e.nombre, DAYNAME(c.fecha);
