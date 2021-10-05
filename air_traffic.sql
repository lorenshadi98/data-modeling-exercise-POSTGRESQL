-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "Tickets" (
    "ticket_id" int   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    CONSTRAINT "pk_Tickets" PRIMARY KEY (
        "ticket_id"
     )
);

CREATE TABLE "Passenger_seats" (
    "id" int   NOT NULL,
    "ticket_id" int   NOT NULL,
    "seat_id" int   NOT NULL,
    CONSTRAINT "pk_Passenger_seats" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seats" (
    "seat_id" int   NOT NULL,
    "seat_location" text   NOT NULL,
    CONSTRAINT "pk_Seats" PRIMARY KEY (
        "seat_id"
     )
);

CREATE TABLE "Passenger_flight_times" (
    "id" int   NOT NULL,
    "ticket_id" int   NOT NULL,
    "departure_id" int   NOT NULL,
    "arrival_id" int   NOT NULL,
    "from_city" text   NOT NULL,
    "from_country" text   NOT NULL,
    "to_city" text   NOT NULL,
    "to_country" text   NOT NULL,
    CONSTRAINT "pk_Passenger_flight_times" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Departures" (
    "departure_id" int   NOT NULL,
    "departure_time" timestamp   NOT NULL,
    CONSTRAINT "pk_Departures" PRIMARY KEY (
        "departure_id"
     )
);

CREATE TABLE "Arrivals" (
    "arrival_id" int   NOT NULL,
    "arrival_time" timestamp   NOT NULL,
    CONSTRAINT "pk_Arrivals" PRIMARY KEY (
        "arrival_id"
     )
);

ALTER TABLE "Passenger_seats" ADD CONSTRAINT "fk_Passenger_seats_ticket_id" FOREIGN KEY("ticket_id")
REFERENCES "Tickets" ("ticket_id");

ALTER TABLE "Passenger_seats" ADD CONSTRAINT "fk_Passenger_seats_seat_id" FOREIGN KEY("seat_id")
REFERENCES "Seats" ("seat_id");

ALTER TABLE "Passenger_flight_times" ADD CONSTRAINT "fk_Passenger_flight_times_ticket_id" FOREIGN KEY("ticket_id")
REFERENCES "Tickets" ("ticket_id");

ALTER TABLE "Passenger_flight_times" ADD CONSTRAINT "fk_Passenger_flight_times_departure_id" FOREIGN KEY("departure_id")
REFERENCES "Departures" ("departure_id");

ALTER TABLE "Passenger_flight_times" ADD CONSTRAINT "fk_Passenger_flight_times_arrival_id" FOREIGN KEY("arrival_id")
REFERENCES "Arrivals" ("arrival_id");