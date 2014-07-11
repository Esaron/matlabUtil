%------------------------------------------------------------------------
%
% shiftProfile.m:
%   Profiles the two methods of performing the shift operation:
%   kroneckerSliceShift.m and loopShift.m.
%
% Inputs:
%   A: The matrix to shift
%   iterations: The number of times to perform the operations
%
%------------------------------------------------------------------------

function[] = shiftProfile(A, iterations)
outDir = 'output/';

% A is assumed to be square for the purposes of comparison
length = size(A, 1);

% Profile loopShift
profile on;
for i=1:iterations
    loopShift(A);
end
p = profile('info');
profsave(p, [outDir num2str(length) '_' num2str(iterations)...
    '_loopShift_profile']);
profile off;

% Profile kroneckerSliceShift
profile on;
for i=1:iterations
    kroneckerSliceShift(A);
end
p = profile('info');
profsave(p, [outDir num2str(length) '_' num2str(iterations)...
    '_kroneckerSliceShift_profile']);
profile off;

end