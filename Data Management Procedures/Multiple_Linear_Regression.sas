


PROC IMPORT DATAFILE="C:\Users\Pratik\Desktop\Data Science Learning\Example Datasets\Applied Regression Analysis\Class_Survey.csv"
DBMS=CSV REPLACE OUT=CLASS_SURV;
GETNAMES=YES;
RUN;

ODS GRAPHICS ON;
PROC REG DATA=WORK.CLASS_SURV;
TITLE "MULTIPLE LINEAR REGRESSION";
MODEL GPA = HEIGHT WEIGHT BOOK_COST;
RUN;

