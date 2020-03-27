/*---------------------------------------------------------------------------------------------------------------------------------------
Set the COP of the Two Stage Heat Pump
---------------------------------------------------------------------------------------------------------------------------------------*/
param eff_Carnot := 0.55;
param Delta_T := 5;
param T_lake := 10+273; #Lake is at approximately 10C
param T_heatingmax := 65+273; #Maximum heating temperature is at 65C

param T_source := T_lake - Delta_T;

#We exchange at a maximum temperature of 65C, Delta
param T_sink := T_heatingmax + Delta_T;

#COP
param COP_HP2Stage := (eff_Carnot*T_sink/(T_sink - T_source));

/*---------------------------------------------------------------------------------------------------------------------------------------
Set flow rate of Electriciy as a function of the COP
---------------------------------------------------------------------------------------------------------------------------------------*/
let Flowin['Electricity','HP2stage'] := Qheatingsupply['HP2stage'] / COP_HP2Stage; 

