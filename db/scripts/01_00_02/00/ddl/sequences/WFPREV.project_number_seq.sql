CREATE SEQUENCE "wfprev"."project_number_seq"  INCREMENT BY 1  START WITH 1000  MAXVALUE 9999999999  MINVALUE 1000  NO CYCLE;

GRANT USAGE ON SEQUENCE "wfprev"."project_number_seq" TO PROXY_WF1_PREV_REST;
