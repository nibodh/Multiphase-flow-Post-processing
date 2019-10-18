clear all; clc; clear all;

statx_max = 225; staty_max = 117;
[statx, staty, statz, statyBy2, statzBy2] = gridsize(statx_max,staty_max);

D = 8.6689357E-03;   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55jet dia
U_jet = 56.0; U_co = 0.03*U_jet;

FLT = 16124;
stat = textread('grid_points_statistics.dat');  %%%%%%%%% already non-dim
sc = [1 2 3 4 5];

file_path = 'E25_';

stat = reshape(stat,statz,staty,statx,3);
[StatY,StatZ] = meshgrid(stat(1,:,1,2),stat(:,1,1,3));
[StatX1,StatY1] = meshgrid(stat(1,1,:,1),stat(1,:,1,2));

drop_stat_files = {'668-drop_ffstat_sc_01.dat','668-drop_ffstat_sc_02.dat',...
    '668-drop_ffstat_sc_03.dat','668-drop_ffstat_sc_04.dat','668-drop_ffstat_sc_05.dat'};
colorstring = 'rkbmg';
for i = 1:length(sc)
    drops1 = textread(drop_stat_files{i});
    drops = reshape(drops1,31,31,26,8);
%     figure(1)
%     plot(StatY(1,103:133),drops(:,16,11,2),colorstring(i))
%     hold on;
    figure(2)
    plot(StatY(1,103:133),drops(:,16,11,5),colorstring(i))
    hold on;
%     drops_stat = read_drop_output(drop_stat_files{i},26,31,31);
%     f = drop_stat_files{i};
%     file_num = str2double(f(end-9:end-4));
%     cross_stream(gas,samples,FLT,1,StatX1,2,StatY,StatZ,20,file_path,1)
%     cross_stream(gas,samples,FLT,1,StatX1,2.7,StatY,StatZ,20,file_path,1)
%     cross_stream(gas,samples,FLT,1,StatX1,3.5,StatY,StatZ,20,file_path,1)
%     cross_stream(gas,samples,FLT,1,StatX1,4.5,StatY,StatZ,20,file_path,1)
%     cross_stream(gas,samples,FLT,1,StatX1,5.5,StatY,StatZ,20,file_path,1)
%     cross_stream(gas,samples,FLT,1,StatX1,7.5,StatY,StatZ,20,file_path,1)
%     cross_stream(gas,samples,FLT,1,StatX1,11.5,StatY,StatZ,20,file_path,1)
% %     
% % %     YplotatXZ(gas,samples,FLT,2,StatX1,5,stat(1,:,1,2),StatZ,0,file_path,1)
%     streamwise(gas,samples,FLT,1,StatX1,StatY1,StatZ,0,20,file_path,1)
% %     XplotatYZ(gas,samples,FLT,1,stat(1,1,:,1),StatY1,-4,StatZ,0,file_path,1)
% %     
% %     visu_inst(gas,samples,stat_files{i},stat(1,1,:,1),stat(1,:,1,2),stat(:,1,1,3))
end
