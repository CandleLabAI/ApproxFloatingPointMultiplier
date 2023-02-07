function prod = exactfloat_mult(a,b)
%a*b
    [binVec1, sign1, exponent1, mantessa1] = de2fp(a,'single');
    [binVec2, sign2, exponent2, mantessa2] = de2fp(b,'single');
    if a == 0 || b == 0
        prod = zeros(1,32);
        return;
    end

    % Exponent calculation
    exp_prod = bi2de(exponent1,'left-msb')+bi2de(exponent2,'left-msb') - 127;
    
    % Sign Calculation
    sign_prod = xor(sign1,sign2);
    
    % Mantissa calculation
    temp1 = [1,mantessa1];
    temp2 = [1,mantessa2];
   
     si_prod = bi2de(temp1,'left-msb')*bi2de(temp2,'left-msb');
    si_prod = de2bi(si_prod,48,'left-msb');
    %Mantissa normalization
    [offset,frac_prod] = normalize(si_prod);
    exp_prod = exp_prod+offset;
    % Undeflow/Oveflow Detection
    if exp_prod <= 0
        error("Error: Exponent underflow.");
    elseif exp_prod >=255
        error("Error: Exponent overflow.");
    end
    prod = fp2de([sign_prod,de2bi(exp_prod,8,'left-msb'),frac_prod]);
end