from fastapi import FastAPI
from fastapi.responses import ORJSONResponse
from fastapi_utils.inferring_router import InferringRouter

from .typehints import Routes
from .views import buggy_view_1, buggy_view_2, list_items, read_item

routes: Routes = [
    ("/items/", list_items, ["GET"]),
    ("/items/{item_id}", read_item, ["GET"]),
    ("/buggy_1/", buggy_view_1, ["GET"]),
    ("/buggy_2/", buggy_view_2, ["GET"]),
]


def add_routes(app: FastAPI) -> None:
    router = InferringRouter()
    for url, handler, methods in routes:
        router.add_api_route(
            url, handler, methods=methods, response_class=ORJSONResponse
        )
    app.include_router(router)
