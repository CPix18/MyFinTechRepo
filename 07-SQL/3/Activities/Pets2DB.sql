CREATE TABLE "State" (
  "StateCode" char(2),
  "StateName" varchar(50),
  "LeashLaw" bool,
  PRIMARY KEY ("StateCode")
);

CREATE TABLE "Owner" (
  "OwnerID" Serial,
  "OwnerName" varchar(200),
  "Address" varchar(200),
  "City" varchar(200),
  "StateCode" char(2),
  "Zip" char(5),
  PRIMARY KEY ("OwnerID"),
	Foreign Key ("StateCode") References "State" ("StateCode")
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
  PRIMARY KEY ("PetID"),
	Foreign Key ("PetTypeID") References "PetType" ("PetTypeID"),
	Foreign Key ("OwnerID") References "Owner" ("OwnerID")
);

CREATE TABLE "Employer" (
  "EmployerID" Serial,
  "EmployerName" varchar(200),
  "Address" varchar(200),
  "City" varchar(200),
  "StateCode" char(2),
  "Zip" char(5),
  PRIMARY KEY ("EmployerID"),
	Foreign Key ("StateCode") References "State" ("StateCode")
);

CREATE TABLE "OwnerWorksForEmployer" (
  "OwnerID" int,
  "EmployerID" int,
  "StartDate" Date,
	Primary Key ("OwnerID", "EmployerID"),
	Foreign Key ("OwnerID") References "Owner" ("OwnerID"),
	Foreign Key ("EmployerID") References "Employer" ("EmployerID")
);

