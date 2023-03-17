function K = getKernel2D( n, tau, dbg )
%GETKERNEL1D function to get discrete convolution operator/kernel matrix
%
% input
%   n       number of points
%   dbg     flag to enable debug mode (optional)
%
% output
%   K       kernel matrix

if nargin < 2, tau = [0.02, 0.01]; end
if nargin < 3, dbg = false; end

% discrete convolution matrix / kernel matrix
K{1} = getKernel1D( n, tau(1) );
K{2} = getKernel1D( n, tau(2) );


if dbg, vizKernel( K ); end

end % end of function




function ker = getKernel1D( n, sig )

% spatial step size (domain is [0,1])
h = 1 / n; h2 = h*h;

% compute all-to-all distance
x = (0.5:n-0.5) - (0.5:n-0.5)';

% constants for kernel
c = 1 / (sqrt(2*pi)*sig);
d = h2 / ( 2*sig^2 );

% function handle to construct discrete kernel matrix
ker = h*c*exp(-d*(x.^2));

end




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



%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
