CREATE SCHEMA accounting AUTHORIZATION hr;

CREATE TABLE accounting.mata_uang (
    id CHARACTER VARYING(64) NOT NULL,
    name CHARACTER VARYING(100) NOT NULL,
    symbol CHARACTER VARYING(5),
    create_date DATE NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS accounting.mata_uang OWNER TO hr;
