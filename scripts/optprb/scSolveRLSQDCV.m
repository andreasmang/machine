clear, close all; clc;

alpha = 1e-3;   % regularization parameter
delta = 4;      % perturbation
x_true = im2double(imread('cameraman.tif'));

% get problem dimensions
n = size( x_true );

% compute kernel
K = getKernel2D( n );

% blur source: first, K{1} is applied to each column of x,
% then K{2} is applied to each row of x
y = (K{2} * (K{1} * x_true)')';

% perturb data / add noise
y_delta = addNoise( y, delta );

% define function handle
objfun = @(x) objFunRLSQDCV( x, K, y_delta, alpha );

method = 'newton';

% initial guess
x0 = zeros( [prod(n), 1] );

% execute iterative solver
x_alpha = runOptimizer( objfun, x0, method );

% map to 2d shape
x_alpha = reshape( x_alpha, n );

% visualize the results
t1 = linspace( 0, 1, n(1) );
t2 = linspace( 0, 1, n(2) );
[t1,t2] = meshgrid( t1, t2 );

figure();
subplot(2,5,1),  surf( t1, t2, x_true ); shading interp;
subplot(2,5,2),  surf( t1, t2, y ); shading interp;
subplot(2,5,3),  surf( t1, t2, y_delta ); shading interp;
subplot(2,5,4),  surf( t1, t2, x_alpha ); shading interp;
subplot(2,5,5),  surf( t1, t2, abs(x_alpha - x_true) ); shading interp;
subplot(2,5,6),  imagesc( x_true );
subplot(2,5,7),  imagesc( y );
subplot(2,5,8),  imagesc( y_delta );
subplot(2,5,9),  imagesc( x_alpha );
subplot(2,5,10), imagesc( 1-abs(x_alpha - x_true) );
colormap( gray );



%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
