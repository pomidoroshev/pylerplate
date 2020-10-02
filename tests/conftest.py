from fastapi.testclient import TestClient
import pytest

from api import app


@pytest.fixture
def client():
    return TestClient(app)
