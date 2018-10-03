function PrintConcentrations()

close all;
clear all;

%% KPP INPUT DATA
[fileID, err_msg] = fopen('SpcConc.KPP');

DATA_KPP = textscan(fileID,'%s', 'Delimiter', 't', 'HeaderLines',0);


DATA_KPP = DATA_KPP{1,1};
Names_KPP = strsplit(DATA_KPP{1,1});
n_Species = length(Names_KPP)-1;

n_TimeSteps = size(DATA_KPP,1)-2;
VALUES_KPP = zeros(n_TimeSteps,n_Species);

for i = 1:n_TimeSteps
  VALUES_KPP(i,:) = cellfun(@str2double, strsplit(DATA_KPP{i+2,1})');
end

time_KPP = VALUES_KPP(:,1)/3600.0; 

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


%% AtCSol INPUT DATA
[fileID, err_msg] = fopen('SpcConc.AtCSol');

DATA_KPP = textscan(fileID,'%s', 'Delimiter', 't', 'HeaderLines',0);


DATA_AtCSol = DATA_KPP{1,1};
Names_AtCSol = strsplit(DATA_AtCSol{1,1});
n_Species = length(Names_AtCSol)-1;


n_TimeSteps = size(DATA_AtCSol,1)-2;
VALUES_AtCSol = zeros(n_TimeSteps,n_Species);


for i = 1:n_TimeSteps
  VALUES_AtCSol(i,:) = cellfun(@str2double, strsplit(DATA_AtCSol{i+2,1})');
end
time_AtCSol = VALUES_AtCSol(:,1)/3600.0;

% sorting names
Names_AtCSol_unsorted = Names_AtCSol;
perm = zeros(n_Species,1);

disp('')
disp('Species List, T=Time')

for i=1:n_Species
  disp(['    ',char(Names_KPP{1,i})])
  for j=1:n_Species
    if strcmp(char(Names_KPP{1,i}),char(Names_AtCSol_unsorted{1,j}))
      Names_AtCSol{1,i} = Names_KPP{1,i};
      perm(i) = j;
      break;
    end
  end
end

for i = 23:23%size(Names_KPP,2)-1
   figure(i,'units','normalized','outerposition',[0 0 1 1]);
   
   plot(time_KPP,     VALUES_KPP(:,i),          '-', 'LineWidth', 3); hold on;
   plot(time_AtCSol , VALUES_AtCSol(:,perm(i)), '-', 'LineWidth', 3);
   
   xlim([time_AtCSol(1), time_AtCSol(end)]);
   title(Names_KPP{i});
   xlabel('Time in [h]');
   ylabel('Concentration in [molec/cm3]');
   legend('Concentration KPP', 'Concentration AtCSol');
   disp('Press a key to exit the program!')  % Press a key here.You can see the message 'Paused: Press any key' in        % the lower left corner of MATLAB window.
   pause;
end






