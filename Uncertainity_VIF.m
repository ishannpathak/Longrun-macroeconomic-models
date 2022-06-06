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
kgrid = linspace(klb,kub,Nk);                %grid for k
N = 2;                                       %total elements in support of markov process

Z = [1 0.1];                                 %support of markov process
capitalpie = [0.9 0.1; 0.1 0.9];             %transition matrix

prec = 0.001;                                %convergence parameter
dist = 2*prec;                               %convergence parameter

%part (d)
V = [zeros(1,Nk) ; zeros(1,Nk)];                             %guess for V

%algorithm from dynamic programming lecture notes
   while dist >= prec                        %while V does not converge
    
    
     for i = 1:Nk
        for j = 1:Nk
            for m = 1:N
                Vnew(m,i) = (((Z(m))*(kgrid(i)^alpha) + (1 - delta)*kgrid(i) - kgrid(j))^(1 - sigma))/(1 - sigma) + beta*(capitalpie(m,1)*V(1,j) + capitalpie(m,2)*V(2,j)) ;
 %V0 or conditional expectation directly incorporated into vnew equation
          
            end
        end
     end
     
      for i = 1:Nk
          for j = 1:Nk
          for m = 1:N
        [TV(m,i),I(j)] = max(Vnew(m,i));
        policy(m,j) = I(j);
          end
          end
      end
      
dist = norm(TV - V);               
V = TV;

   end
   
%Part (e)
figure (1)
mesh(kgrid, Z, V)
xlabel = ('K');
ylabel = ('Z');
zlabel = ('V(z,k)');


figure (2)
mesh(policy, Z, V)
xlabel = ('K');
ylabel = ('Z');
zlabel = ('policy(z,j)');




    

     
