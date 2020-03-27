/*---------------------------------------------------------------------------------------------------------------------------------------
Set the COP of the Two Stage Heat Pump
---------------------------------------------------------------------------------------------------------------------------------------*/
param T_lake_mean_HP2stage := 10+273; #Lake is at approximately 10C
param T_heatingmax_HP2stage := 65+273; #Maximum heating temperature is at 65C

param T_source_HP2stage := T_lake_mean_HP2stage - dTmin;

#We exchange at a maximum temperature of 65C, Delta
param T_sink_HP2stage := T_heatingmax_HP2stage + dTmin;

#COP
param COP_HP2Stage := (eff_Carnot*T_sink_HP2stage /(T_sink_HP2stage  - T_source_HP2stage));

/*---------------------------------------------------------------------------------------------------------------------------------------
Set flow rate of Electriciy as a function of the COP
---------------------------------------------------------------------------------------------------------------------------------------*/
let Flowin['Electricity','HP2stage'] := Qheatingsupply['HP2stage'] / COP_HP2Stage; 

