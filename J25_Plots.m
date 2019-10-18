restart_flag = 1;
grid_25(restart_flag);
file_path = 'J25_'
[Circles,numpoints] = axisymm(stat,statyBy2);
% % % % % % %%%%%  Plot Inst velocity
% % % % % % inst_files = {'E25_data_585000.bin'};%,'gas_data_097500.bin'};
% % % % % % for i = 1:length(inst_files)
% % % % % %     gas = read_inst(inst_files{i},nx,ny,nz);
% % % % % %     f = inst_files{i};    
% % % % % %     file_num = str2double(f(end-9:end-4));
% % % % % %     YplotatXZ(gas,1,FLT,3,X1,5,y(:,1)./D,Z,0,file_path,file_num)
% % % % % %     XplotatYZ(gas,1,FLT,2,x(:,1)./D,Y1,-4,Z,0,file_path,file_num)
% % % % % %     end
% % % % % % 
% % % % % % %%%%%   Plot Stat velocity
% % % % % % stat_files = {'E25_statistics_260000.bin','E25_statistics_420000.bin','E25_statistics_585000.bin'};
% % % % % % for i = 1:length(stat_files)
% % % % % %     [samples,gas] = read_stat(stat_files{i},statx,staty,statz);
% % % % % %     f = stat_files{i};
% % % % % %     file_num = str2double(f(end-9:end-4));
% % % % % %     YplotatXZ(gas,samples,FLT,2,StatX1,5,stat(1,:,1,2),StatZ,0,file_path,1)
% % % % % %     XplotatYZ(gas,samples,FLT,1,stat(1,1,:,1),StatY1,-4,StatZ,0,file_path,1)
% % % % % % end

%%%5555 inv celine
cenline_files = {'J25_statistics_420000.bin','J25_statistics_590000.bin','J25_statistics_690000.bin'};
colorstring = 'gbrycgmy';
figure ()
for i = 1:length(cenline_files)
    [samples,gas] = read_stat(cenline_files{i},statx,staty,statz);
%     m2 = Inv_cenline_info(gas,samples,StatX1,U_jet,U_co,8.6,11.3);
%     m1 = Inv_cenline_info(gas,samples,StatX1,U_jet,U_co,6,8.4);
    p(i) = Inv_cenline(gas,samples,StatX1,U_jet,U_co,colorstring(i));
    legend_array{i} = num2str(round(samples/FLT));
    hold on;
end
legend(p(:),legend_array,'Location','northwest')
print -dpng J25__Centerline_comparison_1.png -r600 ;

figure ()
% m = Inv_cenline_info(gas,samples,StatX1,U_jet,U_co,5,11);
Inv_cenline(gas,samples,StatX1,U_jet,U_co,colorstring(i))
legend(num2str(round(samples/FLT)),'Location','northwest')
print -dpng J25__Centerline_1.png -r600 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Cenline RMS
figure ()
for i = 1:length(cenline_files)
    [samples,gas] = read_stat(cenline_files{i},statx,staty,statz);
    RMS_cenline(gas,samples,StatX1,colorstring(i))
    legend_array{i} = num2str(round(samples/FLT));
    hold on;
end
legend(legend_array,'Location','northwest')
print -dpng J25__RMS_comparison_1.png -r600 ;

figure ()
RMS_cenline(gas,samples,StatX1,colorstring(i))
legend(num2str(round(samples/FLT)),'Location','northwest')
print -dpng J25__Centerline_RMS_1.png -r600 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stations = x_stations([7 9 11],StatX1);
gas_Mean = (gas(1,stations,:,:)./double(samples));

gas_RMS = (sqrt(gas(7,stations,:,:)./double(samples) - (gas(1,stations,:,:)./double(samples)).^2));

 [Self_Sim_Mean,Self_sim_RHalf,Self_sim_RMS] ...
     = axisymm_sum(gas_Mean,gas_RMS,StatY,StatZ,Circles,numpoints,statyBy2);
len = length(stations);
colorstring = 'kmrgycgmy';
figure()
ind = 1;
for len1 = 1:len
   plot((stat(statzBy2,statyBy2:staty,1,2)-stat(statzBy2,statyBy2,1,2))/stat(statzBy2,statyBy2+Self_sim_RHalf(len1),1,2),...
         (Self_Sim_Mean(len1,1:statyBy2)-U_co)/(Self_Sim_Mean(len1,1)-U_co),...
         'LineWidth',0.5,'Color',colorstring(ind))
   ind = ind+1;
   hold on;
end
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
title('Self Similarity of UxMean');
grid on;
xlabel('R/HalfR');
ylabel('UxMean/Uc');
legend('x/D = 7','x/D = 9','x/D = 11')
print -dpng J25__SelfSimilarity_UxMean_1.png -r600;


figure()
ind = 1;
for len1 = 1:len
   plot((stat(statzBy2,statyBy2:staty,1,2)-stat(statzBy2,statyBy2,1,2))/stat(statzBy2,statyBy2+Self_sim_RHalf(len1),1,2),...
        Self_sim_RMS(len1,1:statyBy2)/(Self_Sim_Mean(len1,1)),'LineWidth',0.5,'Color',colorstring(ind))
   ind = ind+1;
   hold on;
end
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 5]);
title('Self Similarity of UxRMS');
grid on;
xlabel('R/HalfR');
ylabel('UxRMS/Uc');
legend('x/D = 7','x/D = 9','x/D = 11')
print -dpng J25__SelfSimilarity_UxRMS_1.png -r600;

% 
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