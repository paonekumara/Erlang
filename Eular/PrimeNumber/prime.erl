% Find entered number is a prime number or not
-module(prime).
-export([main/1]).

main(N) ->
    case is_prime(N) of
        1 -> io:format("~w is a Prime Number ~n", [N]);
        _ -> io:format("~w is not a Prime Number ~n", [N])
    end.
%----------------------------------------   Is Prime Number   ----------------------------------------%
is_prime(Num) -> io:format("1~n"), is_prime(Num, 2).

is_prime(Num, Num) when Num > 0 -> 1;
is_prime(0, 0) -> 0;
is_prime(N, I) when (N div 2) >= I ->
    Rem = N rem I,
    case Rem > 0 of
        true when (I + 1) >= (N div 2) -> is_prime(1, 1);
        true -> is_prime(N, I+1);
        false -> is_prime(0, 0)
    end;
is_prime(_, _) -> is_prime(1, 1).