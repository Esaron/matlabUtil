function[Aout] = normaSort(A)
%------------------------------------------------------------------------
%
% normaSort.m:
%   Given a matrix, normalize each row so that max is 1, and arrange rows
%   such that the 1s are along the diagonal.
%
% Inputs:
%   A: The original matrix
%
% Outputs:
%   Aout: The reorganized matrix
%
%------------------------------------------------------------------------

% Init
Aout = A;
n = size(A, 1);

% Normalize
rowmax = max(A, [], 2);
[rowabsmax ix] = max(abs(A), [], 2);
A = diag(1./rowabsmax)*A;
for i=1:n
    if rowmax(i) ~= rowabsmax(i)
        % Maximum absolute value was originally negative. Flip row.
        A(i,:) = -1*A(i,:);
    end
end

% Reorganize
[b iy] = sort(ix);
for i=1:n
    Aout(i,:) = A(iy(i),:);
end


end