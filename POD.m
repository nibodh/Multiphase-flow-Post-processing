function eVec = POD(v,num)

n = size(v,1);
if num > n
    num = n
end
m = length(v);
if m == n
    return
end
U = v.';
me = mean(U);
M = repmat(me',1,m)';
U = U-M;
R=U'*U; % Autocovariance matrix
[eV,D]=eig(R); % solve: eV is eigenvectors, D is eigenvalues in diagonal matrix
[L,I]=sort(diag(D)); % sort eigenvalues in ascending order - I is sorted index vector
for i=1:length(D)
eValue(length(D)+1-i)=L(i); % Eigenvalues sorted in descending order
eVec(:,length(D)+1-i)=eV(:,I(i)); % Eigenvectors sorted in the same order
end;
eValue(length(eValue))=0; % last eigenvalue should be zero
menergy=eValue/sum(eValue); % relative energy associated with mode m
% calculate the i positions
for i=1:num
tmp=U*eVec(:,i); % find mode
phi(:,i)=tmp/norm(tmp); % normalize mode
end;
% size(U)
% D
% size(D)
% eValue
% size(eValue)
% eVec
% size(eVec)
% menergy
% size(menergy)
% figure(1)
%     scatter(1:n,phi(1,1:n),'s','filled','MarkerFaceColor')
%     hold on;
%     plot(1:n,phi(1,1:n),'Color','k')
    
% for ind = 1:7
%     figure(1)
%     scatter(1:7,phi(ind,:),'s','filled','MarkerFaceColor',colorstring(ind))
%     hold on;
% end
% for ind = 1:7
%     figure(1)
%     plot(1:7,phi(ind,:),'Color','k')
% end
% % calculate the first 10 modes
% figure(1)
% legend('5 mm','Location','northeast');
% set(legend,'box','off')
% print -dpng POD_modes.png -r800

scatter(1:num,cumsum(menergy(1:num)),40,'MarkerFaceColor','m');
hold on;
scatter(1:num,menergy(1:num),40,'d','MarkerFaceColor','k');
plot(1:num,cumsum(menergy(1:num)),'--','Color','m','LineWidth',1.375);
plot(1:num,menergy(1:num),'--','Color','k','LineWidth',1.375);
legend('Cumulative','Eigenvalues','Location','east');
set(legend,'box','off')
set(gca,'fontWeight','bold')
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4.5])
title('Normalized Eigenvalues');
grid on;
hold off;
xlim([0 num]);
ylim([0 1.001]);
xlabel('Prominent Modes');
ylabel('Normalized Energy');
% % % figure(3)
% % % scatter(1:10,eValue(1:10));
% % % hold on;
% % % plot(1:10,eValue(1:10));

% for i=1:length(eVec)
% tmp1=U*eVec(:,i); % find mode
% phi1(:,i)=tmp1/norm(tmp1); % normalize mode
% end;
% 
% for ind = 3:size(phi1)+2
%     figure(ind)
%     semilogx(1:length(phi1),phi1(ind-2,:));
% end