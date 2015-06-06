%MAllus2 anlysis
M2_deg = M2_deg1;
M2_rErr1 = abs(M2_err1./M2_Amp1);
M2_rErr2 = abs(M2_err2./M2_Amp2);
M2_rErrTot = M2_rErr1+M2_rErr2;

M2_AmpN1 = M2_Amp1/max(M2_Amp1);
M2_errN1 = M2_err1/max(M2_Amp1);
M2_AmpN2 = M2_Amp2/max(M2_Amp2);
M2_errN2 = M2_err2/max(M2_Amp2);

M2_AmpC = (M2_AmpN1+M2_AmpN2)/2;
M2_rErrC = 2^(-1.5)*(M2_rErr2.*M2_AmpN2+M2_rErr1.*M2_AmpN1)./M2_AmpC;

figure
hold on
errorbar(M2_deg,M2_AmpN1,M2_AmpN1.*M2_errN1,'.b')
h{1} = herrorbar(M2_deg,M2_AmpN1,ones(1,length(M2_deg)),'.b');
errorbar(M2_deg,M2_AmpN2,M2_AmpN2.*M2_errN2,'.g')
h{2} = herrorbar(M2_deg,M2_AmpN2,ones(1,length(M2_deg)),'.g');
errorbar(M2_deg,M2_AmpC,M2_AmpC.*M2_rErrC,'.r')
h{3} = herrorbar(M2_deg,M2_AmpC,ones(1,length(M2_deg)),'.r');
set(h{1},'markersize',15)
set(h{2},'markersize',15)
set(h{3},'markersize',15)

ft = fittype( @(a,x) a*cos(pi*x/180).^2);
M2fit = fit(M2_deg,M2_AmpC,ft);
h{4} = plot(M2fit);
set(h{4},'linewidth',2);

xlim([0,90])
xlabel('angle between polarizers [deg]')
ylabel('relative amplitude [AU]')
title('Two Polarizers Malus (lazer)')
legend([h{1}(2);h{2}(2);h{3}(2);h{4}],'data1','data2','combined data','fitted curve')