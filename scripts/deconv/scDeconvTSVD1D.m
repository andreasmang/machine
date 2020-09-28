% implementation of truncated SVD and its analysis
% for one-dimensional deconvolution problem

clear, close all; clc;

% number of grid points
n = 256;
delta = 1; % amplitude of noise

% coordinates
t = linspace( 0, 1, n );

% define disrete convolution operator (assignment 1)
K = % ADD YOUR CODE HERE

% compute condition number
c = cond( K );
fprintf('condition number of K: %e\n', c );

% compute source (assignment 1)
x_true = % ADD YOUR CODE HERE

% compute right hand side
y = K*x_true;

% perturb right hand side by noise
y_delta = % ADD YOUR CODE HERE

% compute singular value decomposition
[U, S, V]  = svd( K );
sigma = diag( S );

% plot the singular values
figure(), semilogy( sigma );
title( 'singular values' );

% ids of singular values for ploting singular vectors
k = [1,2,10,25,100];

% plot singular vectors
% ADD YOUR CODE HERE

% compute truncated SVD for target ranks {5, 10, 50}
r = [5,10,50];
% ADD YOUR CODE HERE
% ADD YOUR CODE HERE
% ADD YOUR CODE HERE

% construct operator from low rank matrices
K1 = % ADD YOUR CODE HERE
K2 = % ADD YOUR CODE HERE
K3 = % ADD YOUR CODE HERE

% display low rank approximations of matrix operator K
figure();
subplot(2,4,1), imagesc( K1 ), title( 'rank=5'  );
subplot(2,4,2), imagesc( K2 ), title( 'rank=10' );
subplot(2,4,3), imagesc( K3 ), title( 'rank=50' );
subplot(2,4,4), imagesc( K  ), title( 'K' );
subplot(2,4,5), imagesc( abs(K1-K) ), title( 'rank=5'  );
subplot(2,4,6), imagesc( abs(K2-K) ), title( 'rank=10' );
subplot(2,4,7), imagesc( abs(K3-K) ), title( 'rank=50' );

% compute relative error between low rank approximations
% and display error to user
err1 = % ADD YOUR CODE HERE
err2 = % ADD YOUR CODE HERE
err3 = % ADD YOUR CODE HERE
fprintf(' error (rank  5) = %e\n', err1 );
fprintf(' error (rank 10) = %e\n', err2 );
fprintf(' error (rank 50) = %e\n', err3 );

% define thresholds alpha \in [1e-4,1] for truncated SVD
alpha = logspace( -4, 0, 5 );

% compute solution via truncated SVD
m       = numel( alpha );
x_alpha = zeros([n, m]);

for i = 1 : m
    % compute truncated SVD
    % ADD YOUR CODE HERE

    % apply pseudo inverse to y_delta
    x_alpha(:,i) = % ADD YOUR COD HERE
end

% plot results
figure()
for i = 1 : m
    subplot(1,m,i), plot(z, x_true, z, x_alpha(:,i) );
    h = legend( 'x_{true}', 'x_\alpha' ); h.FontSize = 14;
end




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
