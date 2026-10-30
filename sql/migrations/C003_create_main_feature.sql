CREATE TABLE IF NOT EXISTS migration_test.main_demo (
    id SERIAL PRIMARY KEY,
    message VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO migration_test.main_demo (message)
VALUES ('Created by main branch');