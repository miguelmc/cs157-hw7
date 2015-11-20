function out=circlesMixAll(x)
% Runs a random one of the circles proposal functions on the input

num = ceil(rand*6);

if num == 1
    out = circles1(x);
elseif num == 2
    out = circles2(x);
elseif num == 3
    out = circles3(x);
elseif num == 4
    out = circles4add10toall(x);
elseif num == 5
    out = circles5add10toOne(x);
elseif num == 6
    out = circles6(x);
end

end
    