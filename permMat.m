function[PI] = permMat(n)
%------------------------------------------------------------------------
%
% permMat.m:
%   Creates an arbitrary permutation matrix PI of size n. A permutation
%   matrix is a matrix that satisfies the following properties:
%   - There is exactly one element in any given row i and column j that is
%     equal to 1.
%   - All other elements in row i and column j are equal to 0.
%
% Inputs:
%   n: The size of the permutation matrix
%
% Outputs:
%   PI: The permutation matrix
%
%------------------------------------------------------------------------

I = eye(n);
PI = I(randperm(n),:);

end