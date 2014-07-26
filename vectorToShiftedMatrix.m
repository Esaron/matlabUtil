function[A] = vectorToShiftedMatrix(w, n, varargin)
%------------------------------------------------------------------------
%
% vectorToShiftedMatrix.m:
%   Create a matrix A from a vector w where rows are time shifted, trimmed
%   versions of w.
%
% Inputs:
%   w: The input vector
%   n: The number of copies (rows) of the vector
%   m: The time shift to be used for the first row
%
% Outputs:
%   A: The time shifted matrix
%
%------------------------------------------------------------------------

if nargin == 2
    A = vectorToShiftedMatrix(w, n, 0);
else
    m = varargin{1};
    L = size(w, 2);
    A = zeros(n, L);
    
    if m >= 0
        for i=1:n
            A(i,i+m:L) = w(1:L-m-i+1);
        end
    else
        m = -m;
        for i=1:n
            A(i,i:L-m) = w(m+1:L-i+1);
        end
    end
end

end