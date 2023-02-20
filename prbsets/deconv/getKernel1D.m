function [K,kx] = getKernel1D( n, tau )
%GETKERNEL1D function to get discrete convolution operator/kernel matrix
%
% input
%   n       number of points
%   tau     bandwidth of kernel
%
% output
%   K       kernel matrix

if nargin < 2, tau = 0.03; end

% spatial step size (domain is [0,1])
h = 1 / n; h2 = h*h;

% compute all-to-all distance
y = (0.5:n-0.5) - (0.5:n-0.5)';

% constants for kernel
c = 1 / (sqrt(2*pi)*tau);
d = h2 / ( 2*tau^2 );

% function handle to construct discrete kernel matrix
ker = @(x) c*exp(-d*(x.^2));

% discrete convolution matrix / kernel matrix
K = h*ker( y );

% if 1D kernel is requested by user, provide it
if nargout > 1
    kx = ker( -(n-0.5) : 2 : n-0.5 );
end

end % end of function



%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
