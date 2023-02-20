% implementation of truncated SVD and its analysis
% for one-dimensional deconvolution problem

clear, close all; clc;

% number of grid points
n = 256;
s = linspace( 0, 1, n );
tau = 0.03;

% get disrete convolution operator
K = getKernel1D( n, tau );

% compute singular value decomposition
[U, S, V] = % ADD YOUR CODE HERE
sigma = diag( S );

% plot the singular values
figure(), semilogy( sigma );
title( 'singular values' );

% compute truncated SVD for target ranks {5, 10, 50}
r = [5,10,50];
[U1,S1,V1] = tSVD( K, r(1) );
[U2,S2,V2] = tSVD( K, r(2) );
[U3,S3,V3] = tSVD( K, r(3) );

% construct operator from low rank matrices
K1 = U1*S1*V1';
K2 = U2*S2*V2';
K3 = U3*S3*V3';

% display low rank approximations of matrix K
figure();
subplot(1,4,1), imagesc(K1), colorbar(), axis square, title('rank=5');
subplot(1,4,2), imagesc(K2), colorbar(), axis square, title('rank=10');
subplot(1,4,3), imagesc(K3), colorbar(), axis square, title('rank=50');
subplot(1,4,4), imagesc(K), colorbar(), axis square, title('K');

R1 = % ADD YOUR CODE HERE
R2 = % ADD YOUR CODE HERE
R3 = % ADD YOUR CODE HERE

figure();
subplot(1,3,1), imagesc(R1), colorbar(), axis square, title('rank=5');
subplot(1,3,2), imagesc(R2), colorbar(), axis square, title('rank=10');
subplot(1,3,3), imagesc(R3), colorbar(), axis square, title('rank=50');

% compute relative error between low rank approximations
% and display error to user
err1 = norm( K1 - K ) / norm( K );
err2 = norm( K2 - K ) / norm( K );
err3 = norm( K3 - K ) / norm( K );
fprintf(' error (rank  5) = %e\n', err1 );
fprintf(' error (rank 10) = %e\n', err2 );
fprintf(' error (rank 50) = %e\n', err3 );



%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
