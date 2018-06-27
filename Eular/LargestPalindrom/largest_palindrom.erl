% A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

% Find the largest palindrome made from the product of two 3-digit numbers.

-module(largest_palindrom).
-export([exponent/2, isPalindrom/1, largestPalindromFromProductOfTwoNumbersEachWith/1]).

exponent(Num, Power) -> exponent(Num, Power, 1).
exponent(Num, Power, Result) -> %EX::::exponent(10, 3, 1)
    if
        (Power > 0) -> exponent(Num, Power - 1, Result * Num);
        true -> Result end.


largestPalindromFromProductOfTwoNumbersEachWith(NumberOfDigits) -> 
    UpperLimit = exponent(10, NumberOfDigits),
    LowerLimit = UpperLimit div 10,
    largestPalindrom(LowerLimit, LowerLimit, 1, UpperLimit).

% largestPalindrom(99, UL, M, UL) -> io:format("Max Palindrom number is:~w ~n", [M]);
largestPalindrom(LL, UL, M, UL) -> 
    io:format("Change J"),
    if
        LL =:= (UL - 1) -> io:format("Max Palindrom number is:~w ~n", [M]);
        true -> io:format("Incrementing LL"), largestPalindrom(LL + 1, (UL div 10), M, UL)
    end;

largestPalindrom(I, J, Max, UL) ->
    MultiplicationResult = I * J,
    IsPalind = isPalindrom(MultiplicationResult),
    io:format("I::~w J::~w IsPalind::~w ~n", [I, J, IsPalind]),
    if
        IsPalind =:= 1 ->
            if
                Max > MultiplicationResult -> largestPalindrom(I, J + 1, Max, UL);
                true -> largestPalindrom(I, J + 1, MultiplicationResult, UL) end;
        true -> largestPalindrom(I, J + 1, Max, UL)
    end.

%%%%%   %%%%%   %%%%%   %%%%%   %%%%%  To check aNumber is a Palindrom  %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
isPalindrom(Num) -> isPalindrom(Num, Num, 0).

isPalindrom(OriginalNumber, TempNum, RevNumber) ->
    if 
        TempNum =:= 0 ->
        if 
            OriginalNumber =:= RevNumber -> io:format("Entered Number:~w is a palindrom ~n", [OriginalNumber]), 1;
            true -> io:format("Entered Number:~w is NOT a palindrom ~n", [OriginalNumber]), 0 
        end;
    true ->
        io:format("Checking"),
        Remainder = TempNum rem 10,
        Quotient = TempNum div 10,
        NewRevNumb = (RevNumber * 10) + Remainder,
        isPalindrom(OriginalNumber, Quotient, NewRevNumb) end.


% isPalindrom(OriginalNumber, TempNum, RevNumber) ->
%     io:format("Num::~w RevNumber::~w ~n", [TempNum, RevNumber]),
%     if TempNum > 0 -> 
%         Remainder = TempNum rem 10,
%         Quotient = TempNum div 10,
%         NewRevNumb = (RevNumber * 10) + Remainder,
%         isPalindrom(OriginalNumber, Quotient, NewRevNumb);
%     true -> io:format("Now the Quotient is zero...."),
%         if 
%             OriginalNumber =:= RevNumber ->
%                 io:format("Entered Number:~w is a palindrom", [OriginalNumber]);
%             true ->
%                 io:format("Entered Number:~w is NOT a palindrom", [OriginalNumber])
%             end;
%         io:format("Checking")
%     end.