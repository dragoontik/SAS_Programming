
/* Running a Matrix Version of the ANOVA Overall Means Model */

/* Step 1 - Initiate PROC IML to define the response variable */
proc iml;
y={
2, 
1,
3,
4,
6,
5};

/* Step 2 - We enter the design matrix, X  for the Overall Means Model */
x={
1,
1,
1,
1,
1,
1};


/* The Following Code Computes the reg coefficients for our ANOVA */
beta=inv(x`*x)*x`*y; 
beta_label={"Beta_0","Beta_1","Beta_2","Beta_3"};
print beta [label="Regression Coefficients"
			rowname=beta_label];
n=nrow(y); 
p=ncol(x); 
j=j(n,n,1);
ss_tot = (y`*y) - (1/n)*(y`*j)*y;
ss_trt = (beta`*(x`*y)) - (1/n)*(y`*j)*y;
ss_error = ss_tot - ss_trt; 
total_df=n-1;
trt_df=p-1;
error_df=n-p; 
MS_trt = ss_trt/(p-1);
MS_error = ss_error / error_df;
F=ms_trt/ms_error; 
 
empty={.}; 
row_label= {"Treatment", "Error", "Total"}; 
col_label={"df" "SS" "MS" "F"}; 
trt_row= trt_df || ss_trt || ms_trt || F; 
error_row= error_df || ss_error || ms_error || empty;
tot_row=total_df || ss_tot || empty || empty; 
aov = trt_row // error_row // tot_row;
print aov [label="ANOVA"
			rowname=row_label
			colname=col_label];
			
			
			
 /* (Optional) Intermediates in the matrix computations */
xprimex=x`*x; print xprimex;
xprimey=x`*y; print xprimey;
xprimexinv=inv(x`*x); print xprimexinv;
check=xprimexinv*xprimex; print check;
SumY2=beta`*(x`*y); print SumY2;
CF=(1/n)*(y`*j)*y; print CF;