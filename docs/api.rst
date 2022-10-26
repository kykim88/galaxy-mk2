API
===

This part of the documentation lists the full API reference of all classes and functions.

WSGI
----

.. autoclass:: galaxy_mk2.wsgi.ApplicationLoader
   :members:
   :show-inheritance:

Config
------

.. automodule:: galaxy_mk2.config

.. autoclass:: galaxy_mk2.config.application.Application
   :members:
   :show-inheritance:

.. autoclass:: galaxy_mk2.config.redis.Redis
   :members:
   :show-inheritance:

.. automodule:: galaxy_mk2.config.gunicorn

CLI
---

.. automodule:: galaxy_mk2.cli

.. autofunction:: galaxy_mk2.cli.cli.cli

.. autofunction:: galaxy_mk2.cli.utils.validate_directory

.. autofunction:: galaxy_mk2.cli.serve.serve

App
---

.. automodule:: galaxy_mk2.app

.. autofunction:: galaxy_mk2.app.asgi.on_startup

.. autofunction:: galaxy_mk2.app.asgi.on_shutdown

.. autofunction:: galaxy_mk2.app.asgi.get_application

.. automodule:: galaxy_mk2.app.router

Controllers
~~~~~~~~~~~

.. automodule:: galaxy_mk2.app.controllers

.. autofunction:: galaxy_mk2.app.controllers.ready.readiness_check

Models
~~~~~~

.. automodule:: galaxy_mk2.app.models

Views
~~~~~

.. automodule:: galaxy_mk2.app.views

.. autoclass:: galaxy_mk2.app.views.error.ErrorModel
   :members:
   :show-inheritance:

.. autoclass:: galaxy_mk2.app.views.error.ErrorResponse
   :members:
   :show-inheritance:

Exceptions
~~~~~~~~~~

.. automodule:: galaxy_mk2.app.exceptions

.. autoclass:: galaxy_mk2.app.exceptions.http.HTTPException
   :members:
   :show-inheritance:

.. autofunction:: galaxy_mk2.app.exceptions.http.http_exception_handler

Utils
~~~~~

.. automodule:: galaxy_mk2.app.utils

.. autoclass:: galaxy_mk2.app.utils.aiohttp_client.AiohttpClient
   :members:
   :show-inheritance:

.. autoclass:: galaxy_mk2.app.utils.redis.RedisClient
   :members:
   :show-inheritance:
