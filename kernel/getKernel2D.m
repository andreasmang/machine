function K = getKernel2D( n, dbg )
%GETKERNEL1D function to get discrete convolution operator/kernel matrix
%
% input
%   n       number of points
%   dbg     flag to enable debug mode (optional)
%
% output
%   K       kernel matrix

if nargin < 2, dbg = true; end

h = 1 ./ n; % spatial step size (domain is [0,1])

% pre-compute constants for kernel
sigma = [0.03, 0.06];
c = @(i) 1 / (sqrt(2*pi)*sigma(i));
d = @(i) h(i)^2 / ( 2*sigma(i)^2 );

% compute all-to-all distance
y = @(i) (1:n(i)) - (1:n(i))';

% discrete convolution matrix / kernel matrix
K{1} = h(1)*c(1)*exp( -d(1)*(y(1).^2) );
K{2} = h(2)*c(2)*exp( -d(2)*(y(2).^2) );

if dbg, vizKernel( K ); end

end % end of function




%///////////////////////////////////////////////////////
function vizKernel( K )
%VIZKERNEL visualize kernel

n = size( K{1}, 1 );
m = size( K{2}, 1 );

% vizualize kernel matrix
[x11,x12] = meshgrid( (1:n) );
[x21,x22] = meshgrid( (1:m) );

figure();
subplot(2,1,1), surf( x11, x12, K{1} );
ylim([1,n]); xlim([1,n]);
shading interp;

subplot(2,1,2), surf( x21, x22, K{2} );
ylim([1,m]); xlim([1,m]);
shading interp;

end % end of function
%///////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
