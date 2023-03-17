function [K] = getRecoMat1D( n )
%GETKERNEL1D function to get discrete convolution operator/kernel matrix
%
% input
%   n       number of points
%
% output
%   K       kernel matrix

% spatial step size (domain is [0,1])
h = 1 / n;
m = 2*n-1;
K = tril(ones(m,m))*h;

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
