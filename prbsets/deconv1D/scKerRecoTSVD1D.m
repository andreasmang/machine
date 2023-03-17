% implementation of truncated SVD and its analysis
% for one-dimensional kernel reconstruction problem
clear, close all; clc;

n = 256; % number of grid points
gamma = 50; % signal to noise ratio

% get reco mat
K = getRecoMat1D( n );

% compute singular value decomposition
[U, S, V]  = svd( K );
sigma = diag( S );

% plot the singular values
figure(), semilogy( sigma );
title( 'singular values' );

% compute condition number
c = cond( K );
fprintf('condition number of K: %e\n', c );

% get kernel to be reconstructed
[x_true,s] = getRecoKernel1D( n );

% compute right hand side
y = K*x_true;

% compute noise level as a function of snr
delta = % ADD YOUR CODE HERE

% perturb right hand side by noise
y_delta = addNoise( y, delta );

% define threshold alpha for truncated SVD
alpha = [0.001,0.01,0.05,0.08,0.1];

% compute solution via truncated SVD
m = numel( alpha );
x_alpha = zeros([2*n-1, m]);

for i = 1 : m
    % compute truncated SVD
    [U,S,V] = tSVDTH( K, alpha( i ) );

    % invert diagonal matrix
    sigma = diag( S );
    Sinv  = % ADD YOUR CODE HERE

    % apply truncated SVD
    x_alpha(:,i) = % ADD YOUR CODE HERE
end


% plot results
figure()
for i = 1 : m
    subplot(1,m,i), plot(s, x_true, s, x_alpha(:,i) );
    title(sprintf('alpha = %.3f', alpha(i)));
    h = legend( 'x_{true}', 'x_\alpha' ); h.FontSize = 14;
end




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
