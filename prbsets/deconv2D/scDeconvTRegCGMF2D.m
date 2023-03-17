clear, close all; clc;
% matrix free implementation for solution of 2D deconvolution problem;
% we use a CG method to solve the optimality conditions
% the matvec is given by a matrix-product that involves the 1D convolution
% operators along each spatial dimension

gamma = 50;  % perturbation
data = load('satellite-256x256.mat');
x_true = data.x_true;

tol = 1e-3; % tolerance for PCG
maxit = 1000; % number of max iterations for PCG

% get problem dimensions
n = size( x_true, 1 );
assert(n==size(x_true, 2));

% get 2D kernel matrix
K = getKernel2D( n );

% blur source: first, K{1} is applied to each column of x,
% then K{2} is applied to each row of x
y = % ADD YOUR CODE HERE

% compute noise level as a function of snr
delta = norm(y(:)) / (gamma*sqrt(n*n));

% perturb data / add noise
y_delta = addNoise( y, delta );

% solve optimality system (K'*K + alpha*I) x_alpha = (K'*y_delta)
% we use an iterative solver based on PCG, since the kernel matrix
% would be too large to store and form; PCG allows us to invert
% the system only through the knowledge of the action of the matrix
% on a vector (i.e., an expression for the matrix vector product,
% a.k.a, the "matvec)

% compute right hand side K'y (note: K is a summetrix matrix)
kty = % ADD YOUR CODE HERE

% function handle for matrix vector product (function implemented below)
matvec = @(x, alpha) evalMatVec( x, K, alpha );

% define regularization parameter
alpha = 1e-3;

% solve optimality conditions using CG
x_alpha = % ADD YOUR CODE HERE

% map solution back to matrix shape (for visualization)
x_alpha = reshape( x_alpha, [n,n] );


% visualize the results
t1 = linspace( 0, 1, n );
t2 = linspace( 0, 1, n );
[t1,t2] = meshgrid( t1, t2 );


figure();
subplot(1,5,1), imagesc( x_true ); colormap gray;
subplot(1,5,2), imagesc( y ); colormap gray;
subplot(1,5,3), imagesc( y_delta ); colormap gray
subplot(1,5,4), imagesc( x_alpha ); colormap gray
subplot(1,5,5), imagesc( abs(x_alpha - x_true) ); colormap gray;



function y = evalMatVec( x, K, alpha )
% apply (K^T K + alpha*id) to vector

% get dimensions
n = [ size(K{1},1), size(K{2},1) ];

% map vector (lexicographical ordering) back to matrix
x = reshape( x, n );

% ADD YOUR CODE HERE

end




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
