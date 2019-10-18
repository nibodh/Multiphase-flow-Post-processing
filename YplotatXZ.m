function YplotatXZ(data,samples,FLT,value_pos,X,x_pos,Y,Z,z_pos,filename,file_num)

reference_inst = {'Density','U','V','W','Temperature','Pressure',...
    'Energy','Viscosity','Conductivity'};
reference_stat = {'U mean','V mean','W mean','Rho mean','P mean','T mean',...
    'U rms','V rms','W rms','Rho rms','T rms','uv','vw','wu','mass flux',...
    'X momentum flux'};

X(1,:) = abs(X(1,:)-x_pos);
[M,n_x] = min(X(1,:));

Z(:,1) = abs(Z(:,1)-z_pos);
[M,n_z] = min(Z(:,1));

figure()
U = data(value_pos,n_x,:,n_z)./double(samples);

        plot(squeeze(U),squeeze(Y))

grid on;
if samples == 1
    title([reference_inst{value_pos},' at ',num2str(file_num/FLT),...
        ' FLT x/D = ',num2str(x_pos),' and z/D = ',num2str(z_pos)])
    saveas(gcf,strcat(filename,'_',reference_inst{value_pos},'_at_',...
        num2str(ceil(file_num/FLT)),'_FLT_xByD_',num2str(x_pos),'and_zByD_',num2str(z_pos)),'png')
else
    title([reference_stat{value_pos},' over ',num2str(samples/FLT),...
        ' FLT x/D = ',num2str(x_pos),' and z/D = ',num2str(z_pos)]);
    saveas(gcf,strcat(filename,'_',reference_stat{value_pos},'_over_',...
        num2str(samples/FLT),'_FLT_xByD_',num2str(x_pos),'and_zByD_',num2str(z_pos)),'png')
end