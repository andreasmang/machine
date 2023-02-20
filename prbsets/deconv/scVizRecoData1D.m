clear, close all;

% mesh size
n = 128;

% signal to noise ratio
gamma = 50;

% get reco mat
K = getRecoMat1D( n );

% get kernel to be reconstructed
[xtrue,s] = getRecoKernel1D( n );

% compute data/observation
y = K*xtrue;

% compute noise level as a function of snr
delta = norm(y) / (gamma*sqrt(n));

% perturb right hand side by noise
[ydelta, noise] = addNoise( y, delta );


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
