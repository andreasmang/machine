% implementation of tikhonov regularization scheme and its analysis
% for one-dimensional deconvolution problem

clear, close all; clc;

n = 256; % number of grid points
gamma = 50; % signal to noise ratio
tau = 0.005; % parameterization of kernel

% coordinates
s = linspace( 0, 1, n );

% get disrete convolution operator
K = getKernel1D( n, tau );

% get true data
x_true = getDeconvSource1D( n );

% compute right hand side
y = K*x_true;

% compute noise level as a function of snr
delta = % ADD YOUR CODE HERE

% perturb right hand side by noise
[y_delta, noise] = addNoise( y, delta );

% define function handle to solver inverse problem
id = eye( n );
solve = @(alpha) % ADD YOUR CODE HERE

% define tikhonov regularization operator
alpha1 = 1e-12;
alpha2 = 1e-3;
alpha3 = 1e-1;

% solve tikhonov system for varying alpha
x1 = solve ( alpha1 );
x2 = solve ( alpha2 );
x3 = solve ( alpha3 );

% plot results
figure()
subplot(3,1,1), plot(s, x_true, s, x1); h = legend( 'x_{true}', 'x' ); h.FontSize = 14;
subplot(3,1,2), plot(s, x_true, s, x2); h = legend( 'x_{true}', 'x_{\alpha}' ); h.FontSize = 14;
subplot(3,1,3), plot(s, x_true, s, x3); h = legend( 'x_{true}', 'x_{\alpha}' ); h.FontSize = 14;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
