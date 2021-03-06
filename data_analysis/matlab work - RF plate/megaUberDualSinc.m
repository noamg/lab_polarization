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


g1 = w.*(sinc((w./lambda0*tan(theta)/pi-1)/2));
g2 = w.*(sinc((w./lambda0*tan(theta)/pi+1)/2));
g0 = 2*w.*sinc((w./lambda0*tan(theta)/pi)/2);

% figure
% hold all
% h(1) = ezplot(g0(20),[-0.5,0.5]*pi);
% h(2) = ezplot(g1(20),[-0.5,0.5]*pi);
% h(3) = ezplot(g2(20),[-0.5,0.5]*pi);
% h(4) = ezplot(f1(20),[-0.5,0.5]*pi);
% h(5) = ezplot(f3(20),[-0.5,0.5]*pi);
% ylim([-0.04,0.15])
% grid('on')
% legend(h,...
%     'horizontal',...
%     'vertical 1st mod - spacial component #1',...
%     'vertical 1st mod - spacial component #2',...
%     'vertical 1st mod',...
%     'vertical 3rd mod')
% title('Lobe Pattern - plates at 7.0cm','FontSize',18)
% xlabel('\theta [Rad]','FontSize',16)
% ylabel('amplitude [AU]','FontSize',16)
% set(h,'LineWidth',2)
clear h
figure
hold all
h(1) = ezplot(f1(20),[-0.5,0.5]*pi);
h(2) = ezplot(f3(20),[-0.5,0.5]*pi);
% h(3) = plot([0.1,0.1],[-0.04,0.1],'r')
% h(4) = plot([-0.1,-0.1],[-0.04,0.1],'r')
ylim([-0.04,0.1])
grid('on')
legend(h,... %h(1:3)
    '1st mod',...
    '3rd mod')%,...
    %'reciever angle')
title('Vertical Component Lobe Pattern - plates at 7.0cm','FontSize',18)
xlabel('\theta [Rad]','FontSize',16)
ylabel('amplitude [AU]','FontSize',16)
set(h,'LineWidth',2)