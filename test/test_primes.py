import primes


def test_answer():
    assert primes.prime_factors(3) == [3]
    assert primes.prime_factors(47653834) == [2, 587, 40591]
