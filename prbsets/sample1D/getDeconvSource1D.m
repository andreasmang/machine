function [x,s] = getDeconvSource1D( n )
% GETDECONVSOURCE1D get source (i.e., x_true)
% for deconvolution problem
%
% input:
%   n     number of grid points
%
% output:
%   x     data set

% compute coordinate functions
h = 1/n;
s = h/2:h:1-h/2; s = s';

% set up true solution x_true
id1 = (0.10<s & s<0.25);
id2 = (0.30<s & s<0.32);
id3 = (0.50<s & s<1.00);
x = 0.75*id1 + 0.25*id2 + id3.*sin(2*pi*s).^4;
x = 50.*x;
x = x / norm(x);

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
