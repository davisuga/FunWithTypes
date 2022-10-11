
from typing import TypeVar, List

T = TypeVar('T')

def id(x: T) -> T:
    return x

a = List[str]
