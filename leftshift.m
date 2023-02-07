function [array] = leftshift(a,n)
    x= circshift(a,[0,-n]);
    for i= length(a):-1:length(a)-n+1
        x(i) = 0;
    end
    array =x;
end