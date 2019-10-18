function [Mean,RHalf,RMS] = axisymm_sum(Mean_data,RMS_data,Y,Z,Circles,numpoints,HalfY)

HalfZ = HalfY;

%%%%% Interpolating from the grid to the circles
len = size(Mean_data,2);
for i = 1:len
    U(:,:) = squeeze(Mean_data(1,i,:,:));
    RM(:,:) = squeeze(RMS_data(1,i,:,:));%sqrt(gas(7,stations(i),:,:) - (gas(1,stations(i),:,:)).^2)...
%     size(U);
%     size(RM)
       % ./(gas(1,stations(i),:,:));
    for j = 1:HalfY-1
        InterpMean(i,j,1:numpoints(j)) = interp2(Y,Z,U,Circles(j,1:numpoints(j),1),Circles(j,1:numpoints(j),2));
        InterpRMS(i,j,1:numpoints(j)) = interp2(Y,Z,RM,Circles(j,1:numpoints(j),1),Circles(j,1:numpoints(j),2));
    end
end
%%%%% axi-symmetric summation
SumInterpMean = squeeze(sum(InterpMean,3));
SumInterpRMS = squeeze(sum(InterpRMS,3));

%%%%% dividing summation for Mean
for i = 1:len
    for j = 1:HalfY-1
        Mean1(i,j) = SumInterpMean(i,j)/numpoints(j);
        RMS1(i,j) = SumInterpRMS(i,j)/numpoints(j);
    end
end

%%%%%% adding centreline Mean velocity to the array of axisymmetric means
%%%%%% at respective stations
Mean(1:len,1) = squeeze(Mean_data(1,1:len,HalfY,HalfZ)).';
Mean(:,2:HalfY) = Mean1(:,1:HalfY-1);

RMS(1:len,1) = squeeze(RMS_data(1,1:len,HalfY,HalfZ)).';
RMS(:,2:HalfY) = RMS1(:,1:HalfY-1);

%%%%%% searching for R-Half
for i = 1:len   %  -2 b/c last two don't need r 1/2
    Uc = Mean(i,1);
    for j = 1:HalfY
        MeanDiff(i,j) = abs(Mean(i,j)- 0.5*Uc);  % taking diff with all
    end
    [M,I] = min(MeanDiff(i,:));   % searching for least diff
    RHalf(i) = I;   % the location of the half-velocity
end

