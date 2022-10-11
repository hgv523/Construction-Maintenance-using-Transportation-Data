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

ods graphics on;

title "Illustration of ODS Graphics";

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / p=2 dftest cointtest;
run;

/*--- Unit Roots in Returns and Model Specification ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / p=2 dftest cointtest;
run;

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / p=2 dftest;
   test const; test ar(1); test ar(2);
run;

/*--- VAR Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1 print=(diagnose);
run;

/*--- VAR CCC GARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=ccc;
run;


/*---  VAR BEKK GARCH Model ---*/

proc varmax data=NCDOTset1 outest=oediagbekk;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=bekk;
run;

/*--- VAR Scalar BEKK GARCH Model ---*/

proc varmax data=NCDOTset1 outest=oediagbekk;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=bekk;
   restrict ach(1)=ach(1,1,1)*I(4), gch(1)=gch(1,1,1)*I(4);
run;

/*--- VAR Diagonal BEKK GARCH Model ---*/

proc varmax data=NCDOTset1 outest=oediagbekk;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons/ noint p=1;
   garch p=1 q=1 form=bekk;
   restrict ach(1)=ach(1)#I(4), gch(1)=gch(1)#I(4);
run;


/*--- VAR DCC GARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc;
run;

/*--- Parsimonious VAR DCC GARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc corrconst=expect;
run;

/*--- VAR DCC EGARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc subform=egarch corrconst=expect;
   nloptions maxit=5000 pall;
run;

/*--- VAR DCC PGARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc subform=pgarch corrconst=expect;
   nloptions maxit=5000 pall;
run;

/*--- VAR DCC QGARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc subform=qgarch corrconst=expect;
   nloptions maxit=5000 pall;
run;

/*--- VAR DCC TGARCH Model ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc subform=tgarch corrconst=expect;
   nloptions maxit=5000 pall;
run;

/*--- Significance Of Some Parameter Estimates ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc subform=pgarch corrconst=expect;
   nloptions maxit=5000 pall;
   test ar(1, 1, 2:4), ar(1, 2, 3), ar(1, 3, 3:4), ar(1, 4, 2:4);
run;

/*--- VAR DCC PGARCH Model w/o Insignificant Parameters ---*/

proc varmax data=NCDOTset1;
   model Gasoline_Gallons Diesel_Gallons Kerosene_Gallons Alternative_Fuels_Gallons / noint p=1;
   garch p=1 q=1 form=dcc subform=pgarch corrconst=expect;
   nloptions maxit=5000 pall;
   restrict ar(1, 1, 2:4), ar(1, 2, 3), ar(1, 3, 3:4), ar(1, 4, 2:4);
run;


