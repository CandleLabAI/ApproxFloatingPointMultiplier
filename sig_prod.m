function [prod]= sig_prod(a,b,k,m)
%@param a : Extended mantissa of input 'a'
%@param b : Extended mantissa of input 'b'
%@param k : Chunk Size
%@param m : Quantization paramter

%logic for m =2
    if m==2
        for i=1:2:7
            if bi2de(a(k+i:k+i+1),'left-msb')>=2
                a(k+i:k+i+1) = [1 0];
            else
                a(k+i:k+i+1) = [0 0];
            end
        end
        for i=1:2:7
            if bi2de(b(k+i:k+i+1),'left-msb')>=2
                b(k+i:k+i+1) = [1 0];
            else
                b(k+i:k+i+1) = [0 0];
            end
        end
    end
 %logic for m=4
    if m==4
        for i=1:4:5
            if bi2de(a(k+i:k+i+3),'left-msb')>=8
                a(k+i:k+i+3) = [1 0 0 0];
            else
                a(k+i:k+i+3) = [0 0 0 0];
            end
        end
        for i=1:4:5
            if bi2de(b(k+i:k+i+3),'left-msb')>=8
                b(k+i:k+i+3) = [1 0 0 0];
            else
                b(k+i:k+i+3) = [0 0 0 0];
            end
        end
    end
 %logic for m=8
    if m==8
         if bi2de(a(k+1:k+8),'left-msb')>=128
                a(k+1:k+8) = [1 0 0 0 0 0 0 0];
            else
                a(k+1:k+8) = zeros(1,8);
         end
            if bi2de(b(k+1:k+8),'left-msb')>=128
                b(k+1:k+8) = [1 0 0 0 0 0 0 0];
            else
                b(k+1:k+8) = zeros(1,8);
            end
    end
     
        
    a(k+9:24) = zeros(1,24-8-k);
    b(k+9:24) = zeros(1,24-8-k);
    prod = bi2de(a,'left-msb')*bi2de(b,'left-msb');
    prod = de2bi(prod,48,'left-msb');
end
