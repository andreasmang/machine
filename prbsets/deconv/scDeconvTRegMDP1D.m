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

% define trial regularization parameters
alpha_list = logspace( -5, 0, 20 );

% compute l-curve
mu = norm( noise );
[alpha,res] = evalDisPrinc( K, y_delta, solve, alpha_list, mu );





%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
