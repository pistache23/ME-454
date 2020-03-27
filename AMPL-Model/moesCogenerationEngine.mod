/*---------------------------------------------------------------------------------------------------------------------------------------
Set the efficienc of the boiler
---------------------------------------------------------------------------------------------------------------------------------------*/
#https://www.ge.com/content/dam/gepower-pgdp/global/en_US/documents/technical/ger/ger-3430g-cogeneration-application-considerations.pdf
param eff_el_CogEng default 0.4082;
param eff_th_CogEng default 0.4636;
#param eff_fumes_CogEng default 0.2432;

/*---------------------------------------------------------------------------------------------------------------------------------------
Set flow rate of natural gas as a function of efficiency
---------------------------------------------------------------------------------------------------------------------------------------*/
let Flowin['Natgas','Cogen'] := Qheatingsupply['Cogen'] / eff_th_CogEng; #+ Qheatingsupply['Cogen']/eff_fumes_CogEng;
let Flowout['Electricity','Cogen']:=Flowin['Natgas','Cogen']*eff_el_CogEng;
	#Flowout['Electricity','Cogen']*mult_t['Cogen',t]= (Qheatingsupply['Cogen']/eff_th_CogEng)*eff_el_CogEng;
