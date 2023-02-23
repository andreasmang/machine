clear, close all; clc;

% setup problem data
A = [0.16, 0.10; ...
     0.17, 0.11; ...
     2.02, 1.29];
xtrue = [1; 1];               % true solution
per   = [0.01; -0.03; 0.02];  % perturbation

% compute data
b = A*xtrue + per;

% objective function we are trying to minimize:
% f(x) = ||A*x - b||_2
f = @(x) sqrt((A*x - b)'*(A*x - b));

% compute solution by solving optimality conditions
% gradient of f(x) is A^T*(A*x - b)
xisol = (A'*A) \ A'*b;

fprintf( 'cond(A): %e\n', cond(A) );

fprintf( 'xtrue  = (%+-.3f, %+-.3f), f(x) = %f\n', xtrue, f(xtrue) );
fprintf( 'xisol  = (%+-.3f, %+-.3f), f(x) = %f\n', xisol, f(xisol) );
fprintf( 'xtrail = (%+-.3f, %+-.3f), f(x) = %f\n', [1.65; 0], f( [1.65; 0] ) );
fprintf( 'xtrail = (%+-.3f, %+-.3f), f(x) = %f\n', [0; 2.58], f( [0; 2.58] ) );

% vizualize objective function
plotObj( f, [-20,20], xtrue, [256,256] );




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
