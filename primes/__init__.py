from sympy.ntheory import factorint
from cachier import cachier
import datetime


@cachier(stale_after=datetime.timedelta(days=15))
def prime_factors(num: int) -> [int]:
    return list(factorint(num))
