"""Application implementation - utilities.

Resources:
    1. https://aioredis.readthedocs.io/en/latest/

"""
from galaxy_mk2.app.utils.aiohttp_client import AiohttpClient
from galaxy_mk2.app.utils.redis import RedisClient


__all__ = ("AiohttpClient", "RedisClient")
