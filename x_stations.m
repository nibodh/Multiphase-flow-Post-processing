function stations = x_stations(x_pos,StatX1)

for i = 1:length(x_pos)
StatX2(1,:) = abs(StatX1(1,:)-x_pos(i));
[M,stations(i)] = min(StatX2(1,:));
end