%dynamic programming assignment 
%Script for part (5) and (6)
%Part (5)
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
kmin = 0.1.*kstar;            %lower restriction on grid
kmax = 2.*kstar;              %upper restriction on grid

%taking 100 linearly spaced values of k from kmin to kmax:
Nk = 100;                     %grid points
kgrid = linspace(kmin,kmax,Nk)';

crit = 1;                     % convergence criterion
prec = 1e-6;                  % convergence parameter

dk = (kmax-kmin)/(Nk-1);      % implied increment

v = zeros(Nk,1);              % value function
dr = zeros(Nk,1);             % decision rule 

kp0 = kgrid;                  % initial guess on k(t+1)


while crit>prec;
for i=1:Nk

imax = min(floor((A*kgrid(i)^alpha+(1-delta)*kgrid(i)-kmin)/dev)+1,Nk);

% consumption and utility

c = (A*kgrid(i)^alpha)+(1-delta)*kgrid(i)- kgrid(1:imax);
utility = (c.^(1-sigma))/(1-sigma);

% find new policy rule

[v1,dr(i)]= max(utility+beta*v(1:imax));
end;

% decision rules

kp = kgrid(dr);
c = A*kgrid.^alpha +(1-delta)*kgrid-kp;

% update the value

utility= (c.^(1-sigma))/(1-sigma);
Q = sparse(Nk,Nk);
for i=1:Nk;
Q(i,dr(i)) = 1;

end
Tv = (speye(Nk)-beta*Q)\utility;
crit= max(abs(kp-kp0));
v = Tv;
kp0 = kp;
fprintf('Steady state convergence distance = %.8f\n', crit)
end

%Part (6)

subplot(1,2,1)
plot(kgrid,dr);
xlabel('Grid for k');
ylabel('Decision rule');
title ('decision rule for the grid for k')
legend('decision rule')

subplot(1,2,2)
plot(kgrid,v,'Linewidth',4);
xlabel('Grid for k');
ylabel('value function');
title ('value function for the grid for k')
legend('value function')



