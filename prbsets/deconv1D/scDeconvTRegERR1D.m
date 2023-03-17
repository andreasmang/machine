% implementation of tikhonov regularization scheme and its analysis
% for one-dimensional deconvolution problem
clear, close all; clc;

n = 256; % number of grid points
gamma = 50; % signal to noise ratio
tau = 0.005; % parameterization of kernel

% coordinates
s = linspace( 0, 1, n );

% get disrete convolution operator
K = getKernel1D( n, 1, tau );

% get true data
x_true = getDeconvSource1D( n, 3 );

% compute right hand side
y = K*x_true;

% compute noise level as a function of snr
delta = % ADD YOUR CODE HERE

% perturb right hand side by noise
[y_delta, noise] = addNoise( y, delta );

% define function handle to solver inverse problem
id = eye( n );
solve = @(alpha) % ADD YOUR CODE HERE

% define trial regularization parameters
alpha_list = logspace( -5, 0, 20 );

% allocate memory
m = numel( alpha_list );
relerr = zeros( [m, 1] );

% compute error between solution x_alpha and x_true
for i = 1 : m
    alpha = alpha_list( i );
    x_alpha = solve( alpha );

    relerr(i) = % ADD YOUR CODE HERE
    fprintf('run %2d: error for alpha=%e: %e\n', i, alpha, relerr(i) );
end

% plot error versus the regularization parameter
figure()
h = semilogx( alpha_list, relerr, 'kx', 'MarkerSize', 10 );
hold on; semilogx( alpha_list, relerr, 'k-', 'LineWidth', 1 ); hold off;
ylabel('$||x_{\alpha} - x_{true}||_2 / ||x_{true}||_2$', 'FontSize', 19, 'interpreter', 'latex' )
xlabel('$\alpha$', 'FontSize', 19, 'interpreter', 'latex' );
grid on;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
