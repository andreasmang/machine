clear, close all; clc;

n     = 64; % grid size
delta = 2;  % perturbation
x_true = phantom( n );

n = size( x_true );

K = getKernel2D( n );

% blur source: first, K{1} is applied to each column of x,
% then K{2} is applied to each row of x
y = (K{2} * (K{1} * x_true)')';

% perturb data / add noise
y_delta = addNoise( y, delta );

% solve optimality system (K'*K + alpha*I) x_alpha = (K'*y_delta)
% we use an iterative solver based on PCG, since the kernel matrix
% would be too large to store and form; PCG allows us to invert
% the system only through the knowledge of the action of the matrix
% on a vector (i.e., an expression for the matrix vector product,
% a.k.a, the "matvec)

% compute right hand side K'y (note: K is a summetrix matrix)
kty = (K{2} * (K{1} * y_delta)')';

% function handle for matrix vector product (function implemented below)
matvec = @(x, alpha) evalMatVec( x, K, alpha );

% define regularization parameter
alpha = 1e-3;

% solve optimality conditions
tol = 1e-6; maxit = 1500;
x_alpha = pcg( @(x) matvec(x, alpha), kty(:), tol, maxit );

% map solution back to matrix shape (for visualization)
x_alpha = reshape( x_alpha, n );

% visualize the results
t1 = linspace( 0, 1, n(1) );
t2 = linspace( 0, 1, n(2) );
[t1,t2] = meshgrid( t1, t2 );

figure();
subplot(1,5,1), surf( t1, t2, x_true ); shading interp;
subplot(1,5,2), surf( t1, t2, y ); shading interp;
subplot(1,5,3), surf( t1, t2, y_delta ); shading interp;
subplot(1,5,4), surf( t1, t2, x_alpha ); shading interp;
subplot(1,5,5), surf( t1, t2, abs(x_alpha - x_true) ); shading interp;

% define trial regularization parameters
alpha_list = logspace( -5, 5, 11 );


% compute l-curve (assigment 3b)
m = numel(alpha_list);
for i = 1 : m
    % ADD YOUR CODE HERE
end


% get number of regularization parameters (assigment 3c)
relerr = zeros( m, 1 );
for i = 1 : m
    % get regularization parameter
    alpha = alpha_list(i);
    % solver for given regularization parameter
    x_alpha = % ADD YOUR CODE HERE

    relerr(i) = norm(x_alpha(:) - x_true(:)) / norm(x_true(:));
end

% plot error versus the regularization parameter
figure()
h = semilogx( alpha_list, relerr, 'kx', 'MarkerSize', 10 );
ylabel('||x_{\alpha} - x_{true}||_2 / ||x_{true}||_2', 'FontSize', 18, 'Interpreter', 'tex' )
xlabel('\alpha', 'FontSize', 18, 'Interpreter', 'tex' );
grid on;





%///////////////////////////////////////////////////////
function y = evalMatVec( x, K, alpha )
% apply (K^T K + alpha*id) to vector

% get dimensions
n = [ size(K{1},1), size(K{2},1) ];

% map vector (lexicographical ordering) back to matrix
x = reshape( x, n );

% compute alpha*id*x (regularization)
x_alpha = alpha*x;

% apply K^T*K to x (mismatch)
kx   = (K{2} * (K{1} * x)')';
ktkx = (K{2} * (K{1} * kx)')'; % K is symmetric

% map back to vector shape
y = ktkx(:) + x_alpha(:);

end
%///////////////////////////////////////////////////////




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
