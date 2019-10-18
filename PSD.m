function PSD(v,fs,num_window,overlap)
m = mean(v);
v = v - m;

% colorstring = 'kbrmycgmy';
    l = length(v);
    window_preset = l/num_window;
    window_overlapped = window_preset+overlap*0.5*window_preset;
    totalpsd = zeros(floor(window_overlapped/2),1);
    totalfreq = totalpsd;
%     s1 = size(totalfreq)
    %averaging loop
    for ind2 = 1:num_window
        l = window_preset;
        l_overlap = window_overlapped;
        
        if ind2 ~= num_window
            xdfft = fft(v(1+(ind2-1)*l:(ind2*l)+(overlap*0.5*l)));            %fourier transformation
        else
            xdfft = fft(cat(1,v(1+(ind2-1)*l:ind2*l),v(1:overlap*0.5*l)));
        end
        xdfft = abs(xdfft);
%         s2 = size(xdfft)        
        nonavgpsd = (1/(fs*l_overlap))*(xdfft.^2); %power spectral density
        nonavgpsd = nonavgpsd(1:l_overlap/2);
%         s3 = size(nonavgpsd)
        nonavgfreq = (0:l_overlap/2-1)*fs/l;%(2*pi);
        nonavgfreq = nonavgfreq.';
%         s4 = size(nonavgfreq)
        totalpsd = nonavgpsd + totalpsd;
        totalfreq = nonavgfreq + totalfreq;
    end
    psd = totalpsd./ind2;
    freq = totalfreq./ind2;
    loglog(freq,psd,'LineWidth',1.375);
    hold on;
    grid on;
    set(gca,'fontWeight','bold');
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4.5]);
xlabel('Frequency (Hz)');
ylabel('PSD (m^2/s^2 Hz)');
xlim([40 2e6]);
ylim([1e-14 1]);
%     
%     figure(3)
%     loglog(freq,psd,'Color',colorstring(ind),'LineWidth',1.375);
%     hold on;
%     ind2
end
% figure(2)
% set(gca,'fontsize',9,'fontWeight','bold','YTick',[0.001 0.01 0.1 0.2]);
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3]);
% xlabel('Frequency (Hz)');
% ylabel('PSD (m^2/s^2 Hz)');
% %legend('1','2','3','4','5','6','7','8','9','10','11');
% %
% %legend('3','6');
% grid on;
% ylim([0.0011 0.025]);
% xlim([110 560]);
% print -dpng zoompsd_fk.png -r800;
% 
% 
% figure(3)
% set(gca,'fontsize',9,'fontWeight','bold');
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3]);
% legend('5 mm','10 mm','15 mm','20 mm','25 mm','30 mm','200 mm','Location','southwest');
% xlabel('Frequency (Hz)');
% ylabel('PSD (m^2/s^2 Hz)');
% grid on;
% %title('Power Spectral Density')
% ylim([5*10^(-7) 0.05]);
% xlim([15 6000]);
% % hold on;
% % x = [30 250 250 30 30];
% % y = [0.001 0.001 0.2 0.2 0.001]
% % plot(x,y,'g--','Linewidth',2)
% print -dpng PSD_fk.png -r800;
% % %axis([0 5000 0 1000]);