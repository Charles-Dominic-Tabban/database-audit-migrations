-- V4: Create application roles and assign permissions

CREATE ROLE app_read NOLOGIN;
CREATE ROLE app_write NOLOGIN;
CREATE ROLE api LOGIN;


GRANT CONNECT ON DATABASE bootcamp TO app_read, app_write;
GRANT USAGE ON SCHEMA public TO app_read, app_write;

-- Read-only permissions
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_read;

-- Read and write permissions
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO app_write;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO app_write;

-- Give the API login the application roles
GRANT app_read, app_write TO api;

-- Permissions for tables created in the future
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO app_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLES TO app_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO app_write;
