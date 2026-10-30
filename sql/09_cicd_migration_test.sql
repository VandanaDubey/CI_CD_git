create schema migration_test;

CREATE TABLE IF NOT EXISTS migration_test.cicd_migration_test (
    id SERIAL PRIMARY KEY,
    test_message VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO migration_test.cicd_migration_test (test_message)
VALUES ('Migration executed successfully');