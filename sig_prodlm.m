function [prod]= sig_prodlm(a,b,k,m)
    %%%%%%%%%% region of exactness %%%%%%%%%%%%
    %re_a = a(1:4);
    %re_b = b(1:4);
    %%%%%%%% region of approximation %%%%%%%%%%%%%%%
    if m==2
        for i=1:2:7
            if bi2de(a(k+i:k+i+1),'left-msb')>=2
                a(k+i:k+i+1) = [1 0];
            elseif bi2de(a(k+i:k+i+1),'left-msb')==1
                a(k+i:k+i+1) = [0 1];
            else
                a(k+i:k+i+1) = [0 0];
            end
        end
        for i=1:2:7
            if bi2de(b(k+i:k+i+1),'left-msb')>=2
                b(k+i:k+i+1) = [1 0];
            elseif bi2de(b(k+i:k+i+1),'left-msb')==1
                b(k+i:k+i+1) = [0 1];
            else
                b(k+i:k+i+1) = [0 0];
            end
        end
    end
    if m==4
        for i=1:4:5
            if bi2de(a(k+i:k+i+3),'left-msb')>=8
                a(k+i:k+i+3) = [1 0 0 0];
            elseif bi2de(a(k+i:k+i+3),'left-msb')>=4 && bi2de(a(k+i:k+i+3),'left-msb')<=7
                a(k+i:k+i+3) = [0 1 0 0];
            elseif bi2de(a(k+i:k+i+3),'left-msb')>1 && bi2de(a(k+i:k+i+3),'left-msb')<4
                a(k+i:k+i+3) = [0 0 1 0];
            elseif bi2de(a(k+i:k+i+3),'left-msb')==1
                a(k+i:k+i+3) = [0 0 0 1];
            else
                a(k+i:k+i+3) = [0 0 0 0];
            end
        end
        for i=1:4:5
            if bi2de(b(k+i:k+i+3),'left-msb')>=8
                b(k+i:k+i+3) = [1 0 0 0];
            elseif bi2de(b(k+i:k+i+3),'left-msb')>=4 && bi2de(b(k+i:k+i+3),'left-msb')<=7
                b(k+i:k+i+3) = [0 1 0 0];
            elseif bi2de(b(k+i:k+i+3),'left-msb')>1 && bi2de(b(k+i:k+i+3),'left-msb')<4
                b(k+i:k+i+3) = [0 0 1 0];
            elseif bi2de(b(k+i:k+i+3),'left-msb')==1
                b(k+i:k+i+3) = [0 0 0 1];
            else
                b(k+i:k+i+3) = [0 0 0 0];
            end
        end
    end
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
            %%%%%%%%%%
    prod = bi2de(a,'left-msb')*bi2de(b,'left-msb');
    prod = de2bi(prod,48,'left-msb');
     
            %%%%%%%%%%%%%%
    

end
            %%%%%%%%%%%%%%
    

end