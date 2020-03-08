function All_Buildings


%% PREAMBLE
% Course: Modelling and Optimisation of Energy Systems
% Project: Energy demands of the EPFL campus
% Authors: Francesca Belfiore
% Last modified: 18/2-2020
%
% Description: Global Matlab function to RUN to calculate, 
% for all buildings:
% (1) the internal heat gains 
% (2) the building envelope properties (Newton-Raphson)
% (3) the hourly heating demand
% (4) the typical periods (clustering)
% based on the Buildings.m file
%% 

%% Initialisation
clear all
close all
clc
%cd('D:\Desktop\MASTER\Modelling and Optimization of Energy Systems\data');
%% Data import (Buildings.csv)
filename = 'Buildings.csv';
fid = fopen(filename);
format = '%s%f%f%f%f%f';
data = textscan(fid,format,'Headerlines',1,'delimiter',',');
name = data{1,1};
n_build = length(name);
Q_demand_epfl=0;

%% Function call (Buildings.m)
% The following can be deleted or uncommented depending on the organisation
% of your Buildings.m file.

for i = 1:n_build
    building_name = name{i,1};
    Build = Buildings(building_name);
    format2 = '%s%s%f%s%f\n';
    
    fprintf(fid,format2,building_name,',',Build.kth,',',Build.ksun);
    fclose(fid);
    k_sun(i)=Build.ksun;
    k_th(i)=Build.kth;
    Q_(i,:)=Build.demand;
    
    Q_demand_epfl=Q_demand_epfl+Build.demand;
end



figure(1);
stem(1:n_build,k_sun,'*b','Linewidth',2.5);
title('Thermal losses and ventilation coefficient in function of building');
xlabel('Buildings name');
ylabel('k_{sun} [W/m^2/K]');
xticks(1:n_build);
xticklabels({'BI','BS','CE','CH','CM','GC','GR','MA','ME','PH','BC','CO','BP','TCV','IN','ODY','AASG','EL','PO','CRPPhb','MX','BM','DIA','AI'});
figure(2)
stem(1:n_build,k_th,'*k','Linewidth',2.5);
title('Solar radiation coefficient in function of building');
xlabel('Buildings name');
ylabel('k_{th} [W/m^2/K]');
xticks(1:n_build);
xticklabels({'BI','BS','CE','CH','CM','GC','GR','MA','ME','PH','BC','CO','BP','TCV','IN','ODY','AASG','EL','PO','CRPPhb','MX','BM','DIA','AI'});
figure(3)
plot(Q_demand_epfl);
title('Heating demand in function of the time');
xlabel('hours');
ylabel('Heating demand [W]');
hold on 
plot([1 9000],[0 0]);

