function[AShifted] = loopShift(A)
%------------------------------------------------------------------------
%
% loopShift.m:
%   Takes a matrix of size m x n, and returns a matrix of size m x n.^2
%   such that each row consists of elements of the corresponding row in the
%   original matrix separated by m-1 zeros, and each row is shifted to the
%   right by its index-1 zeros. Uses nested loop to do this.
%
% Inputs:
%   A: The matrix to shift
%
% Outputs:
%   AShifted: The shifted matrix
%
%------------------------------------------------------------------------

% A is NOT assumed to be square (but still transposed in the case of BSS)

% Get length of sides
rows = size(A, 1);
cols = size(A, 2);

% Initialize AShifted
AShifted = zeros(rows, cols.^2);

for i=1:rows
    for j=0:cols-1
        AShifted(i, j*cols+i) = A(i, j+1);
    end
end

end