m = 20;
lambda0 = 2.85e-2;
syms theta
RL = asin(1/10); %relevant azimuth half width
w = linspace(2e-2,7e-2,m);
f1 = w.*(sinc((w./lambda0*tan(theta)/pi-1)/2)+sinc((w./lambda0*tan(theta)/pi+1)/2));
f3 = w.*(sinc((w./lambda0*tan(theta)/pi-3)/2)+sinc((w./lambda0*tan(theta)/pi+3)/2));
%data = (int(f,theta,-RL,RL));
f0 = 2*w.*sinc((w./lambda0*tan(theta)/pi)/2); %horizontal pattern?

f2 = w.*(sinc((w./lambda0*tan(theta)/pi)/2));