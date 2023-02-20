function [ktype,kfun,kfcnstr] = getOpType( K )
%GETOPTYPE checks matrix argument K for iterative methods and
%determines its type (function handle, matrix operator, ...)
%
% input:
%   K              matrix operator
%
% output
%   ktype          type of argument K, which can either be 'matrix',
%                  'function', 'expression' or 'inline object'
%   kfun           function name or inline object (is '' if "atype" is 'matrix')
%   kfcnstr        is the function name if "atype" is 'function' or the
%                  formula of the function if "atype" is 'expression' or
%                  'inline object';  it is '' if "atype" is 'matrix'

[kfun,kfunmsg] = fcnchk( K );

% check if afunmsg is empty
if isempty( kfunmsg )
    % if it is an inline function
    if isa( kfun,'inline' )
        if isa( K, 'inline' ), ktype = 'inline object';
        else                   ktype = 'expression';
        end
        afcnstr = formula( kfun );
    else % both function_handles @fun and function names 'fun'
        ktype = 'function';
        if isa( K, 'function_handle' ), kfcnstr = func2str( K );
        else                            kfcnstr = K;
        end
    end

elseif isa( K, 'float' )
    kfun = K; ktype = 'matrix'; kfcnstr = '';
else error('input for operator K is invalid (can not be handled)');
end

end % end of function




%#######################################################
% This code is part of the Matlab-based toolbox
% MACHINE --- MAthematical and Computational metHods
% for INverse problEms
% For details see https://github.com/andreasmang/machine
%#######################################################
