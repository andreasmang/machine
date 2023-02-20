function K = getKernel2D( n, tau )
%GETKERNEL1D function to get discrete convolution operator/kernel matrix
%
% input
%   n       number of points
%   dbg     flag to enable debug mode (optional)
%
% output
%   K       kernel matrix

% bandwidth of kernel
if nargin < 2, tau = [0.02, 0.01]; end

% discrete convolution matrix / kernel matrix
K{1} = getKernel1D( n, tau(1) );
K{2} = getKernel1D( n, tau(2) );

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
