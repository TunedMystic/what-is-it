-- Migration check
DO $$
DECLARE
	v integer := 1;
    migration_name varchar := 'create_tables';
BEGIN
    -- If migration has already been run, then return.
	IF (EXISTS(select id from __migrations where version >= v)) THEN
        RETURN;
	END IF;

    -- ------------------------------------------------------------------
    -- Perform migration.
    CREATE TABLE IF NOT EXISTS _country (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        slug VARCHAR(100)
    );

    CREATE TABLE IF NOT EXISTS _event (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        slug VARCHAR(100),
        tagline VARCHAR(100),
        date DATE,

        -- Foreign key relations.
        country_id INTEGER REFERENCES _country(id)
    );

    -- ------------------------------------------------------------------
    -- Update migrations.
    UPDATE __migrations SET name = CONCAT(v, '_', migration_name), version = v;
END $$;
