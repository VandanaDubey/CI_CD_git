INSERT INTO hr.departments
(department_name, location, is_active)
VALUES
('IT', 'Pune', TRUE),
('Human Resources', 'Mumbai', TRUE),
('Finance', 'Pune', TRUE),
('Marketing', 'Bangalore', TRUE),
('Operations', 'Hyderabad', TRUE);


INSERT INTO hr.employees
(employee_code, first_name, last_name, email, phone,
 department_id, salary, joining_date, is_active)
VALUES
('EMP001', 'Amit', 'Sharma', 'amit.sharma@company.com', '9876543210', 1, 75000, '2022-01-15', TRUE),
('EMP002', 'Priya', 'Patil', 'priya.patil@company.com', '9876543211', 1, 85000, '2020-06-10', TRUE),
('EMP003', 'Rahul', 'Verma', 'rahul.verma@company.com', '9876543212', 2, 55000, '2023-03-20', TRUE),
('EMP004', 'Sneha', 'Joshi', 'sneha.joshi@company.com', '9876543213', 2, 60000, '2021-08-05', TRUE),
('EMP005', 'Vikas', 'Gupta', 'vikas.gupta@company.com', '9876543214', 3, 70000, '2019-11-12', TRUE),
('EMP006', 'Neha', 'Singh', 'neha.singh@company.com', '9876543215', 3, 65000, '2024-02-01', TRUE),
('EMP007', 'Rohit', 'Kumar', 'rohit.kumar@company.com', '9876543216', 4, 50000, '2023-07-18', TRUE),
('EMP008', 'Anjali', 'Deshmukh', 'anjali.deshmukh@company.com', '9876543217', 4, 58000, '2022-09-25', FALSE),
('EMP009', 'Karan', 'Mehta', 'karan.mehta@company.com', '9876543218', 5, 90000, '2017-04-10', TRUE),
('EMP010', 'Pooja', 'Reddy', 'pooja.reddy@company.com', '9876543219', 5, 45000, '2025-01-05', TRUE);

