/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 10-Jan-2025 3:58:58 PM 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Create Tables */

CREATE TABLE "wfprev"."silviculture_base"
(
	"silviculture_base_guid" UUID NOT NULL,    -- silviculture_base_guid is a unique identifier for the record.
	"project_type_code" varchar(10)	 NOT NULL,    -- project_type_code: Is a foreign key to project_type_code: Project Type Code defines the type of the project.  Values are:   	- Fuel Management  	- Cultural & Prescribed Fire
	"silviculture_base_code" varchar(10)	 NOT NULL,    -- silviculture_base_code: Is a foreign key to silviculture_base_code: Silviculture Base is a list of Silviculture bases that can be applied as a treatment activity.  Taken from THE.SILV_BASE_CODE table: AU	Audit BR	Brushing CC	Cone Collection CM	Crown Modification DN	Denudation DS	Direct Seeding EP	Experimental Activities FE	Fertilization JS	Juvenile Spacing PC	Pest Control PL	Planting PR	Pruning RC	Recreation RD	Roads SP	Site Preparation SU	Surveys SX	Silviculture Trials
	"system_start_timestamp" TIMESTAMP NOT NULL,    -- System Start Timestamp is the date and time with millisecond accuracy when the record becomes effective.   The System Start Timestamp and System End Timestamp fields are managed as a set by the system and is not exposed to the end user. When an update is made to the data in the record, the system will be responsible for expiring the old record and creating a new record with the updated data. 
	"system_end_timestamp" TIMESTAMP NOT NULL,    -- System End Timestamp is the date and time with millisecond accuracy when the record becomes effective. The current instance of the record will be set to Dec 31, 9999 by default.  The System Start Timestamp and System End Timestamp fields are managed as a set by the system and is not exposed to the end user. When an update is made to the data in the record, the system will be responsible for expiring the old record and creating a new record with the updated data. 
	"revision_count" decimal(10) NOT NULL DEFAULT 0,    -- REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.
	"create_user" varchar(64)	 NOT NULL,    -- CREATE_USER is an audit column that indicates the user that created the record.
	"create_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,    -- CREATE_DATE is the date and time the row of data was created.
	"update_user" varchar(64)	 NOT NULL,    -- UPDATE_USER is an audit column that indicates the user that updated the record.
	"update_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP    -- UPDATE_DATE is the date and time the row of data was updated.
)
TABLESPACE	PG_DEFAULT
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE "wfprev"."silviculture_base"
	IS 'Silviculture Base is a list of Silviculture bases that are mapped to a project type.'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."silviculture_base_guid"
	IS 'silviculture_base_guid is a unique identifier for the record.'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."project_type_code"
	IS 'project_type_code: Is a foreign key to project_type_code: Project Type Code defines the type of the project.  Values are:   	- Fuel Management  	- Cultural & Prescribed Fire'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."silviculture_base_code"
	IS 'silviculture_base_code: Is a foreign key to silviculture_base_code: Silviculture Base is a list of Silviculture bases that can be applied as a treatment activity.  Taken from THE.SILV_BASE_CODE table: AU	Audit BR	Brushing CC	Cone Collection CM	Crown Modification DN	Denudation DS	Direct Seeding EP	Experimental Activities FE	Fertilization JS	Juvenile Spacing PC	Pest Control PL	Planting PR	Pruning RC	Recreation RD	Roads SP	Site Preparation SU	Surveys SX	Silviculture Trials'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."system_start_timestamp"
	IS 'System Start Timestamp is the date and time with millisecond accuracy when the record becomes effective.   The System Start Timestamp and System End Timestamp fields are managed as a set by the system and is not exposed to the end user. When an update is made to the data in the record, the system will be responsible for expiring the old record and creating a new record with the updated data. '
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."system_end_timestamp"
	IS 'System End Timestamp is the date and time with millisecond accuracy when the record becomes effective. The current instance of the record will be set to Dec 31, 9999 by default.  The System Start Timestamp and System End Timestamp fields are managed as a set by the system and is not exposed to the end user. When an update is made to the data in the record, the system will be responsible for expiring the old record and creating a new record with the updated data. '
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."revision_count"
	IS 'REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."create_user"
	IS 'CREATE_USER is an audit column that indicates the user that created the record.'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."create_date"
	IS 'CREATE_DATE is the date and time the row of data was created.'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."update_user"
	IS 'UPDATE_USER is an audit column that indicates the user that updated the record.'
;

COMMENT ON COLUMN "wfprev"."silviculture_base"."update_date"
	IS 'UPDATE_DATE is the date and time the row of data was updated.'
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "wfprev"."silviculture_base" ADD CONSTRAINT "slvbase_pk"
	PRIMARY KEY ("silviculture_base_guid")
;

ALTER TABLE "wfprev"."silviculture_base" ADD CONSTRAINT "slvbase_uk" UNIQUE ("project_type_code","silviculture_base_code","system_start_timestamp","system_end_timestamp")
;

CREATE INDEX "slvbase_prjtcd_idx" ON "wfprev"."silviculture_base" ("project_type_code" ASC)
;

CREATE INDEX "slvbase_slvbscd_idx" ON "wfprev"."silviculture_base" ("silviculture_base_code" ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE "wfprev"."silviculture_base" ADD CONSTRAINT "slvbase_prjtcd_fk"
	FOREIGN KEY ("project_type_code") REFERENCES "wfprev"."project_type_code" ("project_type_code") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "wfprev"."silviculture_base" ADD CONSTRAINT "slvbase_slvbscd_fk"
	FOREIGN KEY ("silviculture_base_code") REFERENCES "wfprev"."silviculture_base_code" ("silviculture_base_code") ON DELETE No Action ON UPDATE No Action
;