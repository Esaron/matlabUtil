function [X] = convMix(A, S)
%------------------------------------------------------------------------
%
% convMix.m:
%   Mixes the sources in S according to the mixing matrix A.
%
% Inputs:
%   A: The m x n x k mixing matrix
%   S: The n x k source matrix
%
% Outputs:
%   X: the m x k mixture matrix
%
%------------------------------------------------------------------------

[m n ~] = size(A);
k = size(S, 2);
X = zeros(m, k);
for i=1:m
    for j=1:n
        X(i, :) = X(i, :) + convTrimEnd(S(j, :), squeeze(A(i, j, :))');
    end
end


end