function qnt = getEmpQuant(x, p)
%GETEMPQQUANT compute empirical q-quantiles calculates from columns of x
% input:
%   x     matrix/vector
%   p     quantile
%
% output:
%   qant  empirical quantiles

if nargin < 2, p = [0.25,0.5,0.75]; end

[n,m] = size(x);
if n==1; n=m; end

qnt = interp1(sort(x),(n-1)*p+1);

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
