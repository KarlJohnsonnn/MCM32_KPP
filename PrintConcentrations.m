function PrintConcentrations()

close all;
clear all;

%% KPP INPUT DATA
[fileID, err_msg] = fopen('SpcConc');

DATA_KPP = textscan(fileID,'%s', 'Delimiter', 't', 'HeaderLines',0);


DATA_KPP = DATA_KPP{1,1};
Names_KPP = strsplit(DATA_KPP{1,1});
n_Species = length(Names_KPP)-1;

n_TimeSteps = size(DATA_KPP,1)-2;
VALUES_KPP = zeros(n_TimeSteps,n_Species);

for i = 1:n_TimeSteps
  VALUES_KPP(i,:) = str2num(cell2mat(strsplit(DATA_KPP{i+2,1})'));
end

time_KPP = VALUES_KPP(:,1)/3600.0; 


%% input spezies names

% auf kommentar in .spc datai aufpassen!
[fileID1, err_msg] = fopen('mcm_32_AtCSol_to_KPP.spc');
spc_data = textscan(fileID1,'%s', 'Delimiter', 't', 'HeaderLines',0);
tmp_NAMES = spc_data{1,1};

n_lines = length(tmp_NAMES)-14;
SPC_NAMES = cell(n_lines-14,2);

for i = 1:n_lines
  pos_eq = strfind(tmp_NAMES{14+i,:}, ' = ');
  SPC_NAMES{i,1} = tmp_NAMES{14+i,1}(1:pos_eq-1);
  SPC_NAMES{i,2} = tmp_NAMES{14+i,1}(pos_eq+3:end);
end

% namen zuordnen
for i=2:n_Species
    idx_name = str2num( Names_KPP{1,i}(4:end));
    Names_KPP{1,i} = SPC_NAMES{idx_name,2}; 
end




%% AtCSOL INPUT DATA
nc_path = 'MCM32_full.nc';
time_AtCSol = ncread(nc_path , 'time' );
n_T_AtCSol = length(time_AtCSol);
VALUES_AtCSol = zeros(n_T_AtCSol,n_Species);

for i = 2:size(Names_KPP,2)-1
   VALUES_AtCSol(:,i) = ncread(nc_path , Names_KPP{i});
end


%figure('units','normalized','outerposition',[0 0 1 1]);

for i = 24:26%size(Names_KPP,2)-1
    
   %subplot(1,2,1);
   
   %figure('units','normalized','outerposition',[0 0 1 1]);
   figure;

   plot(time_KPP, VALUES_KPP(:,i), '-', 'LineWidth', 3); hold on;
   plot(time_AtCSol , VALUES_AtCSol(:,i), '-', 'LineWidth', 3);
   
   xlim([time_AtCSol(1), time_AtCSol(end)]);
   title(Names_KPP{i});
   xlabel('Time in [h]');
   ylabel('Concentration in [molec/cm3]');
   legend('Concentration KPP', 'Concentration AtCSol');
end
aaa=5;





