figure(1)
mu = [1 1.286 1.361 1.374 1.467 1.639 1.377];
sigma = [ 1 1.174 1.445 2.251 3.346 7.168 26.129];
plot(1:7,mu,'k-');
hold on
plot(1:7,sigma,'k--')
hold off
set(gca,'XTickLabel',{'0', '0.05','0.1','0.2','0.3','0.5','1.0'});
xlabel('\alpha');
ylabel('eref(\theta)');
legend('\theta = \mu', '\theta = \sigma',2)


figure(2)
hold on
IFm = inline(' sqrt(pi) * gamma(3+a)/gamma(3/2+a)*(1/(1 + (x-m)^2))^(1+a)*(x-m)'); % IF(x,mu)
x = -10:0.1:10;
IF = zeros(size(x));

a = 0;
m = 0;
for k=1:length(x)
    IF(k) = IFm(a,m,x(k));
end
plot(x,IF,'k')
% a = 0.05;
% for k=1:length(x)
%     IF(k) = IFm(a,m,x(k));
% end
% plot(x,IF,'k--')
a = 0.1;
for k=1:length(x)
    IF(k) = IFm(a,m,x(k));
end
plot(x,IF,'k--')
% a = 0.2;
% for k=1:length(x)
%     IF(k) = IFm(a,m,x(k));
% end
% plot(x,IF,'k:')
a = 0.3;
for k=1:length(x)
    IF(k) = IFm(a,m,x(k));
end
plot(x,IF,'k:')%,'LineWidth',2)
% a = 0.5;
% for k=1:length(x)
%     IF(k) = IFm(a,m,x(k));
% end
% plot(x,IF,'k--','LineWidth',2)
a = 1;
for k=1:length(x)
    IF(k) = IFm(a,m,x(k));
end
plot(x,IF,'k-.')%,'LineWidth',2)
hold off
legend('\alpha = 0 (MLE)',...
    ...'\alpha = 0.05',
    '\alpha = 0.1',...
    ...'\alpha = 0.2',
    '\alpha = 0.3',...
    ...'\alpha = 0.5',
    '\alpha = 1', 2)
xlabel('x')
