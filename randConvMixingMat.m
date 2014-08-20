function [A] = randConvMixingMat(n, k)
%------------------------------------------------------------------------
%
% randMixingMat.m:
%   Creates an an random normal arbitrary mixing matrix composed of FIR
%   filters.
%
% Inputs:
%   n: The size of the mixing matrix
%   k: The size of the FIRs
%
% Outputs:
%   A: The scrambled diagonal mixing matrix
%
%------------------------------------------------------------------------

A = zeros(n,n,k);
mu = 6;
stddev = 1.5;
for i=1:k
    % Create random normal vector
    A(:,:,i) = (mu + stddev.*randn(n))./i;
end

end