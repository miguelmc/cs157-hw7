function out=wideScaleRandomNoiseMix3Proposal(x)
% Runs a random one of the three wideScaleRandomNoise proposal functions on
% the input


num = floor(rand*3);
if num == 0
    out = wideScaleRandomNoiseProposal(x);
elseif num ==1
    out = wideScaleRandomNoiseOneCoordinateProposal(x);
elseif num == 2
    out = wideScaleRandomNoisePairProposal(x);
end

end
    