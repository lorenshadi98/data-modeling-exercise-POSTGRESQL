-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Medical Center" (
    "MeidcalCenterID" int   NOT NULL,
    "Name" string   NOT NULL,
    "Address1" string   NOT NULL,
    "DoctorID" int   NOT NULL,
    CONSTRAINT "pk_Medical Center" PRIMARY KEY (
        "MeidcalCenterID"
     )
);

CREATE TABLE "Doctors" (
    "DoctorID" int   NOT NULL,
    "Doctor_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Patients" (
    "PatientID" int   NOT NULL,
    "Patient_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Dieases" (
    "DiseaseID" int   NOT NULL,
    "Disease_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Dieases" PRIMARY KEY (
        "DiseaseID"
     )
);

CREATE TABLE "Patients_Doctors" (
    "Patients_DoctorsID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    "DoctorID" int   NOT NULL,
    CONSTRAINT "pk_Patients_Doctors" PRIMARY KEY (
        "Patients_DoctorsID"
     )
);

CREATE TABLE "Patients_Disease" (
    "id" int   NOT NULL,
    "PatientID" int   NOT NULL,
    "DiseaseID" int   NOT NULL,
    CONSTRAINT "pk_Patients_Disease" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Medical Center" ADD CONSTRAINT "fk_Medical Center_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "Patients_Doctors" ADD CONSTRAINT "fk_Patients_Doctors_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Patients_Doctors" ADD CONSTRAINT "fk_Patients_Doctors_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "Patients_Disease" ADD CONSTRAINT "fk_Patients_Disease_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Patients_Disease" ADD CONSTRAINT "fk_Patients_Disease_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Dieases" ("DiseaseID");

CREATE INDEX "idx_Medical Center_Name"
ON "Medical Center" ("Name");

