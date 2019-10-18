clear all; clc; clear all;

clear all; clc; clear all;
%%%%%%%%%%  E11_unstretched case
nx_max = 245; ny_max = 129;
[nx, ny, nz, yBy2, zBy2] = gridsize(nx_max,ny_max);

statx_max = 225; staty_max = 117;
[statx, staty, statz, statyBy2, statzBy2] = gridsize(statx_max,staty_max);

D = 8.6689357E-03;   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55jet dia
U_jet = 56.0; U_co = 0.03*U_jet;
sc = 5;

FLT = 16124;
samples = 1;
stat = textread('grid_points_statistics.dat');  %%%%%%%%% already non-dim

file_path = '/home/nibodh/Documents/MATLAB/SV-visualization/E25_new/E25_';


stat = reshape(stat,statz,staty,statx,3);
x = textread('pp_XGrid.dat');  x = reshape(x,nx,3);
y = textread('pp_YGrid.dat');  y = reshape(y,ny,3);
z = textread('pp_ZGrid.dat');  z = reshape(z,nz,3);

[StatY,StatZ] = meshgrid(stat(1,:,1,2),stat(:,1,1,3));
[StatX1,StatY1] = meshgrid(stat(1,1,:,1),stat(1,:,1,2));
[Y,Z] = meshgrid(y(:,1)./D,z(:,1)./D);    %%%%% dividing by D to non-dim
[X1,Y1] = meshgrid(x(:,1)./D,y(:,1)./D);

stat_files = {'drop_statistics_570000.bin'};
drops = read_drop_stat(stat_files{1},statx,staty,statz,sc);