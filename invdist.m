
%Assignment 5 part 2
%initializing variables
clc
clear

beta = 0.99;
sigma = 2;
alpha = 0.34;
delta = 0.025;
Nk = 100;                                    %grid points for k

klb = 0.01;                                  %k lower bound
kub = 5;                                     %k upper bound
kgrid = linspace(klb,kub,Nk);
N = 2;                                       %total elements in support of markov process

Z = [1 0.1];                                 %support of markov process
capitalpie = [0.9 0.1; 0.1 0.9];             %transition matrix

%part (c)
% start with a guess for pie0

pieinv = [0.2 0.8];                          %guess on pieinv
prec = 0.00001;                              %convergence parameter
dist = 2*prec;                               %convergence parameter
while (dist>=prec)                           %convergence criterion
Tpieinv = pieinv*capitalpie;                 %recursive representation over probability distributions
%Tpieinv is the function that takes capitalpie and Nz as inputs
dist = abs(Tpieinv-pieinv);
pieinv = Tpieinv;
fprintf('Steady state convergence distance = %.8f\n', dist);
end

%while loop fetches the invariant probability distribution Tpieinv
%Tpieinv is the invariant distribution which can be verified since 
%Tpieinv*IdentityMatrix = Tpieinv*TransitionMatrix




