from pydantic import BaseSettings

__all__ = ("Config",)


class Config(BaseSettings):
    SENTRY_DSN: str = ""
