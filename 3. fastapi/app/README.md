# To test it:
## Configure the Virtual Environment
### Install virtual environment
```$ python3 -m venv venv/ ```

### Active the venv
```$ source ./venv/bin/activate ```

```$ pip3 install -r backend/requirements.txt ```

## Run the app
```$ uvicorn app.main:app --host 0.0.0.0 --port 80 --reload```
```$ uvicorn main:app --reload```

## Test
```$ pytest```