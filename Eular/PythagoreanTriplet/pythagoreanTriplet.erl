% A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

% a2 + b2 = c2
% For example, 32 + 42 = 9 + 16 = 25 = 52.

% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
% Find the product abc.

% Ans
% pythagoreanTriplet:pythagoreanTriplet(1000).        Product is:31875000

-module(pythagoreanTriplet).
-export([pythagoreanTriplet/1]).

pythagoreanTriplet(Limit) -> pythagoreanTriplet(2, 1, 0, Limit).

pythagoreanTriplet(_, _, Limit, Limit) -> io:format("Reached Max number.");
pythagoreanTriplet(M, N, Z, Limit) ->
    io:format("~n M:~w, N:~w, Z:~w, L:~w::::::::::::::::::::", [M, N, Z, Limit]),
    if
        M > N ->
                A = M * M - N * N,
                B = 2 * M * N,
                C = M * M + N * N,
                io:format("A:~w, B:~w, C:~w ~n", [A, B, C]),
                Sum = A + B + C,
                if 
                    Sum > Limit -> 
                        if  
                            (2 * (M * M)) > Limit -> io:format("Not found."),pythagoreanTriplet(M, N, Limit, Limit);
                            true -> pythagoreanTriplet(M + 1, 1, 0, Limit) end;
                    Sum < Limit -> pythagoreanTriplet(M, N + 1, Sum, Limit);
                    true -> io:format("Sum:~w and Limit:~w are Equal. Product is:~w~n", [Sum, Limit, (A * B * C)]), pythagoreanTriplet(M, N, Sum, Limit) end;
        true -> pythagoreanTriplet(M + 1, 1, 0, Limit) end.


