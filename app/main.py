from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles


app = FastAPI()


# Serve everything in /app/static (index.html will be the root document)
app.mount("/", StaticFiles(directory="app/static", html=True), name="static")