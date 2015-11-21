% swapTwoCitiesProposal does a naive swapping, but it is still very
% powerful if you use it several times with decreasing epsilons.

% swapTwoCitiesSmartProposal selects a random city and swaps as its next
% city the one that has the minimum distance between it. It does very
% little tweaks but very much helps the overall picture.

% swapTwoNeighboringCitiesProposal is the same as swapTwoCitiesProposal,
% but only swaps cities that are neighbors.

% We start by doing a greedy approach, knowing pretty well that this does
% not get us that far, but is better than most random permutations.

bestC = -1;
bestRes = inf;
for i = 1:100
    tsp = tspGreedy(i);
    curr = travelingSalesman(tsp);
    if curr < bestRes
        bestRes = curr;
        bestC = tsp;
    end
end

%%
best = bestC;
travelingSalesman(best)

%disp('epsilon 5');
%best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,3,1,100,10,30);
%best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,3,1,100,10,30);
%travelingSalesman(best)

disp('epsilon 2');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,2,1,100,10,7);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,2,1,100,10,7);
travelingSalesman(best)
best = localSearch(@travelingSalesman,@swapTwoNeighboringCitiesProposal,best,1.5,1,100,7,7);
travelingSalesman(best)


disp('epsilon 1');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,1,1,100,5,3);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,1,1,100,10,3);
travelingSalesman(best)
best = localSearch(@travelingSalesman,@swapTwoNeighboringCitiesProposal,best,.5,1,100,10,3);
travelingSalesman(best)

disp('epsilon .1');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,.1,1,100,5,.5);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,.1,1,100,10,.5);
travelingSalesman(best)
best = localSearch(@travelingSalesman,@swapTwoNeighboringCitiesProposal,best,.05,1,100,5,.5);
travelingSalesman(best)

disp('epsilon .01');
best = localSearch(@travelingSalesman,@swapTwoCitiesProposal,best,.01,1,100,5,.05);
best = localSearch(@travelingSalesman,@swapTwoCitiesSmartProposal,best,.01,1,100,10,.05);
travelingSalesman(best)
best = localSearch(@travelingSalesman,@swapTwoNeighboringCitiesProposal,best,0,1,100,5,1);
travelingSalesman(best)