function V = time_series_data_read(filename,np_time_series)

%%%%%%%%%% program to READ time series data
fiod = fopen(filename,'rb');
fread(fiod,4,'*uint8');  %%%%%%%%% removes first 4 bytes
C = fread(fiod,Inf,'double');
fclose(fiod);
V = reshape(C,3,np_time_series,[]);
% size(V)
end