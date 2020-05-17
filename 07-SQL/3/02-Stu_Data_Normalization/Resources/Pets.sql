CREATE TABLE "State" (
  "StateCode" char(2),
  "StateName" varchar(50),
  "LeashLaw" bool,
  PRIMARY KEY ("StateCode")
);

CREATE TABLE "Employer" (
  "EmployerID" Serial,
  "EmployerName" varchar(200),
  "Address" varchar(200),
  "City" varchar(200),
  "StateCode" char(2),
  "Zip" char(5),
  PRIMARY KEY ("EmployerID")
);

CREATE TABLE "Owner" (
  "OwnerID" Serial,
  "OwnerName" varchar(200),
  "Address" varchar(200),
  "City" varchar(200),
  "StateCode" char(2),
  "Zip" char(5),
  PRIMARY KEY ("OwnerID")
);

CREATE TABLE "PetType" (
  "PetTypeID" Serial,
  "PetType" varchar(50),
  PRIMARY KEY ("PetTypeID")
);

CREATE TABLE "Pets" (
  "PetID" Serial,
  "PetName" varchar(100),
  "PetTypeID" int,
  "OwnerID" int,
  PRIMARY KEY ("PetID")
);

CREATE INDEX "FK" ON  "Pets" ("PetTypeID", "OwnerID");

CREATE TABLE "OwnerWorksForEmployer" (
  "OwnerID" int,
  "EmployerID" int,
  "StartDate" Date
);

CREATE INDEX "PK,FK" ON  "OwnerWorksForEmployer" ("OwnerID", "EmployerID");



