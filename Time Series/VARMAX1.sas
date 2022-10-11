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
   model 
    Gasoline_Gallons
    Diesel_Gallons
    Kerosene_Gallons
    Alternative_Fuels_Gallons / p=2 lagmax=6 dftest
                 print=(iarr(3) estimates diagnose)
                 cointtest=(johansen=(iorder=2));
   cointeg rank=1 normalize=Gasoline_Gallons exogeneity;
run;
