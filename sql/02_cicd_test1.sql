CREATE TABLE IF NOT EXISTS cicd_demo.cicd_test (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO cicd_demo.cicd_test (message)
VALUES ('First automatic CI/CD execution');
