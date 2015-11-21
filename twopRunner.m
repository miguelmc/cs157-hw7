% This implementation gives us a solid >7 score, which is what we need.
% NOTE: we decided to call our runner Jamie.

%initial guess, this is just making the runner two 4 long steps as strong
%as possible, which gets us pretty good start.
x0=[ones(2,5) -1*ones(2,5) ones(2,5) -1*ones(2,5)];

% Same as 1.3c, we just start very permissive with big eplsilons and then
% continue to lower them. We avoid big epsilons since we already have a
% more or less working initial ground to work with.
% The only difference from 1.3c is that we use wideScaleRandomNoiseMix3Proposal.
epsilons=[.1 .01 .001 .0001 .00001 .000001];% .0000001 .00000001]; %maybe need this
for eps=epsilons,
    % disp(sprintf('Epsilon %d', eps));
    x0=localSearch(@twop,@wideScaleRandomNoiseMix3Proposal,x0,eps,-1,1,5,eps*5);
end
