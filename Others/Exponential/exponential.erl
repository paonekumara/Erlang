-module(exponential).
-export([exponent/2]).

exponent(Num, Power) -> exponent(Num, Power, 1).

exponent(Num, Power, Result) -> %EX::::exponent(10, 3, 1)
    if
        (Power > 0) -> exponent(Num, Power - 1, Result * Num);
        true -> Result end.