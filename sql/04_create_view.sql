CREATE OR REPLACE VIEW hr.vw_employee_details AS
SELECT
    e.employee_id,
    e.employee_code,
    e.first_name,
    e.last_name,
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
    e.email,
    e.phone,
    e.salary,
    d.department_id,
    d.department_name,
    d.location AS department_location,
    e.joining_date,
    e.is_active,
    e.created_at
FROM hr.employees e
LEFT JOIN hr.departments d
    ON e.department_id = d.department_id;


CREATE OR REPLACE VIEW hr.vw_department_summary AS
SELECT
    d.department_id,
    d.department_name,
    d.location,
    COUNT(e.employee_id) AS total_employees,
    COUNT(e.employee_id) FILTER (WHERE e.is_active = TRUE) AS active_employees,
    COUNT(e.employee_id) FILTER (WHERE e.is_active = FALSE) AS inactive_employees,
    ROUND(AVG(e.salary), 2) AS average_salary,
    COALESCE(SUM(e.salary), 0) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name,
    d.location;


CREATE OR REPLACE VIEW hr.vw_employee_project_details AS
SELECT
    ep.employee_id,
    e.employee_code,
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
    d.department_name,
    p.project_id,
    p.project_code,
    p.project_name,
    ep.role_name,
    ep.assigned_date,
    p.start_date,
    p.end_date,
    p.project_status
FROM hr.employee_projects ep
INNER JOIN hr.employees e
    ON ep.employee_id = e.employee_id
INNER JOIN hr.projects p
    ON ep.project_id = p.project_id
LEFT JOIN hr.departments d
    ON e.department_id = d.department_id;


CREATE OR REPLACE VIEW hr.vw_project_summary AS
SELECT
    p.project_id,
    p.project_code,
    p.project_name,
    p.start_date,
    p.end_date,
    p.project_status,
    COUNT(ep.employee_id) AS total_assigned_employees,
    COUNT(ep.employee_id) FILTER (
        WHERE e.is_active = TRUE
    ) AS active_assigned_employees
FROM hr.projects p
LEFT JOIN hr.employee_projects ep
    ON p.project_id = ep.project_id
LEFT JOIN hr.employees e
    ON ep.employee_id = e.employee_id
GROUP BY
    p.project_id,
    p.project_code,
    p.project_name,
    p.start_date,
    p.end_date,
    p.project_status;


CREATE OR REPLACE VIEW hr.vw_employee_attendance AS
SELECT
    a.attendance_id,
    a.employee_id,
    e.employee_code,
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
    d.department_name,
    a.attendance_date,
    a.check_in,
    a.check_out,
    a.attendance_status,
    CASE
        WHEN a.check_in IS NOT NULL
         AND a.check_out IS NOT NULL
        THEN a.check_out - a.check_in
        ELSE NULL
    END AS working_duration
FROM hr.attendance a
INNER JOIN hr.employees e
    ON a.employee_id = e.employee_id
LEFT JOIN hr.departments d
    ON e.department_id = d.department_id;


CREATE OR REPLACE VIEW hr.vw_monthly_attendance_summary AS
SELECT
    a.employee_id,
    e.employee_code,
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name,
    d.department_name,
    DATE_TRUNC('month', a.attendance_date)::DATE AS attendance_month,
    COUNT(*) AS total_recorded_days,
    COUNT(*) FILTER (
        WHERE a.attendance_status = 'PRESENT'
    ) AS present_days,
    COUNT(*) FILTER (
        WHERE a.attendance_status = 'ABSENT'
    ) AS absent_days,
    COUNT(*) FILTER (
        WHERE a.attendance_status = 'HALF_DAY'
    ) AS half_days,
    COUNT(*) FILTER (
        WHERE a.attendance_status = 'LEAVE'
    ) AS leave_days
FROM hr.attendance a
INNER JOIN hr.employees e
    ON a.employee_id = e.employee_id
LEFT JOIN hr.departments d
    ON e.department_id = d.department_id
GROUP BY
    a.employee_id,
    e.employee_code,
    e.first_name,
    e.last_name,
    d.department_name,
    DATE_TRUNC('month', a.attendance_date)::DATE;



CREATE OR REPLACE VIEW hr.vw_employee_experience AS
SELECT
    employee_id,
    employee_code,
    first_name,
    last_name,
    joining_date,
    AGE(CURRENT_DATE, joining_date) AS experience,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, joining_date))::INTEGER AS experience_years,
    CASE
        WHEN joining_date > CURRENT_DATE THEN 'INVALID JOINING DATE'
        WHEN AGE(CURRENT_DATE, joining_date) < INTERVAL '1 year'
            THEN 'Fresher'
        WHEN AGE(CURRENT_DATE, joining_date) < INTERVAL '5 years'
            THEN 'Junior'
        WHEN AGE(CURRENT_DATE, joining_date) < INTERVAL '10 years'
            THEN 'Mid-Level'
        ELSE 'Senior'
    END AS experience_category
FROM hr.employees;


CREATE OR REPLACE VIEW hr.vw_active_projects AS
SELECT
    project_id,
    project_code,
    project_name,
    start_date,
    end_date,
    project_status
FROM hr.projects
WHERE project_status = 'ACTIVE';



CREATE OR REPLACE VIEW hr.vw_active_projects11 AS
SELECT
    project_id,
    project_code,
    project_name
FROM hr.projects
WHERE project_status = 'ACTIVE';