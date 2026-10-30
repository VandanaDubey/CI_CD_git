CREATE TABLE IF NOT EXISTS public.cicd_migration_demo (
    id SERIAL PRIMARY KEY,
    test_message VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO public.cicd_migration_demo (test_message)
VALUES ('First migration executed successfully');