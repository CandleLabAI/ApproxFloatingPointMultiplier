function [decimal] = fp2de(bitVec)
% Converts a single/double precision floating point number in its 
% bitvector representation to decimal number.
% Usage : 
% dec = ieee754(X)
%
% X        : single/double precision floating point number in bitVector 
%            repesentation.
% dec      : equivalent decimal number (single/double depending on size of 
%            input bitVector)

    N = length(bitVec);
    
    if ~(N == 32 || N == 64)
        error("Unsupported input length: "+num2str(N));
    end
    
   
    % bitVector to hexString
    hexStr = char('0' + zeros(1,N/4));
    
    i = 1;
    for j = 1:4:length(bitVec)
        switch bi2de(bitVec(j:j+3), 'left-msb')
            case 0
                hexStr(i) = '0';
            case 1
                hexStr(i) = '1';
            case 2
                hexStr(i) = '2';
            case 3
                hexStr(i) = '3';
            case 4
                hexStr(i) = '4';
            case 5
                hexStr(i) = '5';
            case 6
                hexStr(i) = '6';
            case 7
                hexStr(i) = '7';
            case 8
                hexStr(i) = '8';
            case 9
                hexStr(i) = '9';
            case 10
                hexStr(i) = 'a';
            case 11
                hexStr(i) = 'b';
            case 12
                hexStr(i) = 'c';
            case 13
                hexStr(i) = 'd';
            case 14
                hexStr(i) = 'e';
            case 15
                hexStr(i) = 'f';
        end
        i = i+1;
    end
    
    if N == 32
        decimal=typecast(uint32(hex2dec(hexStr)),'single');
    elseif N == 64
        decimal=hex2num(hexStr);
    end

end
