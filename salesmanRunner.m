% swapTwoCitiesProposal does a naive swapping, but it is still very
% powerful if you use it several times with decreasing epsilons.

% swapTwoCitiesSmartProposal selects a random city and swaps as its next
% city the one that has the minimum distance between it. It does very
% little tweaks but very much helps the overall picture.

%disp('epsilon 100');
%best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,randperm(100),100,1,100,5,inf);
%best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,50,1,100,5,inf);

% This ones are good to unwrap long edge distances.
%disp('epsilon 50');
%best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,50,1,100,5,250);
%best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,50,1,100,5,250);

%disp('epsilon 20');
%best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,20,1,100,5,100);
%best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,20,1,100,5,100);

disp('epsilon 15');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,randperm(100),15,1,100,5,85);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,15,1,100,5,85);

disp('epsilon 10');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,randperm(100),10,1,100,5,60);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,10,1,100,5,60);

% All these methods try to put one of the nodes of the longest edge on one end
% of the whole path. By doing this you can potentially avoid the long edge
% by taking another shorter path. Different calls are due to the fact that
% we dont know which node of the pair into which end will give us the best
% path, so we do all options.
disp('attempting to remove long edges');
best1 = localSearch(@travelingSalesman,@makeLongestEdgeBeginPointProposal1,best,1000,1,100,0.1,50);
best2 = localSearch(@travelingSalesman,@makeLongestEdgeBeginPointProposal2,best,1000,1,100,0.1,50);
best = fliplr(best);
best3 = localSearch(@travelingSalesman,@makeLongestEdgeBeginPointProposal1,best,1000,1,100,0.1,50);
best4 = localSearch(@travelingSalesman,@makeLongestEdgeBeginPointProposal2,best,1000,1,100,0.1,50);

best1 = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best1,7,1,100,2,35);
best2 = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best2,7,1,100,2,35);
best3 = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best3,7,1,100,2,35);
best4 = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best4,7,1,100,2,35);

if ~isequal(best1, best) && ~isequal(best2, best) && travelingSalesman(best1) < travelingSalesman(best2)
    best = best1;
else
    best = best2;
end

if ~isequal(best3, best) && travelingSalesman(best3) < travelingSalesman(best)
    best = best3;
end

if ~isequal(best4, best) && travelingSalesman(best4) < travelingSalesman(best)
    best = best4;
end

disp('epsilon 7');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,7,1,100,5,35);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,7,1,100,10,35);

disp('epsilon 5');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,5,1,100,10,25);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,5,1,100,10,25);

disp('epsilon 2');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,2,1,100,10,7);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,2,1,100,10,7);

disp('epsilon 1');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,1,1,100,5,3);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,1,1,100,10,3);

disp('epsilon .1');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,.1,1,100,5,.5);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,.1,1,100,10,.5);

disp('epsilon .01');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,.01,1,100,5,.05);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,.01,1,100,10,.05);

%%

load cities

x0=1:100; %initial guess, unfortunately far from the origin % NOTES FROM TA: write your own proposal functions; print out 41??
% try changing eplision 
%arrangeCirclesRunner
%arrangeCircles(x0)
%ans = 77 --> what this less than 41
% ONLY CHANGE THE LINE BELOW: (replace the 0's with carefully chosen positive numbers)
%epsilons=[10000 5000 1000 900 800 700 600 500 400 300 200 100 80 60 40 20 10 5 1 0.1];
% pick a "schedule" for epsilon, that starts high, ends low, has perhaps
% 15-20 epsilons, and, when run, optimizes the function to less than 1
%for eps=epsilons,%loop through values in epsilons <-- must be a row vector
    for i=1:1, %run localSearch for 3 seconds per epsilon, plotting every .3 seconds
        x0=localSearch(@travelingSalesman,@tspProposal,x0,10,-inf,inf,5,0.01);
        figure(100); plot(x0); title(['eps=' num2str(eps)]);drawnow;
    end
    travelingSalesman(x0)
%end