angle = degT2;
ampN  = amp2/max(amp2);
ampErrN = ampErr2/max(amp2);
angleErr = ones(length(angle),1)*2.5;

syms x
f = sin(2*(pi/4-deg2rad(x)))^2;
h{1} = figure;
%h{3}(1) = subplot(3,1,1:2);
h{2}(1) = ezplot(f,[-45 45]);
set(h{2}(1), 'color','black');
hold on
h{2}(2) = errorbar(45-angle,ampN,ampErrN*2,'.');
h{3} = herrorbar(45-angle,ampN,angleErr,'.');
title('Three Polarizers Malus (radio)','fontsize',18)
xlabel('angle[deg]','fontsize',16)
ylabel('relative intensity[AU]','fontsize',16)
legend([h{2}(1), h{2}(2)],'sin(2\theta)^2','data')
grid('on')
xlim([-50,50])

% resid = double(subs(f,'x',45-angle))-ampN;
% h{3}(2) = subplot(3,1,3);
% plot(angle,resid,'.')
% title('Residuals','fontsize',16)
% grid('on')
% xlim([-50,50])
% 
