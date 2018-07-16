% 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
% What is the sum of the digits of the number 21000?

% Ans:::powerDigitSum:main(2, 1000).            Result:1366

-module(powerDigitSum).
-export([exponent/2, sumOfPowerDigit/2, main/2]).


exponent(Num, Power) -> exponent(Num, Power, 1).

exponent(Num, Power, Result) -> %EX::::exponent(10, 3, 1)
    if
        (Power > 0) -> exponent(Num, Power - 1, Result * Num);
        true -> Result end.

sumOfPowerDigit(Num, Result) ->
    % io:format("Num:~w R:~w", [Num, Result]),
    if
        Num > 0 ->
            Rem = Num rem 10,
            Q = Num div 10,
            sumOfPowerDigit(Q, Result + Rem);
        true -> Result end.

main(Num, P) ->
    PD = exponent(Num, P),
    SOPD = sumOfPowerDigit(PD, 0),
    io:format("PD::~w. SOPD:~w. ~n", [PD, SOPD]).