function[x] = convTrimEnd(s, w)
%------------------------------------------------------------------------
%
% convTrimEnd.m:
%   Performs convolution of a filter and source, and only returns the first
%   T values of the output vector, where T is the size of the original
%   source.
%
% Inputs:
%   s: The original source
%   w: The FIR filter
%
% Outputs:
%   x: s convolved with w
%
%------------------------------------------------------------------------

x = conv(s, w);
x = x(1:size(s, 2));

end