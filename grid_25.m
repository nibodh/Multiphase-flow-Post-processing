function [samples,nx,ny,nz,yBy2,zBy2,statx, staty, statz, statyBy2, statzBy2,D,U_jet,U_co,FLT,stat,x,y,z,StatY,StatZ,StatX1,StatY1,Y,Z,X1,Y1] = grid_25(flag)
close all; clc;
if flag == 0
clear all
flag = 0;
disp 'reading mesh'
elseif flag == 1
    disp 'returning'
    return
end
%%%%%%%%%%  E11_unstretched case

D = 8.6689357E-03;   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55jet dia
assignin('base','D',D);

U_jet = 56.0;
assignin('base','U_jet',U_jet);
    U_co = 0.03*U_jet;
    assignin('base','U_co',U_co);

    nx_max = 245; ny_max = 129;
    statx_max = 225; staty_max = 117;
    FLT = 16124;
    assignin('base','FLT',FLT);

[nx, ny, nz, yBy2, zBy2] = gridsize(nx_max,ny_max);
assignin('base','nx',nx);
assignin('base','ny',ny);
assignin('base','nz',nz);
assignin('base','yBy2',yBy2);
assignin('base','zBy2',zBy2);

[statx, staty, statz, statyBy2, statzBy2] = gridsize(statx_max,staty_max);
assignin('base','statx',statx);
assignin('base','staty',staty);
assignin('base','statz',statz);
assignin('base','statyBy2',statyBy2);
assignin('base','statzBy2',statzBy2);

samples = 1;
assignin('base','samples',samples);

stat = textread('grid_points_statistics.dat');  %%%%%%%%% already non-dim

stat = reshape(stat,statz,staty,statx,3);
assignin('base','stat',stat);

x = textread('pp_XGrid.dat');  x = reshape(x,nx,3);
assignin('base','x',x);

y = textread('pp_YGrid.dat');  y = reshape(y,ny,3);
assignin('base','y',y);

z = textread('pp_ZGrid.dat');  z = reshape(z,nz,3);
assignin('base','z',z);

[StatY,StatZ] = meshgrid(stat(1,:,1,2),stat(:,1,1,3));
assignin('base','StatY',StatY);
assignin('base','StatZ',StatZ);

[StatX1,StatY1] = meshgrid(stat(1,1,:,1),stat(1,:,1,2));
assignin('base','StatX1',StatX1);
assignin('base','StatY1',StatY1);

[Y,Z] = meshgrid(y(:,1)./D,z(:,1)./D);    %%%%% dividing by D to non-dim
assignin('base','Y',Y);
assignin('base','Z',Z);

[X1,Y1] = meshgrid(x(:,1)./D,y(:,1)./D);
assignin('base','X1',X1);
assignin('base','Y1',Y1);

%%%% plotting inflow
if flag == 0
inflow_profile('999-inflow_velocity_profile.dat',ny,nz,Y,Z);
end