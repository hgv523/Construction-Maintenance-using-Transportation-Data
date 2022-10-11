* options nodate nonumber;

data NCDOTset1;
*infile "E:\NCDOT.txt";
infile "NCDOT.txt";

input 
Year
Month $
Gasoline_Gallons
Diesel_Gallons
Kerosene_Gallons
Alternative_Fuels_Gallons
Highway_Fuel_Use
Total_Gallons_ST_Road_Tax
Registration_Fee
Driver_license_Fee
Emission_inspection
Overweight
Title_fee
Trust_Fund_Title_fee
Car_Amount_2020_38_75_Regist
Driver_Amounts_21_5_in_2020
Car_Amounts_16_4_Eimission_fee
Heavy_Vehicle_75
Car_Amounts_52_Title_fee_2020
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services
Ave_Temperature_F
Ave_Precipitation
Ave_Snowfall
Ave_snow_depth
Ave_heating_degree_day
Ave_Cooling_Degree_Day
Hurrican_times_occurred
;

*Using PROC ARIMA to Identify, Estimate, and Forecast;

proc arima data=NCDOTset1;
identify var=	Gasoline_Gallons	nlag=35;
identify var=	Diesel_Gallons	nlag=35;
identify var=	Kerosene_Gallons	nlag=35;
identify var=	Alternative_Fuels_Gallons	nlag=35;
identify var=	Highway_Fuel_Use	nlag=35;
identify var=	Total_Gallons_ST_Road_Tax	nlag=35;
identify var=	Registration_Fee	nlag=35;
identify var=	Driver_license_Fee	nlag=35;
identify var=	Emission_inspection	nlag=35;
identify var=	Overweight	nlag=35;
identify var=	Title_fee	nlag=35;
identify var=	Trust_Fund_Title_fee	nlag=35;
identify var=	Car_Amount_2020_38_75_Regist	nlag=35;
identify var=	Driver_Amounts_21_5_in_2020	nlag=35;
identify var=	Car_Amounts_16_4_Eimission_fee	nlag=35;
identify var=	Heavy_Vehicle_75	nlag=35;
identify var=	Car_Amounts_52_Title_fee_2020	nlag=35;
identify var=	Quarterly_GDP_of_NC	nlag=35;
identify var=	Labor_Force	nlag=35;
identify var=	Employment	nlag=35;
identify var=	Unemployment	nlag=35;
identify var=	UnemploymentRate	nlag=35;
identify var=	CPI_U	nlag=35;
identify var=	Normalized_CPI_U	nlag=35;
identify var=	Monthly_Retail_and_Food_Services	nlag=35;
identify var=	Ave_Temperature_F	nlag=35;
identify var=	Ave_Precipitation	nlag=35;
identify var=	Ave_Snowfall	nlag=35;
*identify var=	Ave_snow_depth	nlag=12;
identify var=	Ave_heating_degree_day	nlag=35;
identify var=	Ave_Cooling_Degree_Day	nlag=35;
identify var=	Hurrican_times_occurred	nlag=35;
run;


/*******************
PROC ARIMA DATA=calfem;
 IDENTIFY VAR=number NLAGS=35;
Run;

******/


