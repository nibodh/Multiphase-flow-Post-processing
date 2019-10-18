function [p,m] = Inv_cenline(data,samples,StatX1,jet,coflow,x_pos1,colour)
% x_pos1 = 7.25; % E = 5, J = 4.5
m = Inv_cenline_info(data,samples,StatX1,jet,coflow,x_pos1,10.1) % E = 11, J = 10.1
Xplot = StatX1(1,:);
Yplot = (jet-coflow)./((data(1,:,ceil(size(data,3)/2),...
    ceil(size(data,4)/2))./double(samples))-coflow);
p = plot(Xplot,Yplot,'LineWidth',0.4,'Color',colour,'linewidth',1.375);
xlim = get(gca,'XLim');
hold on;

StatX1(1,:) = abs(StatX1(1,:)-x_pos1);
[M,n_x] = min(StatX1(1,:));

c = Yplot(n_x) - x_pos1/m;
plot([xlim(1) xlim(2)],[c+xlim(1)/m c+xlim(2)/m],'--', 'Color',colour);
set(gca,'fontWeight','bold')
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4]);
title('Inverse Centerline U');
xlabel('x');
ylabel('1/U_c');
grid on;