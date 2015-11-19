function x=localSearch(funcToOptimize,proposalFunc,startingX,epsilon,lowerBoundOnX,upperBoundOnX,timeDelta,funcDelta)
% This general-purpose optimization routine aims to minimize funcToOptimize
% starting from the initial guess startingX, via proposals generated by
% proposalFunc (the two functions are specified via function handles). When
% optimizing a function whose inputs have lower and upper bounds, the
% proposal xp=proposalFunc(x) has all of its entries that are less than
% lowerBoundOnX rounded up to lowerBoundOnX, and all of its entries greater
% than upperBoundOnX rounded down to upperBoundOnX before funcToOptimize is
% evaluated on xp (these bounds can be -inf and +inf to make them effectively 
% ignored). The proposal is accepted if it improves the function value, or does
% not make it worse by more than epsilon. The routine terminates when timeDelta
% seconds have passed without the best value found so far of funcToOptimize
% improving by funcDelta.


startTime = now * 60 * 60 * 24;
currX = startingX;
prevX = inf;
prevFuncVal = inf;
startFuncVal = funcToOptimize(startingX);
currFuncVal = startFuncVal;

while 1
    prevX = currX;
%     disp(currX)
    currX = proposalFunc(currX);   
%     disp(currX)
    
    % Round to the bounds.
%     disp(currX)
    for i = 1: numel(currX)
        if currX(i) < lowerBoundOnX currX(i) = lowerBoundOnX; end
        if currX(i) > upperBoundOnX, currX(i) = upperBoundOnX; end
%         disp(currX(i))
    end
%     disp(currX)
    
    prevFuncVal = currFuncVal;
    currFuncVal = funcToOptimize(currX);
    

    if currFuncVal + epsilon <= prevFuncVal
        % accepted, just continue
        % print value if proposal is accepted (per hint on handout)
%         disp(currFuncVal)
        
    else
        % TODO: rejected. Not sure what to do here
        currFuncVal = prevFuncVal;
        currX = prevX;
    end
    
    if prevFuncVal - currFuncVal >= funcDelta
        startTime = now * 60 * 60 * 24;
    end

    % See if time limit exceded.
    currTime = now * 60 * 60 * 24;
    if currTime - startTime >= timeDelta
        x = currX;
        break;
    end
end