function K = getKernel1D( n, dbg )
%GETKERNEL1D function to get discrete convolution operator/kernel matrix
%
% input
%   n       number of points
%   id      id for type of kernel (optional)
%   dbg     flag to enable debug mode (optional)
%
% output
%   K       kernel matrix

if nargin < 2, dbg = 0; end

h = 1 / n; % spatial step size (domain is [0,1])

% pre-compute constants for kernel
sigma = 0.03;
c = 1 / (sqrt(2*pi)*sigma);
d = h^2 / ( 2*sigma^2 );

% compute all-to-all distance
y = (1:n) - (1:n)';

% discrete convolution matrix / kernel matrix
K = h*c*exp( -d*(y.^2) );

if dbg, vizKernel( K ); end

end % end of function




%///////////////////////////////////////////////////////
function vizKernel( K )
%VIZKERNEL visualize kernel

n = size( K, 1 );

% vizualize kernel matrix
[x1,x2] = meshgrid( (1:n) );

figure();
surf( x1, x2, K );
ylim([1,n]); xlim([1,n]);
shading interp;

end % end of function
%///////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
