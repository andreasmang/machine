function checkDerivative( fctn, x0 )
%CHECKDERIVATIVE function to check if derivative
%of objective is correct (uses taylor expansion)
%
% inputs:
%   fctn    function handle for objective function
%   x0      initial guess

% number of repetitons
nrep = 46;

fprintf( '%s\n', repmat( '-', [1, nrep] ) );
fprintf( 'derivative check for objective\n<%s>\n', func2str( fctn ) );
fprintf( '%s\n', repmat( '-', [1, nrep] ) );
fprintf( ' %s %11s %11s %11s\n', 'h', 't0', 't1', 't2' );
fprintf( '%s\n', repmat( '-', [1, nrep] ) );

h = logspace( -1, -10, 10 ); % step size
v = rand( size( x0 ) );      % random perturbation

% evaluate objective function
[f0, df, d2f] = fctn( x0 );

% compute inner product of gradient and perturbation
dfv = df'*v;

% compute v^T H v
if isa( d2f, 'function_handle' )
    vtd2fv = v'*d2f(v);
else
    vtd2fv = v'*d2f*v;
end

% allocate history
t0 = zeros( [numel(h), 1] );
t1 = zeros( [numel(h), 1] );
t2 = zeros( [numel(h), 1] );

% do derivative check
for j = 1 : length( h )
    hh = h(j )*h( j );
    ft = fctn( x0 + h(j)*v );                           % function value
    t0(j) = norm( f0 - ft );                            % taylor poly 0
    t1(j) = norm( f0 + h(j)*dfv - ft);                  % taylor poly 1
    t2(j) = norm( f0 + h(j)*dfv + 0.5*hh*vtd2fv - ft ); % taylor poly 2

    % display to user
    fprintf('%9.4e  %9.4e  %9.4e  %9.4e\n', h(j), t0(j), t1(j), t2(j) );
end

fprintf('%s\n', repmat( '-' , [1, nrep] ) );
fprintf('t0 = |f0 - ft|\n');
fprintf('t1 = |f0+h*df''-ft|\n');
fprintf('t2 = |f0+h*df''*v+0.5*h^2*v''*H*v-ft|\n');
fprintf('%s\n', repmat( '-' , [1, nrep] ) );

figure()
loglog( h, t0 );
hold on
loglog( h, t1 );
loglog( h, t2 );
hold off

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
