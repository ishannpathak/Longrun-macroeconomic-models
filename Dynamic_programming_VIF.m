%dynamic programming assignment 
%Script for part (4) and (7)
%Part (4)
%Value function iteration method
%initializing parameters:

alpha= 0.34;
beta = 0.99;
A = 1;
delta = 0.025;
sigma = 2;

%let the steady state value of k derived in the analytical part of the
%problem be kstar
kstar = ((alpha.*A.*beta)./(1 - beta.*(1 - delta)))^(1./(1 - alpha));
dev = 0.9;                    % maximal deviation from steady state
kmin = 0.9.*kstar;            %lower restriction on grid
kmax = 1.1.*kstar;            %upper restriction on grid

%taking 100 linearly spaced values of k from kmin to kmax:
Nk = 100;                     %grid points
kgrid = linspace(kmin,kmax,Nk);

crit = 1; % convergence criterion
prec = 1e-6; % convergence parameter

dk = (kmax-kmin)/(Nk-1);      % implied increment

v = zeros(1,Nk);             % value function
dr = zeros(1,Nk);            % decision rule 

while crit>prec;
for i=1:Nk


tmp = (A*(kgrid(i)^alpha)+(1-delta)*kgrid(i)-kmin);
imax = min(floor(tmp/dk)+1,Nk);

% consumption and utility

c = (A*kgrid(i)^alpha)+(1-delta)*kgrid(i)- kgrid(1:imax);
utility = (c.^(1-sigma))/(1-sigma);

% find value function

[tv(i),dr(i)] = max(utility + beta*v(1:imax));
end;
crit = max(abs(tv-v));              % Compute convergence criterion
v = tv;                             % Update the value function
fprintf('Steady state convergence distance = %.8f\n', crit)
end


% Final solution

kp = kgrid(dr);

%Part (7)
%Simulate the model

             
k = zeros(1,200);
cs = zeros(1,200);
g = zeros(1,200);
 
k(1) = 0.1*kstar;

        for t = 1:200
      [kx, g(t-1)] = min(abs(k(t-1) - k(t)));
        k(t) = (g(t-1));
        cs(t-1) = A*(k(t-1))^alpha + (1 - delta)*k(t-1) - k(t);
        end
    

end
plot(1:100,k, 'b',1:100,cs);
xlabel('time');
ylabel('Capital and consumption');
title ('kt and ct series')

%discussed with simar and tanisha
