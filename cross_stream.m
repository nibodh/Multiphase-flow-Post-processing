function cross_stream(data,samples,FLT,value_pos,X,x_pos,Y,Z,n,filename,file_num)

reference_inst = {'Density','U','V','W','Temperature','Pressure',...
    'Energy','Viscosity','Conductivity'};
reference_stat = {'U','V mean','W mean','Rho mean','P mean','T mean',...
    'U rms','V rms','W rms','Rho rms','T rms','uv','vw','wu','mass flux',...
    'X momentum flux'};

X(1,:) = abs(X(1,:)-x_pos);
[M,n_x] = min(X(1,:));
figure()
U(:,:) = data(value_pos,n_x,:,:)./double(samples);
contour(Y,Z,U,n)
c_stream = caxis;
caxis([0, c_stream(2)])
contourf(Y,Z,U,linspace(0,c_stream(2),n),'LineColor','none')
colormap(jet)
contourcbar
grid on;
xlabel('z');
ylabel('y');
set(gca,'fontWeight','bold')
if samples == 1
    title([reference_inst{value_pos},' at ',num2str(file_num/FLT),...
        ' FLT x/D = ',num2str(x_pos)])
    saveas(gcf,strcat(filename,'_',reference_inst{value_pos},'_at_',...
        num2str(ceil(file_num/FLT)),'_FLT_xByD_',num2str(x_pos)),'png')
else
    title([reference_stat{value_pos},' over ',num2str(samples/FLT),...
        ' FLT x = ',num2str(x_pos)]);
    saveas(gcf,strcat(filename,'_',reference_stat{value_pos},'_over_',...
        num2str(samples/FLT),'_FLT_xByD_',num2str(ceil(x_pos))),'png')
end