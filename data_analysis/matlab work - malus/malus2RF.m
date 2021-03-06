%after copying table from malus2.xlsx to variable a
angle = a(:,1); amp = a(:,2); ampErr = a(:,3);
ampN  = amp/max(amp);
ampErrN = ampErr/max(amp);
angleErr = ones(length(angle),1)*2.5;
syms x
f = cos(deg2rad(x))^2;
h{1} = figure;
h{3}(1) = subplot(3,1,1:2)
h{2}(1) = ezplot(f,[0 90]);
set(h{2}(1), 'color','black');
hold on
h{2}(2) = errorbar(angle,ampN,ampErrN*2,'.');
h{3} = herrorbar(angle,ampN,angleErr,'.');
title('Two Polarizers Malus (radio)','fontsize',18)
xlabel('angle[deg]','fontsize',16)
ylabel('relative intensity[AU]','fontsize',16)
legend([h{2}(1), h{2}(2)],'cos(x)^2','data')
grid('on')
xlim([-5,95])

resid = double(subs(f,'x',angle))-ampN;
h{3}(2) = subplot(3,1,3);
plot(angle,resid,'.')
title('Residuals','fontsize',16)
grid('on')
xlim([-5,95])

