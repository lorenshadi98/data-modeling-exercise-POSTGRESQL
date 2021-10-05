-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "Songs" (
    "song_id" int   NOT NULL,
    "title" TEXT   NOT NULL,
    "duration_in_seconds" int   NOT NULL,
    "release_date" date   NOT NULL,
    "album_id" int   NOT NULL,
    CONSTRAINT "pk_Songs" PRIMARY KEY (
        "song_id"
     )
);

CREATE TABLE "Artists" (
    "artist_id" int   NOT NULL,
    "artist_name" text   NOT NULL,
    CONSTRAINT "pk_Artists" PRIMARY KEY (
        "artist_id"
     )
);

CREATE TABLE "Songs_Artists" (
    "id" int   NOT NULL,
    "artist_id" int   NOT NULL,
    "song_id" int   NOT NULL,
    CONSTRAINT "pk_Songs_Artists" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Albums" (
    "album_id" int   NOT NULL,
    "album_name" text   NOT NULL,
    CONSTRAINT "pk_Albums" PRIMARY KEY (
        "album_id"
     )
);

CREATE TABLE "Producers" (
    "producer_id" int   NOT NULL,
    "producer_name" text   NOT NULL,
    CONSTRAINT "pk_Producers" PRIMARY KEY (
        "producer_id"
     )
);

CREATE TABLE "Songs_Producers" (
    "id" int   NOT NULL,
    "song_id" int   NOT NULL,
    "producer_id" int   NOT NULL,
    CONSTRAINT "pk_Songs_Producers" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Songs_Artists" ADD CONSTRAINT "fk_Songs_Artists_artist_id" FOREIGN KEY("artist_id")
REFERENCES "Artists" ("artist_id");

ALTER TABLE "Songs_Artists" ADD CONSTRAINT "fk_Songs_Artists_song_id" FOREIGN KEY("song_id")
REFERENCES "Songs" ("song_id");

ALTER TABLE "Albums" ADD CONSTRAINT "fk_Albums_album_id" FOREIGN KEY("album_id")
REFERENCES "Songs" ("album_id");

ALTER TABLE "Songs_Producers" ADD CONSTRAINT "fk_Songs_Producers_song_id" FOREIGN KEY("song_id")
REFERENCES "Songs" ("song_id");

ALTER TABLE "Songs_Producers" ADD CONSTRAINT "fk_Songs_Producers_producer_id" FOREIGN KEY("producer_id")
REFERENCES "Producers" ("producer_id");



