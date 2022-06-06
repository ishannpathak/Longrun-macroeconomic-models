%ASSIGNMENT 2
%QUESTION 2

%Part (a) s = savings, d = delta, a = alpha
s = 0.3;
a = 0.5;
d = 0.1;
Nk = 20;
ktgrid = linspace(0,12,Nk); 

%(i) difference equation for Kt and Yt equation 
ktplus1grid = (1 - d)*ktgrid + s*power(ktgrid,a);
ytgrid = power(ktgrid,a);

%(ii) plot phase diagram
plot(ktgrid,ktplus1grid,'Linewidth',4);
xlabel('Kt');
ylabel('Kt+1');
title('Phase diagram');

%(iii) Kt, total savings, total output, total depreciation 
%total savings = ts
%total output = ytgrid
%total depreciation = td

ts = s*ytgrid;
td = d*ktgrid;

plot(ktgrid,ts, 'b',ktgrid,ytgrid,'c',ktgrid,td,'Linewidth',4);
xlabel('Kt');
ylabel('Total savings  Total output  Total depreciation');
title ('Output savings and depreciation')

%Part (b) Steady state

%Start with a guess Kss = 1
Kss = 12;
prec = 0.00001;
dist = 2*prec;
while (dist>=prec)
TKss = (1 - d)*Kss + s*power(Kss,a);
dist = abs(TKss-Kss);
Kss = TKss;
fprintf('Steady state convergence distance = %.8f\n', dist);
end

%Calculating Yss and Css

Yss = power(Kss,a);
Css = Yss - s*Yss;

%derived values when Kss = 1
%Kss = 8.9998, Yss = 3.000, Css = 2.100

%derived values when Kss = 12
%Kss = 9.0002, Yss = 3.000, Css = 2.100

%So upon changing the starting guess for Kss, Yss and Css do not change but
%there is an almost negligible change in Kss of 0.0004


