function[SS, AA] = bss(blockSize, X, fs, epsilon, outDir, maxIter, minStep)
%------------------------------------------------------------------------
%
% bss.m:
%   Performs blind source separation on the provided mixtures using the
%   provided sampling block size, frequency, and initial step size.
%
% Inputs:
%   blockSize: The block size to use when sampling from the mixtures
%       while performing blind source separation
%   X: Matrix of mixtures from which to extract sources
%   fs: The frequency of the mixtures (and inferred sources)
%   epsilon: The initial step size to use during gradient ascent
%   outDir: The directory to write output to
%   maxIter: The maximum number of iterations during gradient ascent
%   minStep: The minimum step size during dynamic epsilon adjustment
%
% Outputs:
%   SS: The sources inferred from the provided mixtures
%   AA: The inferred mixing matrix
%
%------------------------------------------------------------------------


% Get the number of mixtures and their size
n = size(X, 1);

% Write original mixtures to file
for i=1:n
    wavwrite(soundnorm(X(i,:)), fs,...
        [outDir 'mixture_' int2str(i) '_orig.wav']);
end

% Choose Identity matrix for initial value of A
AA = eye(n);

% Gradient ascent
% Initialize likelihood to 0
lastLoglike = 0;
% Also serves as an escape hatch
converged = false;
i = 0;
% Constant for step size adjustment
a = 1;
while ~converged
    if i > maxIter || epsilon < minStep
        converged = true;
    end

    % Get samples
    samples = sample(blockSize, X);
    
    % Calculate S fragments
    SS = AA\samples;
    
    % Infer mixing matrix A
    AA = inferA(blockSize, X, AA, epsilon);
    
    % Calculate log likelihood and delta
    currentLoglike = loglike(AA, SS);
    loglikeDelta = currentLoglike - lastLoglike;
    
    if converged
        % Calculate full S and normalize
        SS = AA\X;
        
        for j=1:n
            % Normalize sources
            SS(j,:) = soundnorm(SS(j,:));
            
            % Write inferred sources to file
            wavwrite(SS(j,:), fs, [outDir 'source_' int2str(j)...
                '_inferred.wav']);
        end
    end
    
    if abs(loglikeDelta) < epsilon*a
        disp('step down');
        % Reduce step size if the difference from last iteration is
        % less than epsilon*a
        epsilon = epsilon/2;
    end
    
    % Update likelihood and iteration counter
    lastLoglike = currentLoglike;
    i = i + 1;
end

end