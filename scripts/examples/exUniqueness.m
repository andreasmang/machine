clear, close all; clc;

% considered inverse problem:
% x1 + x2 = 1

% create domain
h = 0.05;
x = -1:h:1-h;
[x1, x2] = meshgrid(x, x);

% create line of possible solutions
lx1 =  0: h: 1-h; lx2 =  1:-h: 0+h;
z = zeros([1,numel(lx1)]);

% define objective function (quadratic) corresponding to problem
f = @(x1,x2) (x1 + x2 - 1)^2;
fx = (x1 + x2 - 1).^2;

% visualize manifold
figure()
surf( x1, x2, fx )
colormap summer, shading interp, alpha 0.5;
hold on;
contour( x1, x2, fx, 40 )
plot3(1/2, 1/2, f(1/2,1/2), 'rx');
plot3(lx1, lx2, z, 'ko');
hold off;


% solve equality constrained optimization problem
% minimize_x || x ||_2  subject to x(1) + x(2) = 1

% define objective function
f = @(x) norm(x);

% define equality constraint Ax = b
x0 = [-1,3]; A = [1,1]; b = [1];

% run minimizer (matlab implementation)
xsol = fmincon(f, x0, [], [], A, b);
fprintf( ' solution is (%.2f %.2f)\n', xsol );




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
