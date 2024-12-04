/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 29-Nov-2024 3:33:33 PM 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Create Tables */

CREATE TABLE "wfprev"."wildfire_org_unit"
(
	"org_unit_identifier" INT NOT NULL,    -- Org Unit Identifier is a unique number assigned to the org unit that remains consistent across temporal periods.  The geographic boundary of the org unit may change a bit over time, and the name of the org unit may change over time, but the business are still recognizes the org unit as being the same regardless of these minor changes.  Thus the Org Unit Key is used to create a consistent key to reference the org unit across temporal periods, that does not change over time.
	"effective_date" DATE NOT NULL,    -- Effective Date identifies when the organizational unit becomes operational within the Org hierarchy.
	"expiry_date" DATE NOT NULL,    -- Expiry Date identifies when the organizational unit ceases to be operational within the Org hierarchy.
	"wildfire_org_unit_type_code" varchar(10)	 NOT NULL,    -- wildfire_org_unit_type_code: Is a foreign key to wildfire_org_unit_type_code: Wildfire Org Unit Type Code defines the type of the org unit.  Values:  	- Ministry 	- Fire Centre   	- Zone
	"parent_org_unit_identifier" INT NULL,    -- Parent Org Unit Identifier identifies the parent org unit for the current Org Unit.  A zone has a fire centre as a parent. A fire centre has the BCWS ministry as a parent
	"org_unit_name" varchar(120)	 NOT NULL,    -- Org Unit Name is a meaningful name to identify the Organizational Unit.
	"integer_alias" INT NULL,    -- Integer Alias is an integer that defines the organizational unit. This is from legacy systems.
	"character_alias" varchar(10)	 NULL,    -- Character Alias is a the acronym used to define the org unit. This is used to map to legacy systems.
	"revision_count" decimal(10) NOT NULL DEFAULT 0,    -- REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.
	"create_user" varchar(64)	 NOT NULL,    -- CREATE_USER is an audit column that indicates the user that created the record.
	"create_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,    -- CREATE_DATE is the date and time the row of data was created.
	"update_user" varchar(64)	 NOT NULL,    -- UPDATE_USER is an audit column that indicates the user that updated the record.
	"update_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP    -- UPDATE_DATE is the date and time the row of data was updated.
)
TABLESPACE	PG_DEFAULT
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."org_unit_identifier"
	IS 'Org Unit Identifier is a unique number assigned to the org unit that remains consistent across temporal periods.  The geographic boundary of the org unit may change a bit over time, and the name of the org unit may change over time, but the business are still recognizes the org unit as being the same regardless of these minor changes.  Thus the Org Unit Key is used to create a consistent key to reference the org unit across temporal periods, that does not change over time.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."effective_date"
	IS 'Effective Date identifies when the organizational unit becomes operational within the Org hierarchy.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."expiry_date"
	IS 'Expiry Date identifies when the organizational unit ceases to be operational within the Org hierarchy.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."wildfire_org_unit_type_code"
	IS 'wildfire_org_unit_type_code: Is a foreign key to wildfire_org_unit_type_code: Wildfire Org Unit Type Code defines the type of the org unit.  Values:  	- Ministry 	- Fire Centre   	- Zone'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."parent_org_unit_identifier"
	IS 'Parent Org Unit Identifier identifies the parent org unit for the current Org Unit.  A zone has a fire centre as a parent. A fire centre has the BCWS ministry as a parent'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."org_unit_name"
	IS 'Org Unit Name is a meaningful name to identify the Organizational Unit.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."integer_alias"
	IS 'Integer Alias is an integer that defines the organizational unit. This is from legacy systems.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."character_alias"
	IS 'Character Alias is a the acronym used to define the org unit. This is used to map to legacy systems.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."revision_count"
	IS 'REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."create_user"
	IS 'CREATE_USER is an audit column that indicates the user that created the record.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."create_date"
	IS 'CREATE_DATE is the date and time the row of data was created.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."update_user"
	IS 'UPDATE_USER is an audit column that indicates the user that updated the record.'
;

COMMENT ON COLUMN "wfprev"."wildfire_org_unit"."update_date"
	IS 'UPDATE_DATE is the date and time the row of data was updated.'
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "wfprev"."wildfire_org_unit" ADD CONSTRAINT "wou_pk"
	PRIMARY KEY ("org_unit_identifier","effective_date","expiry_date")
;

CREATE INDEX "wou_woutcd_idx" ON "wfprev"."wildfire_org_unit" ("wildfire_org_unit_type_code" ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE "wfprev"."wildfire_org_unit" ADD CONSTRAINT "wou_woutcd_fk"
	FOREIGN KEY ("wildfire_org_unit_type_code") REFERENCES "wfprev"."wildfire_org_unit_type_code" ("wildfire_org_unit_type_code") ON DELETE No Action ON UPDATE No Action
;