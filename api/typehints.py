"""
Local type aliases
"""

from typing import Any, Callable, List, Tuple

Handler = Callable[..., Any]
Routes = List[Tuple[str, Handler, List[str]]]
