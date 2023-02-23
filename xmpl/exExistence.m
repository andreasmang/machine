clear, close all; clc;

% linear system:
%  x = 1
% 2x = 11/5
% does not have a solution

% we reformulate this system as a least squares problem
% the solution of which is unique (xsol = 54/55)

% problem parameters
a = [1;    2];
b = [1; 11/5];

% define objective function for vector input x
% (least squares problem)
f = @(x) (a(1).*x - b(1)).^2 + (a(2).*x - 11/5).^2;

% solution to problem
xsol = 54/55;

% define coordinate vector to evaluate objective function
h = 0.01;
x = (-100:h:100-h)';


% we can see that f(x) is a convex function (i.e., we have a unique
% solution to the problem)
figure();
plot( x, f(x), 'LineWidth', 2);
hold on;
plot( xsol, f(xsol), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
hold off;
title( 'f(x) = (x - 1)^2 + (2x - 2.2)^2');
xlabel('x'), ylabel('f(x)');
grid on; set( gca,'FontSize', 14 );
legend('function f(x)', 'solution of problem');




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
