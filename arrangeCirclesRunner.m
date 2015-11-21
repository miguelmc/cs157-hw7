x0=1:20; %initial guess %

% We are using wideScaleRandomNoiseMix3Proposal with two additional
% proposal functions, circlesHorVertMoveProposal and circlesDiagonalMoveProposal.

% circlesHorVertMoveProposal does the following:
% Chooses one random coordinate in x (either a X or Y coordinate), and 
% changing the value by adding or subtracting one.  This moves one circle 
% in the horizantol or vertical direction.

% circlesDiagonalMoveProposal does the following:
% Choosing one random coordinate pair in x (cooresponding X and Y 
% coordinates), and changing the values of the coordinate pair by adding or
% subtracting one from each coordinate.  This moves one circle in the 
% diagonal direction (like packing the circles into the square more 
% tightly.)  

% We call the local search using the proposal functions each four
% times.  Let's call each grouping of wideScaleRandomNoiseMix3Proposal,
% circlesHorVertMoveProposal, circlesDiagonalMoveProposal, and 
% circlesHorVertMoveProposal a 'set'.  
% There are sets A,B,C,D.  For each set, we vary the parameters to 
% localsearch for the proposal functions as stated below.  We found that
% having 4 sets worked well, any more had diminishing returns.  
% For every set, we first use wideScaleRandomNoiseMix3Proposal, then use
% circlesHorVertMoveProposal, then circlesDiagonalMoveProposal, and then
% circlesHorVertMoveProposal again.  wideScaleRandomNoiseMix3Proposal mixes
% everything up, circlesHorVertMoveProposal makes small movements in the
% hor/vert directions, circlesDiagonalMoveProposal packs in the circles in
% more closely, and then we make small movements in the hor/vert direction.

% minx0 is the min x0 value from all four 'sets' of proposal functions
% calls.  Between sets, we compare the x0 produced by the set than just 
% finished to see if it is the lowest x0 thus far.

% Parameters to localSearch for with circlesHorVertMoveProposal and
% circlesDiagonalMoveProposal: 
% startingX: the startingX from the previous call.  
% epsilon: is zero because we don't want any neutral moves.  
% lowerBoundOnX: chose 0
% upperBoundOnX: chose 50 
% timeDelta: chosen on trial and error, we found 3 works well
% funcDelta: chosen on trial and error, we found 1 works well 

% Parameters to localSearch for with wideScaleRandomNoiseMix3Proposal: 
% startingX: minx0 because it is the best we have found at this point.   
% epsilon: we have an epsilon of 10 to allow for trial and error.   
% lowerBoundOnX: chose 0
% upperBoundOnX: We are decreasing the upper bound for each set.  Set A is 
% 50, set B is 40, set C is 39, set D is 38. 
% timeDelta: chosen on trial and error, we found 5 works well
% funcDelta: chosen on trial and error, we found 10 works well 

% Our lowest is 40.6514.  On any given run, we generally score below 43.

% setting minx0 to zero.
minx0 = 0;

% Set A 
x0=localSearch(@arrangeCircles,@wideScaleRandomNoiseMix3Proposal,x0,10,0,50,5,10);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesDiagonalMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);


% Set B
minx0 =x0;
x0=localSearch(@arrangeCircles,@wideScaleRandomNoiseMix3Proposal,minx0,10,0,40,5,10);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesDiagonalMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
if arrangeCircles(x0) < arrangeCircles(minx0)
    minx0 = x0;
end

% Set C
x0=localSearch(@arrangeCircles,@wideScaleRandomNoiseMix3Proposal,minx0,10,0,39,5,10);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesDiagonalMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
if arrangeCircles(x0) < arrangeCircles(minx0)
    minx0 = x0;
end

% Set D
x0=localSearch(@arrangeCircles,@wideScaleRandomNoiseMix3Proposal,minx0,10,0,38,5,10);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesDiagonalMoveProposal,x0,0,0,50,3,1);
x0=localSearch(@arrangeCircles,@circlesHorVertMoveProposal,x0,0,0,50,3,1);
if arrangeCircles(x0) < arrangeCircles(minx0)
    minx0 = x0;
end

% Storing our minx0 as x0
x0 = minx0;