function x = getDeconvSource1D( n, id )
% GETDECONVSOURCE1D get source (i.e., x_true)
% for deconvolution problem
%
% input:
%   n     number of grid points
%
% output:
%   x     data set

if nargin < 2, id = 3; end

% compute coordinate functions
h = 1/n;
x = linspace( h, 1-h, n )';

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
elseif id == 3
    i1 = ( x > 0.10 ) & ( x < 0.25 );
    i2 = ( x > 0.30 ) & ( x < 0.35 );
    i3 = ( x > 0.50 ) & ( x < 1.00 );

    x = 0.75*i1 + 0.25*i2 + sin(2*pi*x).^4.*i3;
else
    error('id = %s not implemented',id);
end

% normalize data
x = x./norm(x(:));

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
