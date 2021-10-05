-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "planets" (
    "planet_id" int   NOT NULL,
    "planet_name" text   NOT NULL,
    "orbital_period_in_years" FLOAT   NOT NULL,
    "orbits_around" text   NOT NULL,
    "galaxy" text   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "planet_id"
     )
);

CREATE TABLE "moons" (
    "moon_id" int   NOT NULL,
    "moon_name" text   NOT NULL,
    "parent_planet" int   NOT NULL,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "moon_id"
     )
);

ALTER TABLE "moons" ADD CONSTRAINT "fk_moons_parent_planet" FOREIGN KEY("parent_planet")
REFERENCES "planets" ("planet_id");
