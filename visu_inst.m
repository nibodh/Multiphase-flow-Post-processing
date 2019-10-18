function visu_inst(data,samples,filename,X_increment,Y_increment,Z_increment)

outfile = filename(1:end-4);

fiod = fopen(strcat(outfile,'.tp'),'w');

if samples == 1
    fprintf(fiod,'VARIABLES = "X" "Y" "Z" "density" "ux" "uy" "uz"\n');
else
    fprintf(fiod,'VARIABLES = "X" "Y" "Z" "DensityMean" "UxMean" "UyMean" "UzMean"\n');
end    
fprintf(fiod,'ZONE I=%d,J=%d,K=%d\n',size(data,2),size(data,3),size(data,4));

for k = 1:size(data,4)
    for j = 1:size(data,3)
        for i = 1:size(data,2)
            if samples == 1
                fprintf(fiod,'%f,%f,%f,%f,%f,%f,%f\n',X_increment(i),Y_increment(j),Z_increment(k),...
                    data(1,i,j,k)/double(samples),data(2,i,j,k)/double(samples),data(3,i,j,k)/double(samples),data(4,i,j,k)/double(samples));
            else
                fprintf(fiod,'%f,%f,%f,%f,%f,%f,%f\n',X_increment(i),Y_increment(j),Z_increment(k),...
                    data(4,i,j,k)/double(samples),data(1,i,j,k)/double(samples),data(2,i,j,k)/double(samples),data(3,i,j,k)/double(samples));
            end
        end
    end
end
fclose(fiod);
end