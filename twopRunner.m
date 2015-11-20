x0=1000*randn(2,20); %initial guess, unfortunately far from the origin (rows are legs and hips; columns are points in time)
% ONLY CHANGE THE LINE BELOW: (replace the 0's with carefully chosen positive numbers)
% twopRunner
% twop(x0)
% 
% ans =
% 
%    -4.4932 --> -8.1
epsilons=[10000 5000 1000 900 800 700 600 500 400 300 200 100 80 60 40 20 10 5 1 0.1]; %maybe need this
% pick a "schedule" for epsilon, that starts high, ends low, has perhaps
% 15-20 epsilons, and, when run, optimizes the function to less than 1
% for eps=epsilons,%loop through values in epsilons <-- must be a row vector
    for i=1:1, %run localSearch for 3 seconds per epsilon, plotting every .3 seconds
        x0=localSearch(@twop,@wideScaleRandomNoiseMix3Proposal,x0,0.000001,0,-1,1,0.01);
        figure(100); plot(x0); title(['eps=' num2str(eps)]);drawnow;
    end
    twop(x0);
% end
