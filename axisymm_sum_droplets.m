function [Mean_diag,Mean_straight,RMS_diag,RMS_straight] = axisymm_sum_droplets(Mean_data,RMS_data,HalfY)

HalfZ = HalfY;

%%%%% Interpolating from the grid to the circles
    U(1,:,:) = Mean_data(:,:);
    U(2,:,:) = (RMS_data(:,:));
%     size(U)
%     size(RM)
    for i = 1:HalfY-1
        for m = 1:2
         Diag_avg(m,i) = (U(m,HalfY+i,HalfY+i) +...
             U(m,HalfY+i,HalfY-i) + ...
             U(m,HalfY-i,HalfY+i) +...
             U(m,HalfY-i,HalfY-i))/4.0;
         
         Straight_avg(m,i) = (U(m,HalfY,HalfY+i) + ...
             U(m,HalfY+i,HalfY) + ...
             U(m,HalfY,HalfY-i)+...
             U(m,HalfY-i,HalfY))/4.0;
        end
    end
    
    for m = 1
    Straight_avg(m,10)= (U(m,HalfY,HalfY+10) + ...
             U(m,HalfY+10,HalfY) + ...
             U(m,HalfY-10,HalfY))/3.0;
    end
    
    
%     for j = 1:HalfY-1
%         InterpMean(j,1:numpoints(j)) = interp2(Y,Z,U,Circles(j,1:numpoints(j),1),Circles(j,1:numpoints(j),2));
%         InterpRMS(j,1:numpoints(j)) = interp2(Y,Z,RM,Circles(j,1:numpoints(j),1),Circles(j,1:numpoints(j),2));
%     end
%%%%% axi-symmetric summation
% SumInterpMean = squeeze(sum(InterpMean,3));
% SumInterpRMS = squeeze(sum(InterpRMS,3));

% %%%%% dividing summation for Mean
%     for j = 1:HalfY-1
%         Mean1(j) = SumInterpMean(j)/numpoints(j);
%         RMS1(j) = SumInterpRMS(j)/numpoints(j);
%     end

%%%%%% adding centreline Mean velocity to the array of axisymmetric means
%%%%%% at respective stations
% Mean(2:HalfY) = Mean1(1:HalfY-1);
% Mean(1) = Mean_data(HalfY,HalfY).';

Mean_straight(2:HalfY) = Straight_avg(1,:);
Mean_diag(2:HalfY) = Diag_avg(1,:);
Mean_straight(1) = Mean_data(HalfY,HalfY);
% Mean
% 
% RMS(2:HalfY) = RMS1(1:HalfY-1);
% RMS(1) = RMS_data(HalfY,HalfZ).';
RMS_straight(2:HalfY) = Straight_avg(2,:);
RMS_diag(2:HalfY) = Diag_avg(2,:);
RMS_straight(1) = RMS_data(HalfY,HalfY);
% RMS