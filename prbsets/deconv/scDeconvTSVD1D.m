% implementation of truncated SVD and its analysis
% for one-dimensional deconvolution problem

clear, close all; clc;

% number of grid points
n = 256;
gamma = 50; % signal to noise ratio
tau = 0.005; % parameter controlling smoothing
% tau = 0.02;

% get disrete convolution operator
K = getKernel1D( n, tau );

% compute condition number
c = cond( K );
fprintf('condition number of K: %e\n', c );

% get true data
x_true = getDeconvSource1D( n );

% compute right hand side
y = K*x_true;

% compute noise level as a function of SNR
delta = % ADD YOUR CODE HERE

% perturb right hand side by noise
y_delta = addNoise( y, delta );

% define threshold alpha for truncated SVD
alpha = [0.001,0.01,0.1,0.2,0.5];

% compute solution via truncated SVD
m = numel( alpha );
x_alpha = zeros([n, m]);

for i = 1 : m
    % compute truncated SVD
    [U,S,V] = tSVDTH( K, alpha( i ) );

    % invert diagonal matrix
    sigma = diag( S );
    Sinv  = % ADD YOUR CODE HERE

    % apply truncated SVD
    x_alpha(:,i) = % ADD YOUR CODE HERE
end


% plot results and data
% coordinates
s = linspace( 0, 1, n );

figure()
subplot(2,1,1), plot(s, x_true);
subplot(2,1,2), plot(s, y);
hold on; plot(s, y_delta), hold off;

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
