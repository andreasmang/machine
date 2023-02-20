clear, close all;
% script to visualize different sources for deconvolution problem

% n = 64; % number of points
n = 256; % number of points

s = linspace(-1,1,n);

% parameter controlling width of kernel
tau = 0.05;

% get disrete convolution operator
[K,kx] = getKernel1D( n, tau );

% compute condition number
c = cond( K );
fprintf('condition number of K: %e\n', c );

% visualize kernel matrix
figure()
title('kernel matrices');
subplot(1,2,1), imagesc(K); axis square;
subplot(1,2,2), imagesc(log(K)); axis square;

% visualize
figure()
plot(s, kx);
title('one-dimensional kernel');
xlabel('s'); ylabel('ker(s)');




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
