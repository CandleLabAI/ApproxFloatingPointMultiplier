function [binVec, sign, exponent, mantessa] = de2fp(num,fmt)
% Converts a single/double precision floating point number to its 
% bitvector representation.
% Usage : 
% [binVec, sign , exponent, mantessa] = ieee754(X, fmt)
%
% X        : single/double precision floating point number.
% fmt      : target format, can be 'single' or 'double'.
%
% binVec   : 32/64 bit binary vector.
% s        : sign bit.
% exponent : exponent bits.
% mantessa : mantessa bits.

    % first convert to hex string
    if isequal(fmt, 'single')
        ieee_single = single(num);
        hexStr = num2hex(ieee_single);
    elseif isequal(fmt, 'double')
        ieee_double = double(num);
        hexStr = num2hex(ieee_double);
    else
        error('Unsupported precision format %s', fmt);
    end
    
    % convert hex string to bitvector
    binVec = [];
    b = '';
    for i=1:length(hexStr)
        switch hexStr(i)
        case {'0'}
            b = [0 0 0 0];
        case {'1'}
            b = [0 0 0 1];
        case {'2'}
            b = [0 0 1 0];
        case {'3'}
            b = [0 0 1 1];
        case {'4'}
            b = [0 1 0 0];
        case {'5'}
            b = [0 1 0 1];
        case {'6'}
            b = [0 1 1 0];
        case {'7'}
            b = [0 1 1 1];
        case {'8'}
            b = [1 0 0 0];
        case {'9'}
            b = [1 0 0 1];
        case {'A', 'a'}
            b = [1 0 1 0];
        case {'B', 'b'}
            b = [1 0 1 1];
        case {'C', 'c'}
            b = [1 1 0 0];
        case {'D', 'd'}
            b = [1 1 0 1];
        case {'E', 'e'}
            b = [1 1 1 0];
        case {'F', 'f'}
            b = [1 1 1 1];
        end
        binVec = [binVec,b];
    end
    
    % extract sign, exponent, mantessa bits
    if isequal(fmt, 'single')
        sign = binVec(1);
        exponent = binVec(2:9);
        mantessa = binVec(10:32);
    elseif isequal(fmt, 'double')
        sign = binVec(1);
        exponent = binVec(2:12);
        mantessa = binVec(13:64);
    else
        error('Unsupported precision format %s', fmt);
    end
end