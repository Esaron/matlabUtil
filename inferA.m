function[A] = inferA(blockSize, mixtures, aprioriA, epsilon)
%------------------------------------------------------------------------
%
% inferA.m:
%   Infers the mixing matrix based on apriori information.
%
% Inputs:
%   mixtures: The mixtures undergoing blind source separation
%   blockSize: The block size to use when sampling from the mixtures
%       while performing blind source separation
%   aprioriA: The last inferred value of the mixing matrix
%
% Outputs:
%   A: The inferred mixing matrix
%
%------------------------------------------------------------------------

% Get number of mixtures
numMixtures = size(mixtures, 1);

% Get samples
samples = sample(blockSize, mixtures);

% Get S according to apriori A
S = aprioriA\samples;

% Block evaluation
Z = -sign(S);

% Recalculate A
deltaA = -aprioriA*Z*S' - numMixtures*aprioriA;
A = aprioriA + epsilon*deltaA;

end