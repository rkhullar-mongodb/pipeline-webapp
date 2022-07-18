from fastapi import Depends, Request

from config import Settings


async def get_settings(request: Request) -> Settings:
    return request.app.extra['settings']


async def get_base_url(settings: Settings = Depends(get_settings)) -> str:
    return settings.base_url
