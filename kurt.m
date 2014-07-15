function[out] = kurt(in)
%------------------------------------------------------------------------
%
% kurt.m:
%   Takes matlab kurtosis and subtracts 3 so that normal is 0.  Works on
%   rows of matrices instead of columns.
%
% Inputs:
%   in: The sample
%
% Outputs:
%   out: The zero-based kurtosis
%
%------------------------------------------------------------------------

out = kurtosis(in')'-3;

end