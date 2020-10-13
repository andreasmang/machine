clear, close all; clc;

% regularization parameter
alpha = 1e-4;

% construct matrix
B = [1, 1, 1; 1, 2, 3];
K = B'*B + .001*eye( 3 );

% define true solution
xtrue = [1; 2; 3];

% compute right hand side (and add random perturbation)
eta = 0.05*norm( xtrue );
per = eta*randn(3,1);
y = K*xtrue + per;

% define initial guess for solver
x0 = zeros( size(xtrue) );

% compute regularization operator
L = eye( numel(x0) );

% setup objective function
objfun = @(x) objFunRLSQ( x, K, y, L, alpha );

method = 'gdsc'; % gradient descent
% method = 'bfgs'; % l-bfgs method
% method = 'newton'; % newton method

% execute iterative solver
xalpha = runOptimizer( objfun, x0, method );

fprintf( ' true solution:      x = (%+-6e, %+-6e, %+-6e)\n', xtrue );
fprintf( ' numerical solution: x = (%+-6e, %+-6e, %+-6e)\n', xalpha );

err = norm( xalpha - xtrue ) / norm( xtrue );
fprintf(' relative error: %e\n', err );

% plot objective function
m = 100;
x = linspace( -3, 6, m );
[ x1, x2 ] = meshgrid( x, x );
fval = zeros( [m, m] );

% evaluate objective function for a range of points
for i = 1 : m
    for j = 1 : m
        % plot function in x1 and x2 variable
        x = [x1(i,j); x2(i,j); xtrue(3)];

        % evaluate and store objective value
        fval(i,j) = objfun( x );
    end
end

% plot optimization landscape / values of objective function
figure();
subplot(1,2,1);
h = surf( x1, x2, fval, 'FaceAlpha', 0.5 );
title('surface plot of objective function');
h.EdgeColor = 'none';
hold on;
plot3( xtrue(1), xtrue(2), objfun( xtrue ) ,'rx', 'MarkerSize', 10, 'LineWidth', 4 );
plot3( xalpha(1), xalpha(2), objfun( xalpha ) ,'kx', 'MarkerSize', 10, 'LineWidth', 4 );
xlabel( 'x_1', 'FontSize', 16 ); ylabel( 'x_2', 'FontSize', 16 ); zlabel( 'f(x)', 'FontSize', 16 );
hold off;
subplot(1,2,2);
h = contour( fval, 100 );
title('contour plot of objective function');
colormap hot;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
