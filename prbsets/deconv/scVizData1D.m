clear, close all;
% script to visualize the source and the data for the inverse deconvolution
% problem as a function of the signal to noise ratio

n = 128; % number of points
s = linspace(0,1,n); % axis / coordinates
tau = 0.03; % bandwidth of kernel
gamma = 10; % signal to noise ratio

% get source data
xtrue = getDeconvSource1D( n );

% get disrete convolution operator
K = getKernel1D( n, tau );

% compute condition number
c = cond( K );
fprintf('condition number of K: %e\n', c );

% compute right hand side
y = K*xtrue;

% compute noise level as a function of snr
delta = norm(y) / (gamma*sqrt(n));

% perturb right hand side by noise
ydelta = addNoise( y, delta );


% plot data for inverse problem
figure();
subplot(2,1,1), plot(s, xtrue, 'r');
subplot(2,1,2), plot(s, y, 'm');
hold on; plot(s, ydelta, 'bx'); hold off;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
