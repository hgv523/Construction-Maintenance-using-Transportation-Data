* options nodate nonumber;

data NCDOTset1;
infile "E:\Lean & Productivity Research\DOT Proposal\NCDOT 041\SAS Model\Updated\10132020\Raw Data_PCA Cancorr.txt";
input 
Year
Month $
Gasoline_Gallons
Diesel_Gallons
Total_Gallons_ST_Road_Tax
Registration_Fee
Overweight
Title_fee
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
CPI_U
Monthly_Retail_and_Food_Services
Ave_Temperature_F
Ave_heating_degree_day
Ave_Cooling_Degree_Day
;

*Using PROC ARIMA to Identify, Estimate, and Forecast;

proc arima data=NCDOTset1 plots(only)=series(acf);
	identify var=Gasoline_Gallons center outcov=cov;
	estimate p=1 dftest noint;
	forecast lead=5;
quit;
PROC PRINT DATA=COV; RUN;

proc arima data=NCDOTset1 plots(only)=series(acf);
	identify var=Title_fee center outcov=cov;
	estimate p=1 noint;
	forecast lead=5;
quit;

*Using PROC ARIMA to Get Iterations for Parameter Estimates CLS METHOD;

proc arima data=NCDOTset1;
identify var=Heavy_Vehicle_75 noprint;
estimate p=1 dftest method = uls outest=outuls printall;run;
RUN;

proc arima data=NCDOTset1;
identify var=Driver_Amounts_21_5_in_2020 noprint;
estimate p=1 method = uls outest=outuls printall;run;
RUN;

* Using the IDENTIFY Statement for FUNDING Series;

proc arima data=NCDOTset1;
identify var=Registration_Fee nlag=10;
identify var=Driver_license_Fee nlag=10;
identify var=Emission_inspection nlag=10;
identify var=Overweight nlag=10;
identify var=Trust_Fund_Title_fee nlag=10;
run;






