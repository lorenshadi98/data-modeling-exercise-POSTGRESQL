-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "Regions" (
    "regionID" int   NOT NULL,
    "region_name" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "regionID"
     )
);

CREATE TABLE "Users" (
    "userID" int   NOT NULL,
    "user_name" text   NOT NULL,
    "prefered_region" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "userID"
     )
);

CREATE TABLE "Posts" (
    "postID" int   NOT NULL,
    "post_title" text   NOT NULL,
    "posted_by" int   NOT NULL,
    "post_location" text   NOT NULL,
    "post_region_id" id   NOT NULL,
    "post_category_id" id   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "postID"
     )
);

CREATE TABLE "Post_categories" (
    "categoryID" int   NOT NULL,
    "category_name" text   NOT NULL,
    CONSTRAINT "pk_Post_categories" PRIMARY KEY (
        "categoryID"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_prefered_region" FOREIGN KEY("prefered_region")
REFERENCES "Regions" ("regionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_posted_by" FOREIGN KEY("posted_by")
REFERENCES "Users" ("userID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_post_region_id" FOREIGN KEY("post_region_id")
REFERENCES "Regions" ("regionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_post_category_id" FOREIGN KEY("post_category_id")
REFERENCES "Post_categories" ("categoryID");

