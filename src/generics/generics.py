
from typing import TypeVar

T = TypeVar('T')

def id(x: T) -> T:
    return x