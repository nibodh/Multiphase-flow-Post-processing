function p = Read_Chen(value,ind, pos)

if value == 1
Chen(:,:) = csvread('Chen_drplet_Mean.csv',2,0);
else
Chen(:,:) = csvread('Chen_droplets_RMS.csv',2,0);
end

colorstring = 'krbmgcgmy';
pos = 8 - pos*2 + 1
        p = plot(Chen(1:9-floor((7-pos)/3.5),pos),Chen(1:9-floor((7-pos)/3.5),pos+1)./56,'--o','linewidth',1.375,'Color',colorstring(ind))
        ind = ind +1;
        hold on;

if value == 1
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
title('Droplet U at x = 0.5');
grid on;
xlabel('r');
ylabel('U/U_c');
legend('C1','C2','C3','C4');
xlim([0 0.7]);
print -dpng Chen_Droplet_UxMean.png -r600;
else
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
title('Droplet u_R_M_S at x = 0.5');
grid on;
xlabel('r');
xlim([0 0.7]);
ylabel('u_R_M_S/U_c');
legend('C1','C2','C3','C4');
print -dpng Chen_Droplet_UxRMS.png -r600;
end