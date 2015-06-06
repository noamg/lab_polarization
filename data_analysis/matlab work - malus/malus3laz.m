%MAllus2 anlysis
M3_errN = M3_err/max(M3_Amp);
M3_AmpN = M3_Amp/max(M3_Amp);
figure
subplot(3,1,[1:2])
hold on
errorbar(M3_deg,M3_AmpN,M3_errN,'.')
h{1} = herrorbar(M3_deg,M3_AmpN,ones(1,length(M3_deg)),'.');
set(h{1},'markersize',15)


ft = fittype( @(a,x) a*sin(pi*x/90).^2);
M3fit = fit(M3_deg,M3_AmpN,ft);
h{2} = plot(M3fit);
set(h{2},'linewidth',2,'color','black');

xlim([-1,46])
xlabel('angle between 1st and 2nd polarizers [deg]','fontsize',16)
ylabel('relative intensity [AU]','fontsize',16)
title('Three Polarizers Malus (lazer)','fontsize',20)
legend([h{1}(2);h{2}],'data','fitted curve')

subplot(3,1,3)
plot(M3fit,M3_deg,M3_AmpN,'residuals')
xlabel('residual','fontsize',14)
xlim([-1,46])