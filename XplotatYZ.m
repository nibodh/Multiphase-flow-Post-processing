function XplotatYZ(data,samples,FLT,value_pos,X,Y,y_pos,Z,z_pos,filename,file_num)

%%%%% determining value
reference_inst = {'Density','U','V','W','Temperature','Pressure',...
    'Energy','Viscosity','Conductivity'};
reference_stat = {'U mean','V mean','W mean','Rho mean','P mean','T mean',...
    'U rms','V rms','W rms','Rho rms','T rms','uv','vw','wu','mass flux',...
    'X momentum flux'};
Z(:,1) = abs(Z(:,1)-z_pos);
[M,n_z] = min(Z(:,1));

Y(:,1) = abs(Y(:,1)-y_pos);
[M,n_y] = min(Y(:,1));

figure()
U = data(value_pos,:,n_y,n_z)./double(samples);

    plot(squeeze(X),squeeze(U))
    
grid on;
if samples == 1
    title([reference_inst{value_pos},' at ',num2str(file_num/FLT),...
        ' FLT y/D = ',num2str(y_pos),' z/D = ',num2str(z_pos)])
    saveas(gcf,strcat(filename,'_',reference_inst{value_pos},'_at_',...
        num2str(ceil(file_num/FLT)),'_FLT_yByD_',num2str(y_pos),'_zByD_',num2str(z_pos)),'png')
else
    title([reference_stat{value_pos},' over ',num2str(samples/FLT),...
        ' FLT y/D = ',num2str(y_pos),' z/D = ',num2str(z_pos)]);
    saveas(gcf,strcat(filename,'_',reference_stat{value_pos},'_over_',...
        num2str(samples/FLT),'_FLT_yByD_',num2str(y_pos),'_zByD_',num2str(z_pos)),'png')
end