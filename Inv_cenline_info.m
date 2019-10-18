function slope = Inv_cenline_info(data,samples,StatX1,jet,coflow,x1,x2)

x1_pos_array(1,:) = abs(StatX1(1,:) - x1);
[M1,x1_pos] = min(x1_pos_array(1,:));

x2_pos_array(1,:) = abs(StatX1(1,:) - x2);
[M1,x2_pos] = min(x2_pos_array(1,:));

coef = polyfit(StatX1(1,x1_pos:x2_pos),(jet-coflow)./((data(1,x1_pos:x2_pos,...
    ceil(size(data,3)/2),ceil(size(data,3)/2))./double(samples))-coflow),1);
slope = 1.0/coef(1)