

PROC IMPORT DATAFILE="C:\Users\Pratik\Desktop\Data Science Learning\Example Datasets\Applied Regression Analysis\Class_Survey.csv"
DBMS=CSV REPLACE OUT=CLASS_SURV;
GETNAMES=YES;
RUN;

PROC CORR DATA=WORK.CLASS_SURV;
VAR HEIGHT SATM;
RUN;

ODS GRAPHICS ON;
PROC REG DATA=WORK.CLASS_SURV ;
TITLE "SIMPLE LINEAR REGRESSION BETWEEN LATITUDE BY MORTALITY";
MODEL SATM = HEIGHT ;
RUN;
