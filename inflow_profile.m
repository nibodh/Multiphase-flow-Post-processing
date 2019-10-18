%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function inflow_profile(filename,ny,nz,Y,Z)

inflow = textread(filename);
inflow = reshape(inflow,nz,ny,3);
figure()
contourf(Y,Z,inflow(:,:,3),15)     %%%% plotting inflow
contourcbar
grid on;
saveas(gcf,'Inflow_contour','png')
figure()
plot(Y(1,:).',inflow(:,ceil(ny/2),3),'linewidth',1.375)
hold on;
grid on;
scatter(Y(1,:).',inflow(:,ceil(ny/2),3))
xlabel('r');
ylabel('U_0');
set(gca,'fontWeight','bold')
saveas(gcf,'Inflow_profile','png')
figure()
plot(sqrt(2)*Y(1,:).',diag(inflow(:,:,3)))
hold on;
grid on;
    scatter(sqrt(2)*Y(1,:).',diag(inflow(:,:,3)))
saveas(gcf,'Inflow_diagonal_profile','png')