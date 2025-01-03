/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 20-Dec-2024 4:22:14 PM 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Create Tables */

CREATE TABLE "wfprev"."project_plan_fiscal"
(
	"project_plan_fiscal_guid" UUID NOT NULL,    -- project_plan_fiscal_guid is a unique identifier for the record.
	"project_guid" UUID NOT NULL,    -- project_guid: Is a foreign key to project: Project is used to track Prevention Projects which are created to reduce risks due to forest fires. 
	"activity_category_code" varchar(10)	 NOT NULL,    -- activity_category_code: Is a foreign key to activity_category_code: Activity Category Code is the set of activity categories that may be performed for a project.   Values are:  	- Tactical Planning 	- Prescription Development 	- Maintenance - Survey 	- Maintenance - Operational Treatment 	- Other (Assessments/Surveys) 	- Other (Administration) 	- Integrated Fuel Management Planning.
	"fiscal_year" decimal(4) NOT NULL,    -- Fiscal Year is the fiscal year the project proposal is being submitted for.
	"ancillary_funding_source_guid" UUID NULL,    -- ancillary_funding_source_guid: Is a foreign key to ancillary_funding_source: Ancillary Funding Source is a list of ancillary funding providers who may provide additional funds on top of what is provided by a primary funding provider to complete a treatment.  Example Funding Sources:  	- BCP - BC Parks 	- CFS - FireSmart Community Funding Supports   	- CLWRR - Crown Land Wildfire Risk Reduction 	- Community Resiliency Investment   	- FEP - Forest Employment Program 	- FESBC - Forest Enhancement Society of BC 	- ER - Ecosytem Restoration   	- Forest District Org Unit
	"project_plan_status_code" varchar(10)	 NOT NULL,    -- project_plan_status_code: Is a foreign key to project_plan_status_code: Project Plan Status Code is the status of a prevention project plan for a fiscal year. Values are:  	- Active 	- Deleted 	- Archived
	"plan_fiscal_status_code" varchar(10)	 NOT NULL,    -- plan_fiscal_status_code: Is a foreign key to plan_fiscal_status_code: Plan Fiscal Status Code is the set of statuses a project plan may transition through. Values are:  	- Draft 	- Proposed 	- In Preparation 	- In Progress 	- Complete 	- Abandoned
	"endorsement_code" varchar(10)	 NULL,    -- endorsement_code: Is a foreign key to endorsement_code: Endorsement Code is a list of codes used to track whether a project is not endorsed, endorsed, or requires follow-up work.  Values are:  	- Not Endorsed 	- Endorsed 	- Follow-Up Required
	"project_fiscal_name" varchar(300)	 NOT NULL,    -- Project Fiscal Name is a short descriptor for a CAS Project for the fiscal year.  Examples include: * 26WRR FM - West Arm PP TU 3 Integrated Fuel Management Planning
	"project_fiscal_description" varchar(4000)	 NULL,    -- Project Fiscal Description is a description of the project proposal for the fiscal year. 
	"business_area_comment" varchar(4000)	 NULL,    -- Business Area Comment is a comment provided by the business area to provide additional context about the proposal. It will include planned activities as part of the funding request.
	"estimated_clwrr_alloc_amount" decimal(15,2) NULL,    -- Estimated CLWRR Allocation Amount is the estimated amount of funds the Crown Land Wildfire Risk Reduction program will provide
	"total_cost_estimate_amount" decimal(15,2) NULL DEFAULT 0,    -- Total Cost Estimate Amount is the total amount that is estimated to complete the project.  The business area will like make a funding request to match the total cost estimate, but they can make a funding request for more or for less then the estimated amount.
	"cfs_project_code" varchar(25)	 NULL,    -- CFS Project Code is a project code that originates in the Corporate Accounting System (CAS) to idenfity CFS projects.  CFS stands for FireSmart Community Funding and Supports   Project Codes are 7 characters in length and can be alpha-numeric.  The Corporate Accounting System (CAS) uses an Account Code Combination to track transactions which includes project.   The ACC is composed of:  	- Client: Reporting Entity   	- Responsibility Centre: Organization unit of the reporting entity that is accountable for the business program or service being delivered. 	- Service Line: Business program or service being delivered. 	- STOB: (Standard Object of Expense) Classification by account type (asset, liability, equity, revenue, or expense)  Project: A detailed identifier allowing and organization unit to capture project or other detailed information
	"fiscal_funding_request_amount" decimal(15,2) NULL,    -- Fiscal Funding Request Amount is the dollar amount requested to fund the completion of the proposed project activities for the fiscal year.
	"fiscal_funding_alloc_rationale" varchar(4000)	 NULL,    -- Fiscal Funding Allocation Rationale allows for a rationale to be provided for a funding allocation request.
	"fiscal_allocated_amount" decimal(15,2) NULL,    -- Fiscal Allocated Amount is the total budget that has been allocated to the project for the specified fiscal year.
	"fiscal_ancillary_fund_amount" decimal(15,2) NULL,    -- Fiscal Ancillary Funding Amount is the amount of dollars that will be funded by an ancillary funding source.
	"fiscal_planned_project_size_ha" decimal(15,4) NULL DEFAULT 0,    -- Fiscal Planned Project Size Ha is the total land size in hectares that are planned to be treated by the project for the fiscal year.
	"fiscal_planned_cost_per_ha_amt" decimal(15,2) NULL DEFAULT 0,    -- Fiscal Planned Cost Per Hectare Amount is the planned cost per hectare for the project in the current fiscal year It is calculated as NVL(Fiscal Allocated Amount, Fiscal Funding Request Amount) divided by Fiscal Planned Project Size HA.
	"fiscal_reported_spend_amount" decimal(15,2) NULL DEFAULT 0,    -- Fiscal Reported Spend Amount is the total amount the business area has reported as spent on the project for the fiscal year.  The business area needs to be able to forecast the actuals spent since there is a lag from when actuals are recorded in CFS.  For example, the business area may know that a supplier has submitted an invoice for x amount of dollars, but that invoice may take a few weeks to be processed in CFS. The business area can report what money they know has been spent in advance of it being recorded in CFS.
	"fiscal_actual_amount" decimal(15,2) NULL DEFAULT 0,    -- Fiscal Actual Amount is the total amount actually spent on the project for the fiscal year.
	"fiscal_completed_size_ha" decimal(15,4) NULL,    -- Fiscal Completed Size Ha is the sum of hectares for completed activities for the fiscal year.
	"fiscal_actual_cost_per_ha_amt" decimal(15,2) NULL DEFAULT 0,    -- Fiscal Actual Cost Per Hectare Amount is the cost per hectare for the proposal project for the fiscal year. It is calculated as Fiscal Actual Amount divided by Fiscal Actual Project Size Ha.
	"first_nations_deliv_part_ind" boolean NOT NULL DEFAULT 'N',    -- First Nations Delivery Partnership Ind indicates whether the First Nations are part of a co-delivery partnership (Y) or not (N).
	"first_nations_engagement_ind" boolean NOT NULL DEFAULT 'N',    -- First Nations Engagement Ind indicates whether there is First Nations engagement with the project (Y) or not (N).
	"first_nations_partner" varchar(4000)	 NULL,    -- First Nations Partner is a comma separated list of one or more First Nations who are in partnership to complete the project plan for the fiscal year.
	"other_partner" varchar(4000)	 NULL,    -- Other Partner is a comma separated list of one or more partners (agencies or municipalities) who are in partnership to complete the project plan for the fiscal year.
	"results_number" varchar(50)	 NULL,    -- RESULTS Number is the identifier assigned to the project activity in the RESULTS system if one exists. The field may contain the word NEW to indicate it is a new activity
	"results_opening_id" varchar(25)	 NULL,    -- RESULTS Opening Id is the identifier for an Opening in the RESULTS system if one exists for the project.
	"results_contact_email" varchar(100)	 NULL,    -- RESULTS Contact Email is the email address that a notification can be submitted to when a project submission is loaded into RESULTS.
	"submitted_by_name" varchar(100)	 NULL,    -- Submitted By Name is the display name of the person who submitted the project plan.
	"submitted_by_user_guid" varchar(32)	 NULL,    -- Submitted By User Guid is the user GUID identifying the person who submitted the project plan  The user guid is stored in this field corresponds to a user authorized in the WebADE platform.
	"submitted_by_user_userid" varchar(100)	 NULL,    -- Submitted By User Userid is the IDIR or BCEID userid of the user that submitted the project plan.
	"submission_timestamp" TIMESTAMP NULL,    -- Submission Timestamp is the date and time the project plan was submitted.
	"endorsement_eval_timestamp" TIMESTAMP NULL,    -- Endorsement Evaluation Timestamp is the date and time the project plan was considered for endorsement.
	"endorser_name" varchar(100)	 NULL,    -- Endorser Name is the display name of the person who is considering the project plan for endorsement.
	"endorser_user_guid" varchar(100)	 NULL,    -- Endorser User Guid is the user GUID identifying the person who is considering the endorsement of the project plan  The user guid is stored in this field corresponds to a user authorized in the WebADE platform.
	"endorser_user_userid" varchar(100)	 NULL,    -- Endorser User Userid is the IDIR or BCEID userid of the user that is considering the endorsement of the project plan.
	"endorsement_timestamp" TIMESTAMP NULL,    -- Endorsement Timestamp records the date and time the plan was endorsed.
	"endorsement_comment" varchar(4000)	 NULL,    -- Endorsement Comment contains comments by the endorser reviewing the Project Fiscal Plan for endorsement.
	"is_approved_ind" boolean NOT NULL DEFAULT 'N',    -- Is Approved Ind indicates whether the project plan for the fiscal year is approved (Y) or not (N).   An approved plan has an approved budget and work can begin on the project.
	"approver_name" varchar(100)	 NULL,    -- Approver Name is the name of the person that approved the project plan for the fiscal year.
	"approver_user_guid" varchar(100)	 NULL,
	"approver_user_userid" varchar(100)	 NULL,
	"approved_timestamp" TIMESTAMP NULL,
	"accomplishments_comment" varchar(4000)	 NULL,    -- Accomplishments Comment is used to document the accomplishments, highlights, and general project comments.
	"is_delayed_ind" boolean NOT NULL DEFAULT 'N',    -- Is Delayed Ind indicates whether the project is delayed for the Fiscal Year (Y) or not (N).
	"delay_rationale" varchar(4000)	 NULL,    -- Delay Rationale is used to provide a rationale for why a project plan has been indicated as being delayed.
	"abandoned_rationale" varchar(4000)	 NULL,    -- Abandoned Rationale is used to store the reason a project was abandoned. When the project has a status of abandoned then the rationale should be provided.
	"last_progress_update_timestamp" TIMESTAMP NULL,    -- Last Progress Update Timestamp records when the last project progress update was reported for the project fiscal year task by the project lead.
	"revision_count" decimal(10) NOT NULL DEFAULT 0,    -- REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.
	"create_user" varchar(64)	 NOT NULL,    -- CREATE_USER is an audit column that indicates the user that created the record.
	"create_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,    -- CREATE_DATE is the date and time the row of data was created.
	"update_user" varchar(64)	 NOT NULL,    -- UPDATE_USER is an audit column that indicates the user that updated the record.
	"update_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP    -- UPDATE_DATE is the date and time the row of data was updated.
)
TABLESPACE	PG_DEFAULT
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE "wfprev"."project_plan_fiscal"
	IS 'Project Plan Fiscal is used to store a plan for the work to be done in a fiscal year for the project. '
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."project_plan_fiscal_guid"
	IS 'project_plan_fiscal_guid is a unique identifier for the record.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."project_guid"
	IS 'project_guid: Is a foreign key to project: Project is used to track Prevention Projects which are created to reduce risks due to forest fires. '
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."activity_category_code"
	IS 'activity_category_code: Is a foreign key to activity_category_code: Activity Category Code is the set of activity categories that may be performed for a project.   Values are:  	- Tactical Planning 	- Prescription Development 	- Maintenance - Survey 	- Maintenance - Operational Treatment 	- Other (Assessments/Surveys) 	- Other (Administration) 	- Integrated Fuel Management Planning.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_year"
	IS 'Fiscal Year is the fiscal year the project proposal is being submitted for.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."ancillary_funding_source_guid"
	IS 'ancillary_funding_source_guid: Is a foreign key to ancillary_funding_source: Ancillary Funding Source is a list of ancillary funding providers who may provide additional funds on top of what is provided by a primary funding provider to complete a treatment.  Example Funding Sources:  	- BCP - BC Parks 	- CFS - FireSmart Community Funding Supports   	- CLWRR - Crown Land Wildfire Risk Reduction 	- Community Resiliency Investment   	- FEP - Forest Employment Program 	- FESBC - Forest Enhancement Society of BC 	- ER - Ecosytem Restoration   	- Forest District Org Unit'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."project_plan_status_code"
	IS 'project_plan_status_code: Is a foreign key to project_plan_status_code: Project Plan Status Code is the status of a prevention project plan for a fiscal year. Values are:  	- Active 	- Deleted 	- Archived'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."plan_fiscal_status_code"
	IS 'plan_fiscal_status_code: Is a foreign key to plan_fiscal_status_code: Plan Fiscal Status Code is the set of statuses a project plan may transition through. Values are:  	- Draft 	- Proposed 	- In Preparation 	- In Progress 	- Complete 	- Abandoned'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorsement_code"
	IS 'endorsement_code: Is a foreign key to endorsement_code: Endorsement Code is a list of codes used to track whether a project is not endorsed, endorsed, or requires follow-up work.  Values are:  	- Not Endorsed 	- Endorsed 	- Follow-Up Required'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."project_fiscal_name"
	IS 'Project Fiscal Name is a short descriptor for a CAS Project for the fiscal year.  Examples include: * 26WRR FM - West Arm PP TU 3 Integrated Fuel Management Planning'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."project_fiscal_description"
	IS 'Project Fiscal Description is a description of the project proposal for the fiscal year. '
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."business_area_comment"
	IS 'Business Area Comment is a comment provided by the business area to provide additional context about the proposal. It will include planned activities as part of the funding request.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."estimated_clwrr_alloc_amount"
	IS 'Estimated CLWRR Allocation Amount is the estimated amount of funds the Crown Land Wildfire Risk Reduction program will provide'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."total_cost_estimate_amount"
	IS 'Total Cost Estimate Amount is the total amount that is estimated to complete the project.  The business area will like make a funding request to match the total cost estimate, but they can make a funding request for more or for less then the estimated amount.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."cfs_project_code"
	IS 'CFS Project Code is a project code that originates in the Corporate Accounting System (CAS) to idenfity CFS projects.  CFS stands for FireSmart Community Funding and Supports   Project Codes are 7 characters in length and can be alpha-numeric.  The Corporate Accounting System (CAS) uses an Account Code Combination to track transactions which includes project.   The ACC is composed of:  	- Client: Reporting Entity   	- Responsibility Centre: Organization unit of the reporting entity that is accountable for the business program or service being delivered. 	- Service Line: Business program or service being delivered. 	- STOB: (Standard Object of Expense) Classification by account type (asset, liability, equity, revenue, or expense)  Project: A detailed identifier allowing and organization unit to capture project or other detailed information'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_funding_request_amount"
	IS 'Fiscal Funding Request Amount is the dollar amount requested to fund the completion of the proposed project activities for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_funding_alloc_rationale"
	IS 'Fiscal Funding Allocation Rationale allows for a rationale to be provided for a funding allocation request.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_allocated_amount"
	IS 'Fiscal Allocated Amount is the total budget that has been allocated to the project for the specified fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_ancillary_fund_amount"
	IS 'Fiscal Ancillary Funding Amount is the amount of dollars that will be funded by an ancillary funding source.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_planned_project_size_ha"
	IS 'Fiscal Planned Project Size Ha is the total land size in hectares that are planned to be treated by the project for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_planned_cost_per_ha_amt"
	IS 'Fiscal Planned Cost Per Hectare Amount is the planned cost per hectare for the project in the current fiscal year It is calculated as NVL(Fiscal Allocated Amount, Fiscal Funding Request Amount) divided by Fiscal Planned Project Size HA.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_reported_spend_amount"
	IS 'Fiscal Reported Spend Amount is the total amount the business area has reported as spent on the project for the fiscal year.  The business area needs to be able to forecast the actuals spent since there is a lag from when actuals are recorded in CFS.  For example, the business area may know that a supplier has submitted an invoice for x amount of dollars, but that invoice may take a few weeks to be processed in CFS. The business area can report what money they know has been spent in advance of it being recorded in CFS.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_actual_amount"
	IS 'Fiscal Actual Amount is the total amount actually spent on the project for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_completed_size_ha"
	IS 'Fiscal Completed Size Ha is the sum of hectares for completed activities for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."fiscal_actual_cost_per_ha_amt"
	IS 'Fiscal Actual Cost Per Hectare Amount is the cost per hectare for the proposal project for the fiscal year. It is calculated as Fiscal Actual Amount divided by Fiscal Actual Project Size Ha.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."first_nations_deliv_part_ind"
	IS 'First Nations Delivery Partnership Ind indicates whether the First Nations are part of a co-delivery partnership (Y) or not (N).'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."first_nations_engagement_ind"
	IS 'First Nations Engagement Ind indicates whether there is First Nations engagement with the project (Y) or not (N).'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."first_nations_partner"
	IS 'First Nations Partner is a comma separated list of one or more First Nations who are in partnership to complete the project plan for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."other_partner"
	IS 'Other Partner is a comma separated list of one or more partners (agencies or municipalities) who are in partnership to complete the project plan for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."results_number"
	IS 'RESULTS Number is the identifier assigned to the project activity in the RESULTS system if one exists. The field may contain the word NEW to indicate it is a new activity'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."results_opening_id"
	IS 'RESULTS Opening Id is the identifier for an Opening in the RESULTS system if one exists for the project.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."results_contact_email"
	IS 'RESULTS Contact Email is the email address that a notification can be submitted to when a project submission is loaded into RESULTS.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."submitted_by_name"
	IS 'Submitted By Name is the display name of the person who submitted the project plan.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."submitted_by_user_guid"
	IS 'Submitted By User Guid is the user GUID identifying the person who submitted the project plan  The user guid is stored in this field corresponds to a user authorized in the WebADE platform.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."submitted_by_user_userid"
	IS 'Submitted By User Userid is the IDIR or BCEID userid of the user that submitted the project plan.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."submission_timestamp"
	IS 'Submission Timestamp is the date and time the project plan was submitted.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorsement_eval_timestamp"
	IS 'Endorsement Evaluation Timestamp is the date and time the project plan was considered for endorsement.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorser_name"
	IS 'Endorser Name is the display name of the person who is considering the project plan for endorsement.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorser_user_guid"
	IS 'Endorser User Guid is the user GUID identifying the person who is considering the endorsement of the project plan  The user guid is stored in this field corresponds to a user authorized in the WebADE platform.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorser_user_userid"
	IS 'Endorser User Userid is the IDIR or BCEID userid of the user that is considering the endorsement of the project plan.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorsement_timestamp"
	IS 'Endorsement Timestamp records the date and time the plan was endorsed.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."endorsement_comment"
	IS 'Endorsement Comment contains comments by the endorser reviewing the Project Fiscal Plan for endorsement.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."is_approved_ind"
	IS 'Is Approved Ind indicates whether the project plan for the fiscal year is approved (Y) or not (N).   An approved plan has an approved budget and work can begin on the project.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."approver_name"
	IS 'Approver Name is the name of the person that approved the project plan for the fiscal year.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."accomplishments_comment"
	IS 'Accomplishments Comment is used to document the accomplishments, highlights, and general project comments.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."is_delayed_ind"
	IS 'Is Delayed Ind indicates whether the project is delayed for the Fiscal Year (Y) or not (N).'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."delay_rationale"
	IS 'Delay Rationale is used to provide a rationale for why a project plan has been indicated as being delayed.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."abandoned_rationale"
	IS 'Abandoned Rationale is used to store the reason a project was abandoned. When the project has a status of abandoned then the rationale should be provided.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."last_progress_update_timestamp"
	IS 'Last Progress Update Timestamp records when the last project progress update was reported for the project fiscal year task by the project lead.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."revision_count"
	IS 'REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."create_user"
	IS 'CREATE_USER is an audit column that indicates the user that created the record.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."create_date"
	IS 'CREATE_DATE is the date and time the row of data was created.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."update_user"
	IS 'UPDATE_USER is an audit column that indicates the user that updated the record.'
;

COMMENT ON COLUMN "wfprev"."project_plan_fiscal"."update_date"
	IS 'UPDATE_DATE is the date and time the row of data was updated.'
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_pk"
	PRIMARY KEY ("project_plan_fiscal_guid")
;

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_uk" UNIQUE ("project_guid","activity_category_code","fiscal_year")
;

CREATE INDEX "prjpfy_afsrc_idx" ON "wfprev"."project_plan_fiscal" ("ancillary_funding_source_guid" ASC)
;

CREATE INDEX "prjpfy_prjct_idx" ON "wfprev"."project_plan_fiscal" ("project_guid" ASC)
;

CREATE INDEX "prjpfy_ppscd_idx" ON "wfprev"."project_plan_fiscal" ("project_plan_status_code" ASC)
;

CREATE INDEX "prjpfy_actcatcd_idx" ON "wfprev"."project_plan_fiscal" ("activity_category_code" ASC)
;

CREATE INDEX "prjpfy_pfystcd_idx" ON "wfprev"."project_plan_fiscal" ("plan_fiscal_status_code" ASC)
;

CREATE INDEX "prjpfy_endcd_idx" ON "wfprev"."project_plan_fiscal" ("endorsement_code" ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_afsrc_fk"
	FOREIGN KEY ("ancillary_funding_source_guid") REFERENCES "wfprev"."ancillary_funding_source" ("ancillary_funding_source_guid") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_prjct_fk"
	FOREIGN KEY ("project_guid") REFERENCES "wfprev"."project" ("project_guid") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_ppscd_fk"
	FOREIGN KEY ("project_plan_status_code") REFERENCES "wfprev"."project_plan_status_code" ("project_plan_status_code") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_actcatcd_fk"
	FOREIGN KEY ("activity_category_code") REFERENCES "wfprev"."activity_category_code" ("activity_category_code") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_pfystcd_fk"
	FOREIGN KEY ("plan_fiscal_status_code") REFERENCES "wfprev"."plan_fiscal_status_code" ("plan_fiscal_status_code") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "wfprev"."project_plan_fiscal" ADD CONSTRAINT "prjpfy_endcd_fk"
	FOREIGN KEY ("endorsement_code") REFERENCES "wfprev"."endorsement_code" ("endorsement_code") ON DELETE No Action ON UPDATE No Action
;