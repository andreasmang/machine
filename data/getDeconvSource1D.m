function x = getDeconvSource1D( n, id )
%GETDECONVSOURCE1D get source (i.e., x_true) for deconvolution problem
%
% input:
%   n     number of grid points
%
% output:
%   x     data set / source

if nargin < 2, id = 1; end

% compute coordinate functions
x = linspace( 0, 1, n )';

% compute data
if id == 1
    x1 = ( x > 0.10 );
    x2 = ( x < 0.30 );
    x3 = ( x > 0.50 );
    x = x1.*x2 + sin(4*pi*x).*x3;
elseif id == 2
    x1 = ( x > 0.10 );
    x2 = ( x < 0.30 );
    x3 = ( x > 0.50 );
    x = x1.*x2 + sin(4*pi*x).*x3 + 0.2*cos(30*pi*x);
end

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
