-module(prime).
-export().

is_prime(N, I) -> 
    if 
        N rem I =:= 0 -> io:format("~w is not a prime number ~n", N),
    