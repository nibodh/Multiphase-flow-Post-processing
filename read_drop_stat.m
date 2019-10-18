function [samples, gas_stat] = read_stat(filename,statx,staty,statz)

fiod = fopen(filename,'rb');
fread(fiod,4,'*uint8');  %%%%%%%%% removes first 4 bytes
samples = fread(fiod,1,'*uint32');
C = fread(fiod,Inf,'double');
fclose(fiod);
gas_stat = reshape(C,20,statx,staty,statz);