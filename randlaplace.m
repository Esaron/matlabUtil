function[Y] = randlaplace(mu, b, n, m)
%------------------------------------------------------------------------
%
% randlaplace.m:
%   Randomly sample from a laplacian distribution with location parameter
%   mu and scale parameter b.
%
% Inputs:
%   mu: center/location parameter
%   b: spread/scale parameter
%   n: The number of rows
%   m: The number of columns
%
% Outputs:
%   Y: The samples
%
%------------------------------------------------------------------------

Y = zeros(n, m);
U = rand(n, m);
for i=1:n
    for j=1:m
        u = U(i, j);
        Y(i, j) = mu - b*sign(u - 0.5)*log(1 - 2*abs(u));
    end
end

end