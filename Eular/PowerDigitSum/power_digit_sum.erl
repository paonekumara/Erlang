% 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
% What is the sum of the digits of the number 21000?

% Ans:::powerDigitSum:main(2, 1000).            Result:1366

-module(power_digit_sum).
-export([main/2]).

main(Num, P) ->
    PD = exponent(Num, P),
    SOPD = sumOfPowerDigit(PD, 0),
    io:format("PD::~w. SOPD:~w. ~n", [PD, SOPD]).
%-----------------------------------   To get exp value of Num to the Power   -------------------------------------%
exponent(Num, Power) -> exponent(Num, Power, 1).

exponent(Num, Power, Result) when Power > 0 ->
    exponent(Num, Power - 1, Result * Num);
exponent(_, _, Result) -> Result.
%----------------------------------------   To check Prime Number   ----------------------------------------%
sumOfPowerDigit(Num, Result) when Num > 0 -> sumOfPowerDigit((Num div 10), Result + (Num rem 10));
sumOfPowerDigit(_, Result) -> Result.





% PD = math:pow(Num, P), 
% NewPd = list_to_integer(float_to_list((PD), [{decimals, 0}])),
% io:format("PD::~w. NewPd::~w. ~n", [PD, NewPd]),
