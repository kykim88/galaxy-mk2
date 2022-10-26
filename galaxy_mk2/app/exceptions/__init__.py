"""Application implementation - exceptions."""
from galaxy_mk2.app.exceptions.http import (
    HTTPException,
    http_exception_handler,
)


__all__ = ("HTTPException", "http_exception_handler")
