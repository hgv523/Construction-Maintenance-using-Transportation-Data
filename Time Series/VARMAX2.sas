* options nodate nonumber;

data NCDOTset1;
*infile "E:\NCDOT.txt";
infile "NCDOTmy.txt";
 format date monyy.;
   input date :monyy. 
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
  
*roc print; run;

*Using PROC ARIMA to Identify, Estimate, and Forecast;

proc varmax data=NCDOTset1;
   id date interval=month;
   model Gasoline_Gallons
          Diesel_Gallons
           Kerosene_Gallons
/ p=2 dify=(1)
                 print=(decompose(6) impulse=(stderr) estimates diagnose)
                 printform=both lagmax=3;
   causal group1=(Gasoline_Gallons) group2=(Diesel_Gallons Kerosene_Gallons);
   output lead=5;
run;

proc varmax data=NCDOTset1;
   id date interval=month;
   model Diesel_Gallons Kerosene_Gallons = Gasoline_Gallons / p=2 dify=(1) difx=(1) xlag=1 lagmax=3
                      print=(estimates diagnose);
run;
