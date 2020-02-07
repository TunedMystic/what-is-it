DO $$
BEGIN
    -- Create migration table.
    CREATE TABLE IF NOT EXISTS __migrations (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        version INT NOT NULL
    );

    -- Insert the migration record if it doesn't yet exist.
	IF (SELECT COUNT(*) FROM __migrations) = 0 THEN
        INSERT INTO __migrations (name, version) VALUES ('0000_base.sql', 0000);
	END IF;
END $$;
