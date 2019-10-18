function [Circles,numpoints] = axisymm(statgrid,HalfY)

%%%%%%%%%%%%%% to generate axisymm points along circles
HalfZ = HalfY;
%%%%%%%%%%% creating circles of increasing radii along Y or Z for angular
%%%%%%%%%%% summation 
    for j = 1:HalfY-1
        R = statgrid(HalfZ,j+HalfY,1,2) - statgrid(HalfZ,HalfY,1,2);
        Theta = asin((statgrid(HalfZ+1,j+HalfY,1,3)-statgrid(HalfZ,j+HalfY,1,3))/R);
        Theta = Theta;
        Theta1 = 0;
        h = statgrid(HalfZ,HalfY,1,2); k = statgrid(HalfZ,HalfY,1,3);
        c = 1;
        while Theta1 < 2*pi
            xcoord = h + R*cos(Theta1);
            ycoord = k + R*sin(Theta1);
            if abs(xcoord) > 0.00033 || abs(ycoord) > 0.00033
            Circles(j,c,1) = xcoord;% - pi/N);
            Circles(j,c,2) = ycoord;% - pi/N);
            c = c+1;
            Theta1 = Theta1 + Theta;
            end
        end
        numpoints(j) = c-1; %%%%%%%%%%%  %number of points
    end
    
%     figure()
%     for j = 1:HalfY-1
%     Circle(:,:) = Circles(j,:,:);
%         plot(Circle(:,1),Circle(:,2))
%         hold on;
%     end