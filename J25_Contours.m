restart_flag = 0;
grid_25(restart_flag);
file_path = 'J25_'
%%%%  read init data
inst_files = {'J25_data_590000.bin'};%,'gas_data_097500.bin'};
for i = 1:length(inst_files)
    gas = read_inst(inst_files{i},nx,ny,nz);
    f = inst_files{i};
    file_num = str2double(f(end-9:end-4));
    cross_stream(gas,1,FLT,2,X1,5,Y,Z,20,file_path,file_num)
    
    streamwise(gas,1,FLT,2,X1,Y1,Z,0,20,file_path,file_num)
    
% % % % %%%    visu_inst(gas,1,inst_files{i},x(:,1)./D,y(:,1)./D,z(:,1)./D)
end

%%%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`statistics
stat_files = {'J25_statistics_590000.bin'};
for i = 1:length(stat_files)
    [samples,gas] = read_stat(stat_files{i},statx,staty,statz);
    assignin('base','samples',samples);
    f = stat_files{i};
    file_num = str2double(f(end-9:end-4));
    cross_stream(gas,samples,FLT,1,StatX1,2,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,2.7,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,3.5,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,4.5,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,5.5,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,7.5,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,8.5,StatY,StatZ,20,file_path,1)    
    cross_stream(gas,samples,FLT,1,StatX1,9.5,StatY,StatZ,20,file_path,1)
    cross_stream(gas,samples,FLT,1,StatX1,10.5,StatY,StatZ,20,file_path,1)    
    
    streamwise(gas,samples,FLT,1,StatX1,StatY1,StatZ,0,20,file_path,1)
    
%%%%     visu_inst(gas,samples,stat_files{i},stat(1,1,:,1),stat(1,:,1,2),stat(:,1,1,3))
end

% 
% %%%%%% using last stat files for R-Half
% xByDar = [1.927,2.7,3,3.5,5.5,8.8,9.6,10.8];
% 
% for i = 1:length(xByDar)
%     xposi(i) = return_index(stat(1,1,:,1),xByDar(i));   %%% index of desire x positions
% end
% xposi
% for i = 1:length(xposi)
%     Uc = gas(1,xposi(i),statyBy2,statzBy2)/double(samples);
%     for j = statyBy2:staty
%         MeanDiff(j-statyBy2+1) = abs(gas(1,xposi(i),j,statzBy2)/double(samples) - 0.5*Uc);
%     end
%         [M,ind] = min(MeanDiff(:));
%         RHalfY(i) = stat(1,ind+statyBy2-1,1,2);
% end
% RHalfY
% RFullY = RHalfY.*2.1
% 
% for i = 1:length(xposi)
%     Uc = gas(1,xposi(i),statyBy2,statzBy2)/double(samples);
%     for k = statzBy2:statz
%         MeanDiff(k-statzBy2+1) = abs(gas(1,xposi(i),statyBy2,k)/double(samples) - 0.5*Uc);
%     end
%         [M,ind] = min(MeanDiff(:));
%         RHalfZ(i) = stat(ind+statzBy2-1,1,1,3);
% end
% RHalfZ
% RFullZ = RHalfZ.*2.1
% 
% for i = 1:length(xposi)
%     Uc = gas(1,xposi(i),statyBy2,statzBy2)/double(samples);
%     for k = statzBy2:statz
%         MeanDiff(k-statzBy2+1) = abs(gas(1,xposi(i),k,k)/double(samples) - 0.5*Uc);
%     end
%         [M,ind] = min(MeanDiff(:));
%         DiagHalf(i) = stat(ind+statzBy2-1,1,1,3);
% end
% DiagHalf
% DiagFull = DiagHalf.*2.1
% 
% % DiagHalf = RHalfY./1.414
% % DiagFull = RFull./1.414
% %%%%%
% for i = 1:length(xByDar)
%     RHalfYposi(i) = return_index(y(:,1)./D,RHalfY(i))-yBy2;   %%% index of desire x positions
%     RHalfZposi(i) = return_index(z(:,1)./D,RHalfZ(i))-zBy2;   %%% index of desire x positions
%     RFullYposi(i) = return_index(y(:,1)./D,RFullY(i))-yBy2;   %%% index of desire x positions
%     RFullZposi(i) = return_index(z(:,1)./D,RFullZ(i))-zBy2;   %%% index of desire x positions
%     DiagHalf(i) = return_index(y(:,1)./D,DiagHalf(i))-yBy2;   %%% index of desire x positions
%     DiagFull(i) = return_index(z(:,1)./D,DiagFull(i))-zBy2;   %%% index of desire x position
% end
% % RHalfYposi
% % RHalfZposi
% % round(RHalfposi./1.414)
% % round(RHalfposi.*2)+1
% % round(RHalfposi.*(2/1.414))
% RHalfYposi
% RHalfZposi
% RFullYposi
% RFullZposi
% DiagHalf
% DiagFull