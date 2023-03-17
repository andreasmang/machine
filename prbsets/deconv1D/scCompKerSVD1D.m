clear, close all;
% script to visualize the singular value decomposition of the kernel
% matrix K for one-dimensional deconvolution problem

n = 256; % number of points
w = linspace(0,1,n); % domain

% get disrete convolution operator
K = getKernel1D( n, 0.03 );

% compute the singular value decomposition of the matrix K
[U,S,V] = % ADD YOUR CODE HERE

% for visualization only (account for numerical accuracy)
s = diag(S); s(s < 1e-14) = 1e-14;

v01 = % ADD YOUR CODE HERE
v05 = % ADD YOUR CODE HERE
v10 = % ADD YOUR CODE HERE
v20 = % ADD YOUR CODE HERE


% visualize singular values
figure()
semilogy( 1:256, s );
title('singular values');

% visualize singular vectors
figure()
subplot(4,1,1), plot( w, v01 ); title('$v_1$','interpreter','latex','FontSize',19)
subplot(4,1,2), plot( w, v05 ); title('$v_5$','interpreter','latex','FontSize',19)
subplot(4,1,3), plot( w, v10 ); title('$v_{10}$','interpreter','latex','FontSize',19)
subplot(4,1,4), plot( w, v20 ); title('$v_{20}$','interpreter','latex','FontSize',19)




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
