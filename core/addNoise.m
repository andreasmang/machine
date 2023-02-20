function [ydelta, noise] = addNoise( y, delta )
%ADDNOISE add noise to data
%
% input:
%   y        noise free data
%   delta    noise level
%
% output:
%   ydelta   perturbed data
%   noise    perturbation/noise added to data (delta*eta)

% default value for noise level
if nargin < 2, delta = 1.0; end

% get size of data
n = size( y );

% compute and normalize noise
eta = randn( n );
noise = delta.*eta;

% perturb data by noise
ydelta = y + noise;

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
