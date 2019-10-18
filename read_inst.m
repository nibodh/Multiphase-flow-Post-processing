function gas = read_inst(filename,nx,ny,nz)

fiod = fopen(filename,'rb');
fread(fiod,4,'*uint8');  %%%%%%%%% removes first 4 bytes
C = fread(fiod,Inf,'double');
fclose(fiod);
gas = reshape(C,9,nx,ny,nz);