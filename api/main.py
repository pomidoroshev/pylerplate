import logging
from typing import cast

from fastapi import FastAPI
from fastapi_utils.timing import add_timing_middleware
import sentry_sdk
from sentry_sdk.integrations.asgi import SentryAsgiMiddleware

from .config import Config
from .routes import add_routes

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def create_app() -> FastAPI:
    config = Config()
    app = FastAPI()
    add_timing_middleware(app, record=logger.info, prefix="app", exclude="untimed")
    add_routes(app)

    if config.SENTRY_DSN:
        sentry_sdk.init(dsn=config.SENTRY_DSN)
        app = cast(FastAPI, SentryAsgiMiddleware(app))
    return app


app = create_app()
