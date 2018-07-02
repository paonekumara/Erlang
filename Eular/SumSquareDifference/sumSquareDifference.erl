% The sum of the squares of the first ten natural numbers is, 12 + 22 + ... + 102 = 385
% The square of the sum of the first ten natural numbers is,  (1 + 2 + ... + 10)2 = 552 = 3025
% Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

% Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  Answer %%%%%  %%%%%  %%%%%  %%%%%  %%%%%
% c(sumSquareDifference).
% sumSquareDifference:sumSquareDifferenceInSeriesOfNumbers(1, 10).    Answer is :: 2640
% sumSquareDifference:sumSquareDifferenceInSeriesOfNumbers(1, 20).    Answer is :: 41230

%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  %%%%% %%%%%  %%%%%  %%%%%  %%%%%  %%%%%

-module(sumSquareDifference).
% -export([sumOfTheSquareOfNumbersInSeries/2, squareOfTheSumOfNumbersInSeries/2]).
-export([sumSquareDifferenceInSeriesOfNumbers/2]).

%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  The sum of the squares of Numbers%%%%%  %%%%%  %%%%%  %%%%%  %%%%%
sumOfTheSquareOfNumbersInSeries(I, J) -> sumOfTheSquare(I, J, 0).

sumOfTheSquare(Z, Z, Sum) -> ((Z * Z) + Sum);
sumOfTheSquare(I, J, Sum) -> 
    Temp = (I * I) + Sum,
    sumOfTheSquare(I + 1, J, Temp).
%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  The squares of the sum of Numbers%%%%%  %%%%%  %%%%%  %%%%%  %%%%%
squareOfTheSumOfNumbersInSeries(I, J) -> squareOfTheSum(I, J, 0).

squareOfTheSum(Z, Z, Sum) -> 
    Temp = Z + Sum,
    (Temp * Temp);
squareOfTheSum(I, J, Sum) -> 
    Temp = I + Sum,
    squareOfTheSum(I + 1, J, Temp).
%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  Difference  %%%%%  %%%%%  %%%%%  %%%%%  %%%%%

sumSquareDifferenceInSeriesOfNumbers(I, J) ->
    A = squareOfTheSumOfNumbersInSeries(I, J),
    B = sumOfTheSquareOfNumbersInSeries(I, J),
    io:format("A::::~w B:::~w ~n", [A, B]),
    Difference = A - B,
    Difference.