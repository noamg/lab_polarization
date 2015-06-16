% v_ampN = (v_amp-min(v_amp))/range(v_amp);
% h_ampN = (h_amp-min(h_amp))/range(h_amp);
v_ampN = v_amp/max(v_amp);
h_ampN = h_amp/max(h_amp);

vErr = 7e-2*v_ampN+1e-2;
hErr = 7e-2*h_ampN+1e-2;
aErr = ones(length(angle),1);

R_S = '((cosd(x)-a*sqrt(1-(sind(x)/a)^2))/(cosd(x)+a*sqrt(1-(sind(x)/a)^2)))^2';
R_P = '((sqrt(1-(sind(x)/a)^2)-a*cosd(x))/(sqrt(1-(sind(x)/a)^2)+a*cosd(x)))^2';

Sft = fittype(R_S);
Pft = fittype(R_P);
fo = fitoptions(Sft);
fo.Lower = 1.0001;
fo.upper = 2;
fo.startPoint = 1.5;

Sfit = fit(angle,v_ampN,Sft,fo);
Pfit = fit(angle,h_ampN,Pft,fo);

figure
hold on
h(1) = errorbar(angle,v_ampN,vErr,'.','markersize',15);
herrorbar(angle,v_ampN,aErr,'.')
h(2) = errorbar(angle,h_ampN,hErr,'.r','markersize',15);
herrorbar(angle,h_ampN,aErr,'.r')
h(3) = plot(Sfit,'--black');
h(4) = plot(Pfit,'-.black');
set(h(3:4),'LineWidth',2)
ylim([-0.05,1.05])
grid('on')
legend('off')
legend(h,'vertical - S','horizontal - P',['fitted - S, n=' num2str(Sfit.a)],['fitted - P, n=' num2str(Pfit.a)],'Location','northwest');
text(10,0.7,['mean refractive index: ' num2str(mean([Sfit.a,Pfit.a]))],'BackgroundColor',[.7 .9 .7],'fontsize',14)
title('Reflection from Dielectric','fontsize',18)
xlabel('angle [deg]','fontsize',16)
ylabel('Intensity [AU]','fontsize',16)
set(gca,'fontsize',14)