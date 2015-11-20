function out=tspProposal(x)
% Runs a random one of the three wideScaleRandomNoise proposal functions on
% the input


% num = floor(rand*3);
% if num == 0
    temp = x(10);
    x(10) = x(11);
    x(11) = temp;
    
    temp = x(20);
    x(20) = x(21);
    x(21) = temp;
    
    temp = x(30);
    x(30) = x(31);
    x(31) = temp;
    
    temp = x(40);
    x(40) = x(41);
    x(41) = temp;
    out = x;
% elseif num ==1
%     out = wideScaleRandsomNoiseOneCoordinateProposal(x);
% elseif num == 2
%     out = wideScaleRandomNoisePairProposal(x);
% end

end
    