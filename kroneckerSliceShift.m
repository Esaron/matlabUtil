function[AShifted] = kroneckerSliceShift(A)
%------------------------------------------------------------------------
%
% kroneckerSliceShift.m:
%   Takes a square matrix of size m, and returns a matrix of size m x m.^2
%   such that each row consists of elements of the corresponding row in the
%   original matrix separated by m-1 zeros, and each row is shifted to the
%   right by its index-1 zeros. Uses Kronecker product to do this.
%
% Inputs:
%   A: The matrix to shift
%
% Outputs:
%   AShifted: The shifted matrix
%
%------------------------------------------------------------------------

% A is assumed to be square (and transposed in the case of BSS)

% Get length of side and ensure square-ness
length = size(A, 1);
assert(length == size(A, 2));

% Get I
I = eye(length);

% Initialize AShifted
AShifted = zeros(length, length.^2);

for i=1:length
    AShifted(i, :) = kron(A(i, :), I(i, :));
end

end