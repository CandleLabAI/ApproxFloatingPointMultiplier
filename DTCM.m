function prod = DTCM(a,b,k,m)
%@param a : First floating point decimal input
%@param b : Second floating point decimal input
%@param k : Chunk Size
%@param m : Quantization paramter
    [binVec1, sign1, exponent1, mantessa1] = de2fp(a,'single'); % IEEE 754 equivalent of input a
    [binVec2, sign2, exponent2, mantessa2] = de2fp(b,'single'); % IEEE 754 equivalent of input a
    if a == 0 || b == 0
        prod = 0;
        return;
    end

    % Exponent calculation
    exp_prod = bi2de(exponent1,'left-msb')+bi2de(exponent2,'left-msb') - 127;
    
    % Sign Calculation
    sign_prod = xor(sign1,sign2);
    
    % Mantissa calculation
    temp1 = [1,mantessa1];
    temp2 = [1,mantessa2];
   
    si_prod = sig_prodlm(temp1,temp2,k,m); 
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
