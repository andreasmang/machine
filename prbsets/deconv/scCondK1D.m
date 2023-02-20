clear, close all;
% plot condition number as a function of tau

% ASSIGNMENT 1)
n = 32; % number of points
tau = linspace(0.1,0.01,10); % kernel parameterization

% initialize memory
m = numel( tau );
kappa = zeros( m, 1 );

% compute condition number estimate as a function of sigma
for i = 1 : m
    K = getKernel1D( n,tau(i) );
    kappa(i) = % ADD YOUR CODE HERE
end

% visualize computed condition numbers
figure();
semilogy( tau, kappa );
xlabel('$\tau_i$','interpreter','latex','FontSize', 19)
ylabel('$\kappa(K(\tau_i))$','interpreter','latex','FontSize', 19)



% ASSIGNMENT 2)
% plot condition number as a function of the grid size
tau = 0.01; % standard deviation
n = [16,32,64,128,256]; % number of grid points

% initialize memory
m = numel(n);
kappa = zeros(m,1);

% compute condition number estimate as a function of sigma
for i = 1 : m
    K = getKernel1D( n(i), tau );
    kappa(i) = % ADD YOUR CODE HERE
end

% visualize computed condition numbers
figure();
semilogy(n,kappa);
xlabel('$n_i$','interpreter','latex','FontSize', 19)
ylabel('$\kappa(K(n))$','interpreter','latex','FontSize', 19)




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
