function RMS_cenline(data,samples,StatX1,colour)

plot(StatX1(1,:),sqrt(data(7,:,ceil(size(data,3)/2),...
    ceil(size(data,4)/2))./double(samples) - (data(1,:,ceil(size(data,3)/2),...
    ceil(size(data,4)/2))./double(samples)).^2)./(data(1,:,ceil(size(data,3)/2),...
    ceil(size(data,4)/2))./double(samples)),'LineWidth',0.8,'Color',colour,'linewidth',1.375)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4]);
set(gca,'fontWeight','bold')
title('Centerline u_R_M_S');
xlabel('x');
ylabel('u_R_M_S/U_c');
grid on;