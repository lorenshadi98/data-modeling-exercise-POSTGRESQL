-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "Teams" (
    "teamID" int   NOT NULL,
    "team_rank" int   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "teamID"
     )
);

CREATE TABLE "Goals" (
    "goalID" int   NOT NULL,
    "scored_during_game" int   NOT NULL,
    "scored_by" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "goalID"
     )
);

CREATE TABLE "Players" (
    "playerID" int   NOT NULL,
    "player_name" text   NOT NULL,
    "player_team" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "playerID"
     )
);

CREATE TABLE "Referees" (
    "refereeID" int   NOT NULL,
    "referee_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "refereeID"
     )
);

CREATE TABLE "Matches" (
    "matchID" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "matchID"
     )
);

CREATE TABLE "Referees_Matches" (
    "id" int   NOT NULL,
    "refereeID" int   NOT NULL,
    "matchID" int   NOT NULL,
    CONSTRAINT "pk_Referees_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Teams_Matches" (
    "id" int   NOT NULL,
    "teamID" int   NOT NULL,
    "matchID" int   NOT NULL,
    CONSTRAINT "pk_Teams_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seasons" (
    "seasonID" int   NOT NULL,
    "start_date" Date   NOT NULL,
    "end_date" Date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "seasonID"
     )
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_scored_during_game" FOREIGN KEY("scored_during_game")
REFERENCES "Matches" ("matchID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_scored_by" FOREIGN KEY("scored_by")
REFERENCES "Players" ("playerID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_player_team" FOREIGN KEY("player_team")
REFERENCES "Teams" ("teamID");

ALTER TABLE "Referees_Matches" ADD CONSTRAINT "fk_Referees_Matches_refereeID" FOREIGN KEY("refereeID")
REFERENCES "Referees" ("refereeID");

ALTER TABLE "Referees_Matches" ADD CONSTRAINT "fk_Referees_Matches_matchID" FOREIGN KEY("matchID")
REFERENCES "Matches" ("matchID");

ALTER TABLE "Teams_Matches" ADD CONSTRAINT "fk_Teams_Matches_teamID" FOREIGN KEY("teamID")
REFERENCES "Teams" ("teamID");

ALTER TABLE "Teams_Matches" ADD CONSTRAINT "fk_Teams_Matches_matchID" FOREIGN KEY("matchID")
REFERENCES "Matches" ("matchID");

