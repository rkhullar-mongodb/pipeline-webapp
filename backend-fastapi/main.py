import uvicorn
from fastapi import FastAPI

from config import Settings
from router import router


def create_app(settings: Settings, test: bool = False) -> FastAPI:
    app = FastAPI(settings=settings)
    app.include_router(router)
    return app


settings = Settings()
app = create_app(settings)

if __name__ == '__main__':
    uvicorn.run('main:app', host=settings.service_host, port=settings.service_port, reload=settings.debug)