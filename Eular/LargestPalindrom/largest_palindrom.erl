% A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

% Find the largest palindrome made from the product of two 3-digit numbers.

%Ans:::   largest_palindrom:largest_palindrom_from_product_of_two_numbers_each_with(3).     ::::906609

-module(largest_palindrom).
-export([largest_palindrom_from_product_of_two_numbers_each_with/1]).

largest_palindrom_from_product_of_two_numbers_each_with(NumberOfDigits) -> 
    UpperLimit = exponent(10, NumberOfDigits),
    LowerLimit = UpperLimit div 10,
    LP = largest_palindrom(LowerLimit, LowerLimit, 1, UpperLimit),
    io:format("LP is:~w ~n", [LP]).
%---------------------------------------------  Power of a Number   ---------------------------------------------%
exponent(Num, Power) -> exponent(Num, Power, 1).
exponent(Num, Power, Result) when Power > 0 -> exponent(Num, Power - 1, Result * Num);
exponent(_, _, Result) -> Result.
%---------------------------------------------  Power of a Number   ---------------------------------------------%
largest_palindrom(LL, UL, M, UL) when (LL =:= (UL - 1)) -> M;
largest_palindrom(LL, UL, M, UL) -> largest_palindrom(LL + 1, (UL div 10), M, UL);
largest_palindrom(I, J, Max, UL) ->
    MultiplicationResult = I * J,
    case is_palindrom(MultiplicationResult) of
        1 when Max > MultiplicationResult -> largest_palindrom(I, J + 1, Max, UL);
        1 -> largest_palindrom(I, J + 1, MultiplicationResult, UL);
        _ -> largest_palindrom(I, J + 1, Max, UL)
    end.
%%%%%   %%%%%   %%%%%   %%%%%   %%%%%  To check aNumber is a Palindrom  %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
is_palindrom(Num) -> is_palindrom(Num, Num, 0).

is_palindrom(OriginalNumber, Q, RevNumber) when Q =:= 0, OriginalNumber =:= RevNumber -> 1;
is_palindrom(_, Q, _) when Q =:= 0 -> 0;
is_palindrom(OriginalNumber, Q, RevNumber) ->
    Remainder = Q rem 10,
        TempQ = Q div 10,
        NewRevNumb = (RevNumber * 10) + Remainder,
        is_palindrom(OriginalNumber, TempQ, NewRevNumb).
    