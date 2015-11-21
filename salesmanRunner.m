% swapTwoCitiesProposal does a naive swapping, but it is still very
% powerful if you use it several times with decreasing epsilons.

% swapTwoCitiesSmartProposal selects a random city and swaps as its next
% city the one that has the minimum distance between it. It does very
% little tweaks but very much helps the overall picture.

% swapTwoNeighboringCitiesProposal is the same as swapTwoCitiesProposal,
% but only swaps cities that are neighbors.

% We start by doing a greedy approach, knowing pretty well that this does
% not get us that far, but is better than most random permutations.
best = tspGreedy(randperm(100));
%travelingSalesman(best)

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

best = localSearch(@travelingSalesman,@swapTwoNeighboringCitiesProposal,best,0,1,100,5,1);
travelingSalesman(best)