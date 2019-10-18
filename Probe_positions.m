clc

% xByDar = [1.927,2.7,3,3.5,5.5,8.8,9.6,10.8];
xByDar = [0 0.5 1]

for i = 1:length(xByDar)
    xposi(i) = return_index(x(:,1)./D,xByDar(i));
    rByD = (xByDar(i)+2.5)/5.0;
    shear = 0.3334*(xByDar(i)+2.5)/5.0;
    rposi(i) = return_index(y(:,1)./D,rByD);
    rposiPLUSone(i) =return_index(y(:,1)./D,rByD+0.5*shear);
    rposiMINUSone(i) =return_index(y(:,1)./D,rByD-0.5*shear);
        diagposi(i) = return_index(y(:,1)./D,rByD/(2^0.5));
        diagPLUSposi(i) = return_index(y(:,1)./D,(rByD+0.5*shear)/(2^0.5));
        diagMINUSposi(i) = return_index(y(:,1)./D,(rByD-0.5*shear)/(2^0.5));    
end

xposi
x(xposi(:),1)./D
%rposi-return_index(y(:,1)./D,0)
%y(rposi(:),1)./D
rposiPLUSone-return_index(y(:,1)./D,0)
y(rposiPLUSone(:),1)./D
rposiMINUSone-return_index(y(:,1)./D,0)
y(rposiMINUSone(:),1)./D
%diagposi-return_index(y(:,1)./D,0)
%y(diagposi(:),1)./D
diagPLUSposi-return_index(y(:,1)./D,0)
y(diagPLUSposi(:),1)./D
diagMINUSposi-return_index(y(:,1)./D,0)
y(diagMINUSposi(:),1)./D