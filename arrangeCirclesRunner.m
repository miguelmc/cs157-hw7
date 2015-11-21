x0=1:20; %initial guess %

% We are using wideScaleRandomNoiseMix3Proposal with two additional
% proposal functions, circlesHorVertMoveProposal and circlesDiagonalMoveProposal.

% circlesHorVertMoveProposal does XYZ.

% circlesDiagonalMoveProposal does ABC.

% We call the local search using the three proposal functions each four
% times.  Let's call each grouping of wideScaleRandomNoiseMix3Proposal,
% circlesHorVertMoveProposal, and circlesDiagonalMoveProposal a 'set'.  There are sets A,B,C,D.  For each set,
% we vary the parameters to localsearch for each proposal function.  This
% helps us XXX.

% minx0 is the min x0 value from all four 'sets' of proposal functions
% calls.  We compare the x0 produced by the set than just finished to see
% if it is the lowest x0 thus far.

% Parameters to localSearch:
% startingX: our initial input (as above)
% epsilon: we decrease the epsilon values because we want to perform fewer 
% neutral moves as we continue minimizing. 
% lowerBoundOnX: range correlates to right or left
% upperBoundOnX: range correlates to right or left
% timeDelta: chosen on trial and error, we found 5 works well
% funcDelta: chosen on trial and error, we found that 5 times epsilon works
% well 

% setting minx0 to zero.
minx0 = 0;

% Set A
% epislon, range 
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

% storing our minx0 as x0
x0 = minx0;