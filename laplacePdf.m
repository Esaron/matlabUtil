function px = laplacePdf(mu, b, x0)
%------------------------------------------------------------------------
%
% laplacePdf.m:
%   Returns the probability that a random variable in the laplacian
%   defined by mu and b is equal to x.
%
% Inputs:
%   mu: center/location parameter
%   b: spread/scale parameter
%   x0: The x0 for the pdf
%
% Outputs:
%   px: The probability that x == x0
%
%------------------------------------------------------------------------

px = exp(-abs(x0 - mu)/b)/(2*b);

end