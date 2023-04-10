function K = getKernel1D( n, sig )
%GETKERNEL1D function to get discrete convolution operator
%for one-dimensional test problem
%
% input
%   n       number of points
%   sig     kernel width
%
% output
%   K       kernel matrix

if nargin < 2, sig = 0.03; end

h = 1/n; % compute spatial step size
s = [h/2:h:1-h/2]'; % compute coordinates

% compute 1D kernel
c = 1 / (sqrt(2*pi)*sig);
ker = c*exp(-(s - h/2).^2 / (2*sig^2));

% compute kernel matrix
K = h.*toeplitz(ker);

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
