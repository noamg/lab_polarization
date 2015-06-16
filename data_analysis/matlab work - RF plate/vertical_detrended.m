hampErrRel1 = hampErr1./hamp1;
vampErrRel1 = vampErr1./vamp1;
vampErrRel2 = vampErr2./vamp2;

hampN1 = hamp1/hampRef1;
vampN1 = vamp1/vampRef1;
vampN2 = vamp2/vampRef2;
dErrRel1 = 0.05./d1;
dErrRel2 = 0.05./d2;

m = 2.3e-2 %linear fit for horizontal Vs dist squared
mErrRel = 1.7e-4/m;
f = @(x) m*x.^2; %for approx interpolation of horizontal amp vs dist (only barrier effect)

fErr1 = 2*mErrRel*ones(length(d1),1) + dErrRel1;
fErr2 = 2*mErrRel*ones(length(d2),1) + dErrRel2;

vampD1 = vampN1./f(d1);
vampD2 = vampN2./f(d2);

vampErrD1 = (vampErrRel1+fErr1).*vampD1;
vampErrD2 = (vampErrRel2+fErr2).*vampD2;

figure
hold on
title({'Vertical Intensity Vs Plates Distance', 'barrier effect neutralized'},'fontsize',18)
xlabel('distance between plates [cm]','fontsize',18)
ylabel('augmented intensity [AU]','fontsize',18)
h(1) = errorbar(d1,vampD1,vampErrD1,'.');
herrorbar(d1,vampD1,ones(length(d1),1)*0.05,'.')
h(2) = errorbar(d2,vampD2,vampErrD2,'.r');
herrorbar(d2,vampD2,ones(length(d2),1)*0.05,'.r')
legend(h,'data1','data2')
grid('on')