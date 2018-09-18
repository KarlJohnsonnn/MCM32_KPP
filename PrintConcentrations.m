function PrintConcentrations()

close all;
clear all;

%% MCM GAS EXAMPLE
% %
% names = {'T','HCL','SO2','NO3','HO2','O3','NO2','NO','OH'};

% names = {'T','NO2','O3','NO3','HO2','O3','NO2','NO','OH',...
%     'c1ccccc1','c1ccccc1C','c1ccc(O)cc1','c1cc(O)c(O)cc1', ...
%     'c1cccc(O)c1C','c1ccc(O)c(O)c1C','c1ccccc1CO'};


% names = {'c1ccccc1','c1ccccc1C','c1ccc(O)cc1','c1cc(O)c(O)cc1', ...
%     'c1cccc(O)c1C','c1ccc(O)c(O)c1C','c1ccccc1CO','c1ccccc1C=O',...
%     'c1ccccc1C(=O)O','c1cc(O)c(N(=O)=O)cc1','c1ccc(N(=O)=O)c(O)c1C',...
%     'O=C1C=CC(=O)C=C1C','c1c(O)c(N(=O)=O)cc(N(=O)=O)c1',...
%     'c1c(N(=O)=O)cc(N(=O)=O)c(O)c1C','c1c(O)c(O)cc(N(=O)=O)c1'};...
%     'c1cc(N(=O)=O)c(O)c(O)c1C'};

%% KPP INPUT DATA
[fileID, err_msg] = fopen('SpcConc');
% Conc_KPP = textscan(fileID,'%f %f %f %f %f %f %f %f %f ', 'HeaderLines',2);
Names_KPP = textscan(fileID,'%s', 'Delimiter', 't', 'HeaderLines',0);
Names_KPP = Names_KPP{1,1};
Names_KPP = strsplit(Names_KPP{1,1});

Conc_KPP = textscan(fileID,repmat('%f',[1,27]), 'HeaderLines',1);
time_KPP = Conc_KPP{1}/3600.0; 

%% AtCSOL INPUT DATA
nc_path = 'MCM32_full.nc';
time_AtCSol = ncread( nc_path , 'time' );
for iSpc = 2:size(Names_KPP,2)
   %Conc_AtCSol{iSpc} = ncread( nc_path , Names_KPP{iSpc});
end


figure('units','normalized','outerposition',[0 0 1 1]);

% for i = 1:2%size(names,2)-1
    
   subplot(1,2,1);
   plot(time_KPP ,    Conc_KPP{21}(:),  '-', 'LineWidth', 3); hold on;
%    plot(time_AtCSol , Conc_AtCSol{i}(:), '-', 'LineWidth', 3);
   
%    xlim([time_AtCSol(1), time_AtCSol(end)]);
   title(Names_KPP{21});
   xlabel('Time in [h]');
   ylabel('Concentration in [molec/cm3]');
   legend('Concentration KPP', 'Concentration AtCSol');
% end





