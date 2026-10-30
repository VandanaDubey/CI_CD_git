CREATE SCHEMA IF NOT EXISTS hr;

COMMENT ON SCHEMA hr IS 'Human Resource Management Schema';


CREATE TABLE IF NOT EXISTS hr.departments
(
    department_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);


CREATE TABLE IF NOT EXISTS hr.employees
(
    employee_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_code VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(15),
    department_id BIGINT,
    salary NUMERIC(12,2) CHECK (salary >= 0),
    joining_date DATE NOT NULL DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES hr.departments(department_id)
);


CREATE TABLE IF NOT EXISTS hr.projects
(
    project_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    project_code VARCHAR(30) UNIQUE NOT NULL,
    start_date DATE,
    end_date DATE,
    project_status VARCHAR(20) DEFAULT 'PLANNED',

    CONSTRAINT chk_project_dates
        CHECK (end_date IS NULL OR end_date >= start_date),

    CONSTRAINT chk_project_status
        CHECK (project_status IN
        ('PLANNED', 'ACTIVE', 'COMPLETED', 'CANCELLED'))
);


CREATE TABLE IF NOT EXISTS hr.employee_projects
(
    employee_id BIGINT NOT NULL,
    project_id BIGINT NOT NULL,
    assigned_date DATE DEFAULT CURRENT_DATE,
    role_name VARCHAR(100),

    PRIMARY KEY (employee_id, project_id),

    CONSTRAINT fk_ep_employee
        FOREIGN KEY (employee_id)
        REFERENCES hr.employees(employee_id),

    CONSTRAINT fk_ep_project
        FOREIGN KEY (project_id)
        REFERENCES hr.projects(project_id)
);


CREATE TABLE IF NOT EXISTS hr.attendance
(
    attendance_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id BIGINT NOT NULL,
    attendance_date DATE NOT NULL,
    check_in TIME,
    check_out TIME,
    attendance_status VARCHAR(20) DEFAULT 'PRESENT',

    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (employee_id)
        REFERENCES hr.employees(employee_id),

    CONSTRAINT uq_employee_attendance
        UNIQUE (employee_id, attendance_date),

    CONSTRAINT chk_attendance_status
        CHECK (attendance_status IN
        ('PRESENT', 'ABSENT', 'HALF_DAY', 'LEAVE'))
);


CREATE INDEX IF NOT EXISTS idx_employees_department
ON hr.employees(department_id);

CREATE INDEX IF NOT EXISTS idx_employees_name
ON hr.employees(first_name, last_name);

CREATE INDEX IF NOT EXISTS idx_attendance_date
ON hr.attendance(attendance_date);

CREATE INDEX IF NOT EXISTS idx_employee_projects_project
ON hr.employee_projects(project_id);
