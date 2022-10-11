* options nodate nonumber;

data NCDOTset1;
infile "C:\Users\hechu\Desktop\SAS\SASinput.txt";
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
Daily_Dew_Point
Sea_Level_Pressure
Daily_Visibility
Daily_Wind_Speed
Daily_Humidity
;


PROC reg; 
model
Registration_Fee
=
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services / selection = forward;
run;




PROC reg; 
model
Driver_license_Fee
=
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services / selection = forward;
run;

PROC reg; 
model
Emission_inspection
=
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services / selection = forward;
run;


PROC reg; 
model
Overweight
=
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services / selection = forward;
run;


PROC reg; 
model
Title_fee
=
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services / selection = forward;
run;


PROC reg; 
model
Trust_Fund_Title_fee
=
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services / selection = forward;
run;


/*****************************
PROC CANCORR; 
VAR 
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
;
WITH 
Ave_Temperature_F
Ave_Precipitation
Ave_Snowfall
Ave_snow_depth
Ave_heating_degree_day
Ave_Cooling_Degree_Day
Hurrican_times_occurred
Daily_Dew_Point
Sea_Level_Pressure
Daily_Visibility
Daily_Wind_Speed
Daily_Humidity
;
run;

PROC CANCORR; 
VAR 
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services
;
WITH 
Ave_Temperature_F
Ave_Precipitation
Ave_Snowfall
Ave_snow_depth
Ave_heating_degree_day
Ave_Cooling_Degree_Day
Hurrican_times_occurred
Daily_Dew_Point
Sea_Level_Pressure
Daily_Visibility
Daily_Wind_Speed
Daily_Humidity
;
run;
