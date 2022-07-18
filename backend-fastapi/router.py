from fastapi import APIRouter, Depends
from fastapi.responses import RedirectResponse

from depends import get_base_url
from util import async_httpx

router = APIRouter()


@router.get('/', response_class=RedirectResponse, status_code=302)
async def index():
    return 'docs'


@router.get('/hello')
async def hello(base_url: str = Depends(get_base_url)):
    result = list()
    result.append({'message': 'hello'})
    world_url = f'{base_url}/world'
    response = await async_httpx(method='get', url=world_url)
    response.raise_for_status()
    result.append(response.json())
    return result


@router.get('/world')
async def world():
    return {'message': 'world'}
