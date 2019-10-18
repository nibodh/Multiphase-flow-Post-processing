function streamwise(data,samples,FLT,value_pos,X,Y,Z,z_pos,n,filename,file_num)

%%%%% determining value
reference_inst = {'Density','U','V','W','Temperature','Pressure',...
    'Energy','Viscosity','Conductivity'};
reference_stat = {'U','V mean','W mean','Rho mean','P mean','T mean',...
    'U rms','V rms','W rms','Rho rms','T rms','uv','vw','wu','mass flux',...
    'X momentum flux'};
Z(:,1) = abs(Z(:,1)-z_pos);
[M,n_z] = min(Z(:,1));
figure()
U(:,:) = data(value_pos,:,:,n_z)./double(samples);
contour(X,Y,U.',n)
c_stream = caxis;
caxis([0, c_stream(2)])
contourf(X,Y,U.',linspace(0,c_stream(2),n),'LineColor','none')
colormap(jet)
contourcbar
grid on;
xlabel('x');
ylabel('y');
set(gca,'fontWeight','bold')
if samples == 1
    title([reference_inst{value_pos},' at ',num2str(file_num/FLT),...
        ' FLT z/ = ',num2str(z_pos)])
    saveas(gcf,strcat(filename,'_',reference_inst{value_pos},'_at_',...
        num2str(ceil(file_num/FLT)),'_FLT_zByD_',num2str(z_pos)),'png')
else
    title([reference_stat{value_pos},' over ',num2str(samples/FLT),...
        ' FLT z = ',num2str(z_pos)]);
    saveas(gcf,strcat(filename,'_',reference_stat{value_pos},'_over_',...
        num2str(samples/FLT),'_FLT_zByD_',num2str(ceil(z_pos))),'png')
end