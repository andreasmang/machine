% implementation of tikhonov regularization scheme and its analysis
% for one-dimensional deconvolution problem

clear, close all; clc;

% discretization parameters
n = 256; % number of grid points
delta = 1; % amplitude of noise

% coordinate axis
t = linspace( 0, 1, n );

% define disrete convolution operator (assignment 1)
K = % ADD YOUR COD HERE

% compute condition number
c = cond( K );
fprintf('condition number of K: %e\n', c );

% compute source (assignment 1)
x_true = % ADD YOUR CODE HERE

% compute right hand side
y = K*x_true;

% perturb right hand side by noise
y_delta = % ADD YOUR CODE HERE

% define identity matrix for regularization operator
id = eye( n );

% define tikhonov regularization parameters (assignment 2a)
alpha1 = 1e-12;
alpha2 = 1e-01;

% solve tikhonov system for varying alpha
x1 = % ADD YOUR CODE HERE (alpha1)
x2 = % ADD YOUR CODE HERE (alpha2)

% plot results
figure()
subplot(1,2,1), plot( t, x_true, t, x1 );
h = legend( 'x_{true}', 'x_{\alpha}' ); h.FontSize = 14;
subplot(1,2,2), plot( t, x_true, t, x2);
h = legend( 'x_{true}', 'x_{\alpha}' ); h.FontSize = 14;

% define trial regularization parameters (for assignments 2b, 2c, 2d)
alpha_list = logspace( -5, 5, 11 );

% compute l-curve (assigment 2b)
m = numel(alpha_list);
for i = 1 : m
    % ADD YOUR CODE HERE
end

% plot L-curve (log-log plot)
% ADD YOUR CODE HERE

% compute solution using selected alpha^\star (l-curve criterion)
% ADD YOUR CODE HERE

figure()
plot( t, x_true, t, x_alpha );
h = legend( 'x_{true}', 'x_{\alpha}' ); h.FontSize = 14;


% identify regularization parameter using
% discrepancy principle (asigment 2c)

% delta = norm( noise );
for i = 1 : m
    % ADD YOUR CODE HERE
end


% allocate memory
relerr = zeros( [m, 1] );

% compute error between solution x_alpha and x_true (assignemt 2d)
for i = 1 : m
    alpha = alpha_list( i );
    x_alpha = % ADD YOUR CODE HERE

    relerr(i) = norm( x_alpha(:) - x_true(:) ) / norm( x_true(:) );
    fprintf('error for alpha=%e: %e\n', alpha, relerr );
end

% plot error versus the regularization parameter
figure()
h = semilogx( alpha_list, relerr, 'kx', 'MarkerSize', 10 );
ylabel('||x_{\alpha} - x_{true}||_2 / ||x_{true}||_2', 'FontSize', 18, 'Interpreter', 'tex' )
xlabel('\alpha', 'FontSize', 18, 'Interpreter', 'tex' );
grid on;




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
