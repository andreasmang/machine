clear, close all; clc;
% direct solver for optimality conditions of thikhonov regularized solution
% based on SVD of 1D convolution operators

gamma = 50;  % noise perturbation

% load data
data = load('satellite-256x256.mat');
X_true = data.x_true;

% regularization parameter
alpha = 1e-3;

% get problem dimensions
n = size( X_true, 1 );
assert(n==size(X_true, 2));

% get 2D kernel matrix
K = getKernel2D( n );

% blur source: first, K{1} is applied to each column of x,
% then K{2} is applied to each row of x
Y = (K{2} * (K{1} * X_true)')';

% compute noise level as a function of snr
delta = norm(Y(:)) / (gamma*sqrt(n*n));

% perturb data / add noise
Y_delta = addNoise( Y, delta );

% compute SVD of convolution operators
% ADD YOUR CODE HERE

% compute solution based on SVD
X_alpha = % ADD YOUR CODE HERE

% compute least squares solution
X_ls = % ADD YOUR CODE HERE

% visualize the results
t1 = linspace( 0, 1, n );
t2 = linspace( 0, 1, n );
[t1,t2] = meshgrid( t1, t2 );


figure();
subplot(2,3,1), imagesc( X_true ); colormap gray;
subplot(2,3,2), imagesc( Y ); colormap gray;
subplot(2,3,3), imagesc( Y_delta ); colormap gray
subplot(2,3,4), imagesc( X_alpha ); colormap gray
subplot(2,3,5), imagesc( abs(X_alpha - X_true) ); colormap gray;
subplot(2,3,6), imagesc( X_ls ); colormap gray




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
