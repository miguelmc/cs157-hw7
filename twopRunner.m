% This implementation gives us a solid >7 score, which is what we need.
% NOTE: we decided to call our runner Jamie.

% Initial guess, this is just making the runner two 4 long steps as strong
% as possible, which gets us pretty good start, and having a good start
% helps us overall.  
x0=[ones(2,5) -1*ones(2,5) ones(2,5) -1*ones(2,5)];

% Same as 1.3c, we just start very permissive with big eplsilons and then
% continue to lower them. We avoid big epsilons since we already have a
% more or less working initial ground to work with.
% The only difference from 1.3c is that we use wideScaleRandomNoiseMix3Proposal.

% Parameters to localSearch:
% startingX: our initial input (as above)
% epsilon: we decrease the epsilon values because we want to perform fewer 
% neutral moves as we continue minimizing. 
% lowerBoundOnX: range correlates to right or left
% upperBoundOnX: range correlates to right or left
% timeDelta: chosen on trial and error, we found 5 works well
% funcDelta: chosen on trial and error, we found that 5 times epsilon works
% well

epsilons=[.1 .01 .001 .0001 .00001 .000001];
for eps=epsilons,
    % disp(sprintf('Epsilon %d', eps));
    x0=localSearch(@twop,@wideScaleRandomNoiseMix3Proposal,x0,eps,-1,1,5,eps*5);
end
