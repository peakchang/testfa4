from fastapi import FastAPI
from pydantic import BaseModel
from db_conn import engineconn
from db_class import Test

app = FastAPI()

engine = engineconn()
session = engine.sessionmaker()


class Item(BaseModel):
    name: str
    number: int


@app.get("/")
async def first_get():
    example = session.query(Test).all()
    return example


@app.post("/post")
async def first_post(item: Item):
    return item
