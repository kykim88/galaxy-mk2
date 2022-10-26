"""This project was generated with fastapi-mvc."""
import logging

from galaxy_mk2.wsgi import ApplicationLoader
from galaxy_mk2.version import __version__

# initialize logging
log = logging.getLogger(__name__)
log.addHandler(logging.NullHandler())

__all__ = ("ApplicationLoader", "__version__")
