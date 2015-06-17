hampErrRel1 = hampErr1./hamp1;
vampErrRel1 = vampErr1./vamp1;
vampErrRel2 = vampErr2./vamp2;

hampN1 = hamp1/hampRef1;
vampN1 = vamp1/vampRef1;
vampN2 = vamp2/vampRef2;

figure
hold on
grid('on')
title('Radio Wave Plate - Horizontal Intensity Vs. Distance','fontsize',18)
xlabel('distance [cm]','fontsize',15)
ylabel('intensity (relative to no plate) [AU]','fontsize',15)
h(1) = errorbar(d1,hampN1,hampErrRel1.*hampN1,'.');
herrorbar(d1,hampN1,ones(length(d1),1)*0.05,'.')
h(2) = plot([d1(1) d1(end)],[hampN1(1) hampN1(end)],'r');
legend(h,'data','linear approx for comparison')


HLF = struct; %horizontal linear fit
figure
hold on
[HLF.a, HLF.da, HLF.b, HLF.db, HLF.chi2red] = linearfit(d1.^2,hampN1,hampErrRel1.*hampN1,1);
title('Radio Wave Plate - Horizontal Intensity Vs. Distance^2','fontsize',18)
xlabel('distance^2 [cm^2]','fontsize',15)
ylabel('intensity (relative to no plate) [AU]','fontsize',15)
legend('linear fit','data')
grid('on')
herrorbar(d1.^2,hampN1,2*d1/10,'.')

% H(3) = gca;
% 
% herrorbar(d1.^2,vampN1,2*d1/10,'.')
% H(1)= errorbar(d1.^2,vampN1,vampErrRel1.*hampN1,'.');
% herrorbar(d2.^2,vampN2,2*d2/10,'.r')
% H(2) = errorbar(d2.^2,vampN2,vampErrRel2.*vampN2,'.r');
% legend('off')
% legend(H,'a','b','c')