function [B] = rightshift(A,n) 
    B=zeros(size(A));
    B(n+1:end)=A(1:end-n);
end