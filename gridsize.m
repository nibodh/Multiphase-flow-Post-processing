function [nx, ny, nz, yBy2, zBy2] = gridsize(nx_max,ny_max)

nx_min = 0; nx = nx_max-nx_min+1;
ny_min = -ny_max; ny = ny_max-ny_min+1;
nz = ny;
yBy2 = ceil(ny/2);
zBy2 = ceil(nz/2);