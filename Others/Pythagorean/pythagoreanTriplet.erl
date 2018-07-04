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
                pythagoreanTriplet(M, N + 1, C, Limit);
        true -> pythagoreanTriplet(M + 1, 1, 0, Limit) end.


