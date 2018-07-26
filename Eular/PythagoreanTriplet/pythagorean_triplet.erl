% A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

% a2 + b2 = c2
% For example, 32 + 42 = 9 + 16 = 25 = 52.

% There exists exactly one Pythagorean triplet for which a + b + c = 1000.
% Find the product abc.

% Ans
% pythagorean_triplet:pythagorean_triplet(1000).        Product is:31875000

-module(pythagorean_triplet).
-export([pythagorean_triplet/1]).

pythagorean_triplet(Limit) -> pythagorean_triplet(2, 1, 0, Limit).

pythagorean_triplet(_, _, Limit, Limit) -> io:format("Reached Max number.");
pythagorean_triplet(M, N, _, Limit) when M < N -> pythagorean_triplet(M + 1, 1, 0, Limit);
pythagorean_triplet(M, N, _, Limit) ->
    A = M * M - N * N,
    B = 2 * M * N,
    C = M * M + N * N,
    io:format("A:~w, B:~w, C:~w ~n", [A, B, C]),
    Sum = A + B + C,
    case Sum > Limit of
        true when ((2 * (M * M)) > Limit) -> io:format("Not found."), pythagorean_triplet(M, N, Limit, Limit);
        true -> pythagorean_triplet(M + 1, 1, 0, Limit);
        false when Sum =:= Limit -> 
            io:format("Sum:~w and Limit:~w are Equal. Product is:~w~n", [Sum, Limit, (A * B * C)]),
            pythagorean_triplet(M, N, Sum, Limit);
        false -> pythagorean_triplet(M, N + 1, Sum, Limit)
    end.
