function [prod]= trunc_prodn(a,b,t)
    %%%%%%%%%% region of exactness %%%%%%%%%%%%
    a_c = bi2de(a(1:t),'left-msb');
    b_c = bi2de(b(1:t),'left-msb');
    x = bi2de([1,zeros(1,t-lod(a(1:t),t))],'left-msb');
    y = bi2de([1,zeros(1,t-lod(b(1:t),t))],'left-msb');
    dx = a_c - x;
    dy = b_c - y;
    prod_i = de2bi(x*y + x*dy + y*dx, 2*t,'left-msb');
    prod = [prod_i, zeros(1,2*(24-t))];
    %x = a(5:24-t);
    %y = b(5:24-t);
    % x = x +- dx, y = y+-dy
    % x.y = xy +-ydx +- xdy +dxdy 
    % 1 0 1 1 = x= 1 0 0 0
    % 1 1 1 1 = y = 1 0 0 0 
    %prod_l = 2^(length(x)+length(y)-2) + bi2de(b(6:24-t),'left-msb')*2^(length(x)-1)+bi2de(a(6:24-t),'left-msb')*2^(length(y)-1);
    %prod_h = bi2de(a(1:4),'left-msb')*bi2de(b(1:4),'left-msb')*2^(length(x)+length(y));
    %prod = prod_h+prod_l;
    %prod = de2bi(prod,2*(24-t),'left-msb');
    %prod = [prod,zeros(1,2*t)];
 
     
            %%%%%%%%%%%%%%
    

end
