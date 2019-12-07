﻿
--drop table "dept_emp";
--drop table "dept_managers" ;
--drop table "titles" ;
--drop table  "salaries";

--drop TABLE "employees";
--drop Table   "departments";


CREATE TABLE "employees" (
    "id"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "gender" varchar(3)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "id"  SERIAL  NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY(
        "dept_no"
		)
);

CREATE TABLE "dept_emp" (
    "id"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date  NULL
);

CREATE TABLE "dept_managers" (
    "id"  SERIAL  NOT NULL,
    "dept_no" varchar(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NULL
);

CREATE TABLE "titles" (
    "id"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "title" varchar(100)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NULL
);

CREATE TABLE "salaries" (
    "id"  SERIAL  NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

