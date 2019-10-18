restart_flag = 1;
grid_25(restart_flag);

[Circles,numpoints] = axisymm(stat,statyBy2);

%%% plotting inflow

droplet_files = {'668-drop_Mean_RMS_stat_01.dat',...
    '668-drop_Mean_RMS_stat_03.dat','668-drop_Mean_RMS_stat_04.dat'...
    ,'668-drop_Mean_RMS_stat_05.dat'};
len = length(droplet_files);
station = x_stations(0.5,StatX1);
colorstring = 'krbmgcgmy';
% figure(3)
ind = 1;
for len1 = 1:len
    drops1 = textread(droplet_files{len1});
    drops = reshape(drops1,statz,staty,statx,3);
    drop_number = squeeze(drops(:,:,station,1));
    drop_Mean = squeeze(drops(:,:,station,2));
    drop_RMS = squeeze(drops(:,:,station,3));
%     figure (len1)
%     contourf(StatY,StatZ,drop_number,'LineColor','none')
%     axis([-0.6 0.6 -0.6 0.6])
%     contourcbar
%     figure (len1+len)
%     contourf(StatY,StatZ,drop_Mean,'LineColor','none')
%     axis([-0.6 0.6 -0.6 0.6])
%     colormap(jet)
%     contourcbar
    
%     figure(len+len1)
% contourf(StatY,StatZ,drop_number,50);
% [Self_Sim_Drop_Mean,Self_sim_RMS_drop] ...
%      = axisymm_sum_droplets(drop_Mean,drop_RMS,StatY,StatZ,Circles,numpoints,statyBy2);
[Mean_diag,Mean_straight,RMS_diag,RMS_straight] ...
     = axisymm_sum_droplets(drop_Mean,drop_RMS,statyBy2);
%    figure(2*len+1)
%    plot((stat(statzBy2,statyBy2:staty,1,2)-stat(statzBy2,statyBy2,1,2)),...
%          (Self_Sim_Drop_Mean(1:statyBy2)),'LineWidth',0.5,'Color',colorstring(ind))
% grid on;
% a = horzcat((stat(statzBy2,statzBy2+1:statzBy2+15,1,2)-stat(statzBy2,statzBy2+1,1,2)).*sqrt(2.0),...
%     (stat(statzBy2,statzBy2:statzBy2+15,1,2)-stat(statzBy2,statzBy2,1,2)));
% [as,is] = sort(a);
% b = horzcat(Mean_diag(2:16),Mean_straight(1:16));
% plot(as,b(is),'r-',a,b,'x','Color',colorstring(ind));
% hold on;


figure(2*len+2)
grid on;
%    p(len) = plot((stat(statzBy2,statzBy2:statzBy2+15,1,2)-stat(statzBy2,statzBy2,1,2)).*sqrt(2.0),...
%          (Mean_diag(1:16)),'Color',colorstring(ind));
      plot((stat(statzBy2,statzBy2:statzBy2+15,1,2)-stat(statzBy2,statzBy2,1,2)),...
         (Mean_straight(1:16)),'linewidth',1.375,'Color',colorstring(ind))
hold on;
figure(2*len+2)
        p = Read_Chen(1,ind,len1)
   hold on;

% figure(2*len+3)
% grid on;
% c = horzcat((stat(statzBy2,statzBy2+1:statzBy2+15,1,2)-stat(statzBy2,statzBy2+1,1,2)).*sqrt(2.0),...
%     (stat(statzBy2,statzBy2:statzBy2+15,1,2)-stat(statzBy2,statzBy2,1,2)));
% [as,is] = sort(c);
% d = horzcat(RMS_diag(2:16),RMS_straight(1:16));
% plot(as,d(is),'r-',c,d,'x','Color',colorstring(ind));
% hold on;

figure(2*len+4)
grid on;
%    p(len) = plot((stat(statzBy2,statzBy2:statzBy2+15,1,2)-stat(statzBy2,statzBy2,1,2)).*sqrt(2.0),...
%          (Mean_diag(1:16)),'Color',colorstring(ind));
      plot((stat(statzBy2,statzBy2:statzBy2+15,1,2)-stat(statzBy2,statzBy2,1,2)),...
         (RMS_straight(1:16)),'linewidth',1.375,'Color',colorstring(ind))
     hold on;
     figure(2*len+4)
          p = Read_Chen(2,ind,len1)
   ind = ind+1;
   hold on;
end
figure(2*len+2)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
set(gca,'fontWeight','bold')
title('E25 Droplet Comparison at x = 0.5');
grid on;
xlabel('r');
ylabel('U/U_c');
legend('C1',' ','C2',' ','C3',' ','C4',' ');
print -dpng E25_Droplet_UxMean.png -r600;
figure(2*len+4)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
set(gca,'fontWeight','bold')
title('E25 Droplet Comparison at x = 0.5');
grid on;
xlabel('r');
ylabel('u_R_M_S/U_c');
legend('C1',' ','C2',' ','C3',' ','C4',' ','Location','Northwest');
print -dpng E25_Droplet_UxRMS.png -r600;

% colorstring = 'krbgycgmy';
% figure(4)
% % ind = 1;
% % for len1 = 1:len
% %     drops1 = textread(droplet_files{len1});
% %     drops = reshape(drops1,statz,staty,statx,2); 
% %     drop_Mean = squeeze(drops(:,:,station,1));
% %     drop_RMS = squeeze(drops(:,:,station,2));
% % 
% % [Self_Sim_Drop_Mean,Self_sim_RMS_drop] ...
% %      = axisymm_sum_droplets(drop_Mean,drop_RMS,StatY,StatZ,Circles,numpoints,statyBy2);
%  plot((stat(statzBy2,statyBy2:staty,1,2)-stat(statzBy2,statyBy2,1,2)),...
%         Self_sim_RMS_drop(1:statyBy2),'LineWidth',0.5,'Color',colorstring(ind))
%    ind = ind+1;
%    hold on;
% % end
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
% title('Droplet UxRMS at x/D = 0.5');
% grid on;
% xlabel('R');
% ylabel('UxRMS/Uc');
% legend('C1','C2','C3','C4')
% end
% print -dpng E25_Droplet_UxRMS.png -r600;

% % 
% % %%%%%% using last stat files for R-Half
% % xByDar = [1.927,2.7,3,3.5,5.5,8.8,9.6,10.8];
% % 
% % for i = 1:length(xByDar)
% %     xposi(i) = return_index(stat(1,1,:,1),xByDar(i));   %%% index of desire x positions
% % end
% % xposi
% % for i = 1:length(xposi)
% %     Uc = gas(1,xposi(i),statyBy2,statzBy2)/double(samples);
% %     for j = statyBy2:staty
% %         MeanDiff(j-statyBy2+1) = abs(gas(1,xposi(i),j,statzBy2)/double(samples) - 0.5*Uc);
% %     end
% %         [M,ind] = min(MeanDiff(:));
% %         RstatyBy2(i) = stat(1,ind+statyBy2-1,1,2);
% % end
% % RstatyBy2
% % RFullY = RstatyBy2.*2.1
% % 
% % for i = 1:length(xposi)
% %     Uc = gas(1,xposi(i),statyBy2,statzBy2)/double(samples);
% %     for k = statzBy2:statz
% %         MeanDiff(k-statzBy2+1) = abs(gas(1,xposi(i),statyBy2,k)/double(samples) - 0.5*Uc);
% %     end
% %         [M,ind] = min(MeanDiff(:));
% %         RstatzBy2(i) = stat(ind+statzBy2-1,1,1,3);
% % end
% % RstatzBy2
% % RFullZ = RstatzBy2.*2.1
% % 
% % for i = 1:length(xposi)
% %     Uc = gas(1,xposi(i),statyBy2,statzBy2)/double(samples);
% %     for k = statzBy2:statz
% %         MeanDiff(k-statzBy2+1) = abs(gas(1,xposi(i),k,k)/double(samples) - 0.5*Uc);
% %     end
% %         [M,ind] = min(MeanDiff(:));
% %         DiagHalf(i) = stat(ind+statzBy2-1,1,1,3);
% % end
% % DiagHalf
% % DiagFull = DiagHalf.*2.1
% % 
% % % DiagHalf = RstatyBy2./1.414
% % % DiagFull = RFull./1.414
% % %%%%%
% % for i = 1:length(xByDar)
% %     RstatyBy2posi(i) = return_index(y(:,1)./D,RstatyBy2(i))-yBy2;   %%% index of desire x positions
% %     RstatzBy2posi(i) = return_index(z(:,1)./D,RstatzBy2(i))-zBy2;   %%% index of desire x positions
% %     RFullYposi(i) = return_index(y(:,1)./D,RFullY(i))-yBy2;   %%% index of desire x positions
% %     RFullZposi(i) = return_index(z(:,1)./D,RFullZ(i))-zBy2;   %%% index of desire x positions
% %     DiagHalf(i) = return_index(y(:,1)./D,DiagHalf(i))-yBy2;   %%% index of desire x positions
% %     DiagFull(i) = return_index(z(:,1)./D,DiagFull(i))-zBy2;   %%% index of desire x position
% % end
% % % RstatyBy2posi
% % % RstatzBy2posi
% % % round(RHalfposi./1.414)
% % % round(RHalfposi.*2)+1
% % % round(RHalfposi.*(2/1.414))
% % RstatyBy2posi
% % RstatzBy2posi
% % RFullYposi
% % RFullZposi
% % DiagHalf
% % DiagFull