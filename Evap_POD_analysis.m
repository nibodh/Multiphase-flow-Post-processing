clear all; clc;

%%%%%    Evap    Jet      %%%%%
%%%%%% program for time series analysis - lol
simulation = 'E25_'
common_filename = 'gas1_timeseries_data_';
np_timeseries = 64;
stations = 8;
dump_time = 2500;
np_station = np_timeseries/stations;
T1 = 180000; T2 = 742500;
FLT = 16124;
over_FLT = (T2-T1+dump_time)/FLT
fs = 3720169.0648681759;

%%%%%%%%%5 concatenting data into one array
for t = T1:dump_time:T2
    time_step = num2str(t);
    filename = strcat(common_filename,time_step,'.bin');
    V1 = time_series_data_read(filename,np_timeseries);
    if t ~= T1
        V = cat(3,V,V1);
    else
        V = V1;
    end
end
% size(V)

%%%% Centerline points
for i = 1:stations
    Centerline_points(i) = i*np_station-(np_station-1);
    Vertical_points_inner(i) = i*np_station-(np_station-2);
    Radial_points_inner(i) = i*np_station-(np_station-3);
    Horizontal_points_inner(i) = i*np_station-(np_station-4);
    Vertical_points_outer(i) = i*np_station-(np_station-5);
    Radial_points_outer(i) = i*np_station-(np_station-6);
    Horizontal_points_outer(i) = i*np_station-(np_station-7);
    Ambient_points(i) = i*np_station;
    YZ_points(i,:) = (i*np_station-(np_station-1):i*np_station-(np_station-7));
end

xByD = [2 2.7 3 3.5 5.5 8.8 9.6 10.8];
% colorstring = 'kbrmycgmy';
close all;
figure_number = 1;
f = figure_number
for i = 1:8
        figure(f)
eVec(i,:,:) = POD(squeeze(V(1, YZ_points(i,:),:)),15);
title(strcat('E25 u at x = ',num2str(xByD(i))));
print(gcf,strcat(simulation,'POD_',(num2str(f))),'-dpng','-r800')
f = f+1;
end