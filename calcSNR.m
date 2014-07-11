%------------------------------------------------------------------------
%
% calcSNR.m:
%   Calculates the signal to noise ratio for two sources
%
% Inputs:
%   source1: The first source
%   source2: The second source
%
% Outputs:
%   snrOut: The signal to noise ratio for the provided sources
%
%------------------------------------------------------------------------

function[snrOut] = calcSNR(source1, source2)
    noise = abs(source2 - source1);
    snrOut = snr(source2, noise);
end