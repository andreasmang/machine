function [x_true,s] = getRecoKernel1D( n )
%GETRECOKERNEL1D construct 1D convolution kernel for kernel reconstruction
% problem; the kernel will be non-symmetric
%
% input
%   n       number of points
%
% output
%   x_true  true 1D kernel

% problem setup
h = 1/n;
s = -1+h:h:1-h;
s = s';

% we will consider a non-symmetric kernel, stitched together
tau = [.1,.2];
s1 = s(1:n);
s2 = s(n+1:end);
kerL = exp(-s1.^2/2/tau(1)^2);
kerR = exp(-s2.^2/2/tau(2)^2);

% concatenate kernels
ker = [kerL; kerR];
nn = sum(ker)*h; % normalization factor
x_true = ker/nn; % normalized kernel

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
