function out=wideScaleRandomNoiseMix3Proposal(x)
% Runs a random one of the three wideScaleRandomNoise proposal functions on
% the input

% Randomly picking a number in the integer range from 0 to 2 inclusive.
% The if statement calls the cooresponding proposal.  
num = floor(rand*3);

if num == 0
    out = wideScaleRandomNoiseProposal(x);
elseif num ==1
    out = wideScaleRandomNoiseOneCoordinateProposal(x);
elseif num == 2
    out = wideScaleRandomNoisePairProposal(x);
end

end
    