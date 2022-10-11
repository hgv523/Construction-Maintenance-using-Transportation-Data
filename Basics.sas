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

* proc print; run;

proc univariate plot; run;



proc princomp; 
var
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
run;

proc princomp;
var
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services
;
run;

proc princomp;
var
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
Quarterly_GDP_of_NC
Labor_Force 
Employment 
Unemployment 
UnemploymentRate
CPI_U
Normalized_CPI_U
Monthly_Retail_and_Food_Services
;
run;



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
