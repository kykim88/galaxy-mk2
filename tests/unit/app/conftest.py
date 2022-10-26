import pytest
from fastapi.testclient import TestClient
from galaxy_mk2.app import get_application
from galaxy_mk2.config import settings


@pytest.fixture
def app():
    # Overriding to true in order to initialize redis client on FastAPI event
    # startup handler. It'll be needed for unit tests.
    settings.USE_REDIS = True
    app = get_application()

    with TestClient(app) as client:
        yield client
