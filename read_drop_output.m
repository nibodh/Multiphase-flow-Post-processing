function gas_stat = read_drop_output(filename,statx,staty,statz)

fiod = fopen(filename);
gas_stat = fread(fiod,Inf);
size(gas_stat)
fclose(fiod);
% length(C)/(31*31*26)
% gas_stat = reshape(C,statx,staty,statz);