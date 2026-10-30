INSERT INTO hr.projects
(project_name, project_code, start_date, end_date, project_status)
VALUES
('Employee Management System', 'PRJ001', '2025-01-01', NULL, 'ACTIVE'),
('Payroll Automation', 'PRJ002', '2024-06-01', '2025-03-31', 'COMPLETED'),
('HR Analytics Dashboard', 'PRJ003', '2025-04-01', NULL, 'ACTIVE'),
('Website Development', 'PRJ004', '2026-01-01', NULL, 'PLANNED'),
('Database Migration', 'PRJ005', '2025-02-01', '2025-12-31', 'CANCELLED');


INSERT INTO hr.employee_projects
(employee_id, project_id, assigned_date, role_name)
VALUES
(1, 1, '2025-01-05', 'Database Developer'),
(2, 1, '2025-01-05', 'Project Manager'),
(1, 3, '2025-04-10', 'Database Administrator'),
(3, 2, '2024-06-05', 'HR Executive'),
(4, 3, '2025-04-15', 'HR Analyst'),
(5, 5, '2025-02-10', 'Finance Analyst'),
(6, 2, '2024-06-10', 'Financial Consultant'),
(7, 4, '2026-01-05', 'Marketing Specialist'),
(8, 4, '2026-01-10', 'Content Developer'),
(9, 1, '2025-01-10', 'Operations Manager'),
(10, 3, '2025-04-20', 'Business Analyst');



INSERT INTO hr.attendance
(employee_id, attendance_date, check_in, check_out, attendance_status)
VALUES
-- 01 October 2026
(1, '2026-10-01', '09:00', '18:00', 'PRESENT'),
(2, '2026-10-01', '09:15', '18:15', 'PRESENT'),
(3, '2026-10-01', '09:30', '18:00', 'PRESENT'),
(4, '2026-10-01', NULL, NULL, 'LEAVE'),
(5, '2026-10-01', '09:00', '17:00', 'PRESENT'),
(6, '2026-10-01', NULL, NULL, 'ABSENT'),
(7, '2026-10-01', '09:00', '13:00', 'HALF_DAY'),
(8, '2026-10-01', '09:15', '18:00', 'PRESENT'),
(9, '2026-10-01', '08:45', '17:45', 'PRESENT'),
(10, '2026-10-01', '09:30', '18:00', 'PRESENT'),

-- 02 October 2026
(1, '2026-10-02', '09:05', '18:00', 'PRESENT'),
(2, '2026-10-02', NULL, NULL, 'ABSENT'),
(3, '2026-10-02', '09:00', '18:00', 'PRESENT'),
(4, '2026-10-02', '09:00', '18:00', 'PRESENT'),
(5, '2026-10-02', '09:10', '17:30', 'PRESENT'),
(6, '2026-10-02', '09:00', '13:00', 'HALF_DAY'),
(7, '2026-10-02', '09:15', '18:00', 'PRESENT'),
(8, '2026-10-02', NULL, NULL, 'LEAVE'),
(9, '2026-10-02', '09:00', '18:00', 'PRESENT'),
(10, '2026-10-02', '09:00', '18:00', 'PRESENT'),

-- 03 October 2026
(1, '2026-10-03', '09:00', '18:00', 'PRESENT'),
(2, '2026-10-03', '09:00', '18:00', 'PRESENT'),
(3, '2026-10-03', NULL, NULL, 'LEAVE'),
(4, '2026-10-03', '09:30', '18:00', 'PRESENT'),
(5, '2026-10-03', NULL, NULL, 'ABSENT');