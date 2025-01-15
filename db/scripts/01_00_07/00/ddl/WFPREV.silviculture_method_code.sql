/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 07-Jan-2025 11:21:46 AM 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Create Tables */

CREATE TABLE "wfprev"."silviculture_method_code"
(
	"silviculture_method_code" varchar(10)	 NOT NULL,    -- silviculture_method_code: Silviculture Method Code is a list of Silviculture methods that can be applied as a treatment activity.  Taken from THE.SILV_METHOD_CODE values are: RBROO	Resistant Bareroot RCOOP	Resistant Copper treated RCTAI	Resistant Container RECCE	Reconnaisance REMOV	Removal REPEL	Repelling Style Protectors RESL	Resloping RESTU	Removing Stump RETEN	Retention ROADS	Roads and Landings RPILE	Roadside Piles RRIP	Ripping Road SBARK	Stem Bark Spraying SCALP	Spot Scalping SCON	Site Construction SCONE	Spot Cone SEEDT	Seed tree SELEC	Selection SEPI	SEPI SHARK	Shark Fin Drag SHEAR	Pruning Shears SHELT	Shelterwood SINCO	Sinocast SINJE	Stem Injection SKID	Skid Roads SLIDE	Slide SMAIN	Site Maintenance SNAG	Snag Falling SNOW	Snow Mobile SNWRM	Snow Removal SPGUN	Spot Gun Application (Liquid) SPOT	Spot Treatment MSM	MSMA Treated Area SPOTS	Spot Seeding (Hand) SPYDR	Spyder STAKE	Staking STUMP	Stump Treatment TABLT	Fertilizer Tablets TCON	Trail Construction TIGHT	Tight Chain TMAIN	Trail Maintenance TRAIL	Planting Trail Preparation TRANS	Transplanted stock TRAP	Trapping TSP	Temporary Sample Plot TUBE	Tube Style Protectors TUBEX	Tubex Tubing UNDER	Understory Burn VEHIC	Vehicle (e.g. tractor spreader or truck spraying) VEXAR	Vexar Tubing VMSFB	Vehicle Mount Sprayer (Fixed Boom) VMSGH	Vehicle Mount Sprayer (Gun & Hose) VMSLI	Vehicle Mounted Slinger VOCOL	Vole Collar WALK	Walkthrough WBAR	Water Bars WFIRE	Wildfire WHIPS	Whips WINDP	Windrow Perimiters Only WINDR	Windrow WING	Winged Tooth Sub-soiler WIPNG	Wiping Application of Herbicide(Vision with a wick) 35MM	35mm Photo 70MM	70 mm Photo ASCAN	Aerial Infra-red Scanning AUGER	Auger BAGS	Gro-max Bags BASL	Basal Spray BDGRM	Bridge Removal BDGRP	Bridge Replacement BERMS	Berms BLADE	Blading BLOCK	Clearcut Block BPACK	Back Pack Application BRIP	Block Ripping BRMAT	Brush Mats BROAD	Broadcast Burn BROOT	Bareroot BRUSH	Brush Saw CABLE	Cable Knockdown CAGES	Cage Style Protectors CCRES	Clearcut with reserves CHAIN	Chain Drag CHEM	Chemical CHOP	Chopping CLEAR	Clearcut CLIMB	Climbing CLVBY	Culvert Bypass CLVRM	Culvert Removal CLVRP	Culvert Replacement CONE	Cone Style Protectors COPPI	Coppice COPPR	Copper Treated Plugs COVER	Cover Crop CROSS	Cross Ditching CROWN	Crowning CRUIS	Cruise CSEED	Cyclone Seeder CTAIN	Container DBARK	Debarking DISC	Disc Trenching DITCH	Ditching DIVFO	Diversionary Food EXCAV	Excavator FBURN	Fall And Burn FCOLL	Fall and Collect FENCE	Fence Style Protectors FILE	File Review FIXED	Fixed Wing FRILL	Notch or Frill Individual Trees FRLTZ	Fertilizing FULL	Full Tree FUNNE	Funnel Trapping FUROW	Furrow Seeder GPS	GPS GRADE	Grading GRANU	Granular Application GRASS	Grass Seeding GRAZE	Grazing GRCOW	Cattle Grazing GROCO	Grow Cone GRSHP	Sheep Grazing GSCAN	Ground Infra-red Scanning GUARD	Fireguard HAND	Hand Site Preparation HANDR	Hand Pulling (Removal) HANDS	Hand Saw HARV	Harvest HELI	Helicopter HYDRO	Hydro-Axe IMCUT	Intermediate cut IMPS	Intensity Measuring Pixels INSL	Insloping ISECT	Insect KNOCK	3 Metre Knock Down LAND	Landings LANDS	Landscape Level LAYOT	Layout LCLIP	Leader Clipping LETHL	Lethal Trap Trees LINE	Lines LRIP	Landing Ripping MACH	Machine MAINT	Maintenance MANCT	Manual Cutting MANGI	Manual Girdling MANSB	Manual Stem Bending MDOWN	Machine Knockdown MEAS	Measurement MESH	Mesh Style Protectors MICRO	Microorganism MOCUT	Motorized Cutting (Handheld) MOGIR	Motorized Girdling (Handheld) MOUND	Mounding MSQ	Mean Stocked Quadrant MULCH	Mulching MULTI	Multi-layered MXPLT	Mixed Stock OUTSL	Outsloping PATCH	Machine Patch Scarification PATCT	Patch cut PBURN	Pile and Burn PHERO	Pheromone Baiting PHOTO	Air Photo Interp PILE	Piling PIXEL	Pixels PLOT	Plots POLE	Extension Pole POPUP	Popup POST	Blade or Strip Post-scarification POWER	Power Saw PRE	Blade or Strip Pre-scarification PREDA	Predator Enhancement PSP	Permanent Sample Plot PUSH	Pushover RAKE	Excavation Raking RANGE	Open Range
	"description" varchar(200)	 NOT NULL,    -- DESCRIPTION is the display quality description of the code value.
	"display_order" decimal(3) NULL,    -- DISPLAY ORDER is to allow non alphabetic sorting e.g. M T W Th F S S.
	"effective_date" DATE NOT NULL DEFAULT CURRENT_DATE,    -- EFFECTIVE_DATE is the date code value becomes effective.
	"expiry_date" DATE NOT NULL DEFAULT '9999-12-31',    -- EXPIRY_DATE is the date code value expires.
	"revision_count" decimal(10) NOT NULL DEFAULT 0,    -- REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.
	"create_user" varchar(64)	 NOT NULL,    -- CREATE_USER is an audit column that indicates the user that created the record.
	"create_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,    -- CREATE_DATE is the date and time the row of data was created.
	"update_user" varchar(64)	 NOT NULL,    -- UPDATE_USER is an audit column that indicates the user that updated the record.
	"update_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP    -- UPDATE_DATE is the date and time the row of data was updated.
)
TABLESPACE	PG_DEFAULT
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE "wfprev"."silviculture_method_code"
	IS 'Silviculture Method Code is a list of Silviculture methods that can be applied as a treatment activity.  Taken from THE.SILV_METHOD_CODE values are: RBROO	Resistant Bareroot RCOOP	Resistant Copper treated RCTAI	Resistant Container RECCE	Reconnaisance REMOV	Removal REPEL	Repelling Style Protectors RESL	Resloping RESTU	Removing Stump RETEN	Retention ROADS	Roads and Landings RPILE	Roadside Piles RRIP	Ripping Road SBARK	Stem Bark Spraying SCALP	Spot Scalping SCON	Site Construction SCONE	Spot Cone SEEDT	Seed tree SELEC	Selection SEPI	SEPI SHARK	Shark Fin Drag SHEAR	Pruning Shears SHELT	Shelterwood SINCO	Sinocast SINJE	Stem Injection SKID	Skid Roads SLIDE	Slide SMAIN	Site Maintenance SNAG	Snag Falling SNOW	Snow Mobile SNWRM	Snow Removal SPGUN	Spot Gun Application (Liquid) SPOT	Spot Treatment MSM	MSMA Treated Area SPOTS	Spot Seeding (Hand) SPYDR	Spyder STAKE	Staking STUMP	Stump Treatment TABLT	Fertilizer Tablets TCON	Trail Construction TIGHT	Tight Chain TMAIN	Trail Maintenance TRAIL	Planting Trail Preparation TRANS	Transplanted stock TRAP	Trapping TSP	Temporary Sample Plot TUBE	Tube Style Protectors TUBEX	Tubex Tubing UNDER	Understory Burn VEHIC	Vehicle (e.g. tractor spreader or truck spraying) VEXAR	Vexar Tubing VMSFB	Vehicle Mount Sprayer (Fixed Boom) VMSGH	Vehicle Mount Sprayer (Gun & Hose) VMSLI	Vehicle Mounted Slinger VOCOL	Vole Collar WALK	Walkthrough WBAR	Water Bars WFIRE	Wildfire WHIPS	Whips WINDP	Windrow Perimiters Only WINDR	Windrow WING	Winged Tooth Sub-soiler WIPNG	Wiping Application of Herbicide(Vision with a wick) 35MM	35mm Photo 70MM	70 mm Photo ASCAN	Aerial Infra-red Scanning AUGER	Auger BAGS	Gro-max Bags BASL	Basal Spray BDGRM	Bridge Removal BDGRP	Bridge Replacement BERMS	Berms BLADE	Blading BLOCK	Clearcut Block BPACK	Back Pack Application BRIP	Block Ripping BRMAT	Brush Mats BROAD	Broadcast Burn BROOT	Bareroot BRUSH	Brush Saw CABLE	Cable Knockdown CAGES	Cage Style Protectors CCRES	Clearcut with reserves CHAIN	Chain Drag CHEM	Chemical CHOP	Chopping CLEAR	Clearcut CLIMB	Climbing CLVBY	Culvert Bypass CLVRM	Culvert Removal CLVRP	Culvert Replacement CONE	Cone Style Protectors COPPI	Coppice COPPR	Copper Treated Plugs COVER	Cover Crop CROSS	Cross Ditching CROWN	Crowning CRUIS	Cruise CSEED	Cyclone Seeder CTAIN	Container DBARK	Debarking DISC	Disc Trenching DITCH	Ditching DIVFO	Diversionary Food EXCAV	Excavator FBURN	Fall And Burn FCOLL	Fall and Collect FENCE	Fence Style Protectors FILE	File Review FIXED	Fixed Wing FRILL	Notch or Frill Individual Trees FRLTZ	Fertilizing FULL	Full Tree FUNNE	Funnel Trapping FUROW	Furrow Seeder GPS	GPS GRADE	Grading GRANU	Granular Application GRASS	Grass Seeding GRAZE	Grazing GRCOW	Cattle Grazing GROCO	Grow Cone GRSHP	Sheep Grazing GSCAN	Ground Infra-red Scanning GUARD	Fireguard HAND	Hand Site Preparation HANDR	Hand Pulling (Removal) HANDS	Hand Saw HARV	Harvest HELI	Helicopter HYDRO	Hydro-Axe IMCUT	Intermediate cut IMPS	Intensity Measuring Pixels INSL	Insloping ISECT	Insect KNOCK	3 Metre Knock Down LAND	Landings LANDS	Landscape Level LAYOT	Layout LCLIP	Leader Clipping LETHL	Lethal Trap Trees LINE	Lines LRIP	Landing Ripping MACH	Machine MAINT	Maintenance MANCT	Manual Cutting MANGI	Manual Girdling MANSB	Manual Stem Bending MDOWN	Machine Knockdown MEAS	Measurement MESH	Mesh Style Protectors MICRO	Microorganism MOCUT	Motorized Cutting (Handheld) MOGIR	Motorized Girdling (Handheld) MOUND	Mounding MSQ	Mean Stocked Quadrant MULCH	Mulching MULTI	Multi-layered MXPLT	Mixed Stock OUTSL	Outsloping PATCH	Machine Patch Scarification PATCT	Patch cut PBURN	Pile and Burn PHERO	Pheromone Baiting PHOTO	Air Photo Interp PILE	Piling PIXEL	Pixels PLOT	Plots POLE	Extension Pole POPUP	Popup POST	Blade or Strip Post-scarification POWER	Power Saw PRE	Blade or Strip Pre-scarification PREDA	Predator Enhancement PSP	Permanent Sample Plot PUSH	Pushover RAKE	Excavation Raking RANGE	Open Range'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."silviculture_method_code"
	IS 'silviculture_method_code: Silviculture Method Code is a list of Silviculture methods that can be applied as a treatment activity.  Taken from THE.SILV_METHOD_CODE values are: RBROO	Resistant Bareroot RCOOP	Resistant Copper treated RCTAI	Resistant Container RECCE	Reconnaisance REMOV	Removal REPEL	Repelling Style Protectors RESL	Resloping RESTU	Removing Stump RETEN	Retention ROADS	Roads and Landings RPILE	Roadside Piles RRIP	Ripping Road SBARK	Stem Bark Spraying SCALP	Spot Scalping SCON	Site Construction SCONE	Spot Cone SEEDT	Seed tree SELEC	Selection SEPI	SEPI SHARK	Shark Fin Drag SHEAR	Pruning Shears SHELT	Shelterwood SINCO	Sinocast SINJE	Stem Injection SKID	Skid Roads SLIDE	Slide SMAIN	Site Maintenance SNAG	Snag Falling SNOW	Snow Mobile SNWRM	Snow Removal SPGUN	Spot Gun Application (Liquid) SPOT	Spot Treatment MSM	MSMA Treated Area SPOTS	Spot Seeding (Hand) SPYDR	Spyder STAKE	Staking STUMP	Stump Treatment TABLT	Fertilizer Tablets TCON	Trail Construction TIGHT	Tight Chain TMAIN	Trail Maintenance TRAIL	Planting Trail Preparation TRANS	Transplanted stock TRAP	Trapping TSP	Temporary Sample Plot TUBE	Tube Style Protectors TUBEX	Tubex Tubing UNDER	Understory Burn VEHIC	Vehicle (e.g. tractor spreader or truck spraying) VEXAR	Vexar Tubing VMSFB	Vehicle Mount Sprayer (Fixed Boom) VMSGH	Vehicle Mount Sprayer (Gun & Hose) VMSLI	Vehicle Mounted Slinger VOCOL	Vole Collar WALK	Walkthrough WBAR	Water Bars WFIRE	Wildfire WHIPS	Whips WINDP	Windrow Perimiters Only WINDR	Windrow WING	Winged Tooth Sub-soiler WIPNG	Wiping Application of Herbicide(Vision with a wick) 35MM	35mm Photo 70MM	70 mm Photo ASCAN	Aerial Infra-red Scanning AUGER	Auger BAGS	Gro-max Bags BASL	Basal Spray BDGRM	Bridge Removal BDGRP	Bridge Replacement BERMS	Berms BLADE	Blading BLOCK	Clearcut Block BPACK	Back Pack Application BRIP	Block Ripping BRMAT	Brush Mats BROAD	Broadcast Burn BROOT	Bareroot BRUSH	Brush Saw CABLE	Cable Knockdown CAGES	Cage Style Protectors CCRES	Clearcut with reserves CHAIN	Chain Drag CHEM	Chemical CHOP	Chopping CLEAR	Clearcut CLIMB	Climbing CLVBY	Culvert Bypass CLVRM	Culvert Removal CLVRP	Culvert Replacement CONE	Cone Style Protectors COPPI	Coppice COPPR	Copper Treated Plugs COVER	Cover Crop CROSS	Cross Ditching CROWN	Crowning CRUIS	Cruise CSEED	Cyclone Seeder CTAIN	Container DBARK	Debarking DISC	Disc Trenching DITCH	Ditching DIVFO	Diversionary Food EXCAV	Excavator FBURN	Fall And Burn FCOLL	Fall and Collect FENCE	Fence Style Protectors FILE	File Review FIXED	Fixed Wing FRILL	Notch or Frill Individual Trees FRLTZ	Fertilizing FULL	Full Tree FUNNE	Funnel Trapping FUROW	Furrow Seeder GPS	GPS GRADE	Grading GRANU	Granular Application GRASS	Grass Seeding GRAZE	Grazing GRCOW	Cattle Grazing GROCO	Grow Cone GRSHP	Sheep Grazing GSCAN	Ground Infra-red Scanning GUARD	Fireguard HAND	Hand Site Preparation HANDR	Hand Pulling (Removal) HANDS	Hand Saw HARV	Harvest HELI	Helicopter HYDRO	Hydro-Axe IMCUT	Intermediate cut IMPS	Intensity Measuring Pixels INSL	Insloping ISECT	Insect KNOCK	3 Metre Knock Down LAND	Landings LANDS	Landscape Level LAYOT	Layout LCLIP	Leader Clipping LETHL	Lethal Trap Trees LINE	Lines LRIP	Landing Ripping MACH	Machine MAINT	Maintenance MANCT	Manual Cutting MANGI	Manual Girdling MANSB	Manual Stem Bending MDOWN	Machine Knockdown MEAS	Measurement MESH	Mesh Style Protectors MICRO	Microorganism MOCUT	Motorized Cutting (Handheld) MOGIR	Motorized Girdling (Handheld) MOUND	Mounding MSQ	Mean Stocked Quadrant MULCH	Mulching MULTI	Multi-layered MXPLT	Mixed Stock OUTSL	Outsloping PATCH	Machine Patch Scarification PATCT	Patch cut PBURN	Pile and Burn PHERO	Pheromone Baiting PHOTO	Air Photo Interp PILE	Piling PIXEL	Pixels PLOT	Plots POLE	Extension Pole POPUP	Popup POST	Blade or Strip Post-scarification POWER	Power Saw PRE	Blade or Strip Pre-scarification PREDA	Predator Enhancement PSP	Permanent Sample Plot PUSH	Pushover RAKE	Excavation Raking RANGE	Open Range'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."description"
	IS 'DESCRIPTION is the display quality description of the code value.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."display_order"
	IS 'DISPLAY ORDER is to allow non alphabetic sorting e.g. M T W Th F S S.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."effective_date"
	IS 'EFFECTIVE_DATE is the date code value becomes effective.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."expiry_date"
	IS 'EXPIRY_DATE is the date code value expires.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."revision_count"
	IS 'REVISION_COUNT is the number of times that the row of data has been changed. The column is used for optimistic locking via application code.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."create_user"
	IS 'CREATE_USER is an audit column that indicates the user that created the record.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."create_date"
	IS 'CREATE_DATE is the date and time the row of data was created.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."update_user"
	IS 'UPDATE_USER is an audit column that indicates the user that updated the record.'
;

COMMENT ON COLUMN "wfprev"."silviculture_method_code"."update_date"
	IS 'UPDATE_DATE is the date and time the row of data was updated.'
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "wfprev"."silviculture_method_code" ADD CONSTRAINT "slvmthdcd_pk"
	PRIMARY KEY ("silviculture_method_code")
;