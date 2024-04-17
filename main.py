import subprocess
import multiprocessing
import time
from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get('/health')
def response_success():
    return None


def ping_dns():
    while True:
        subprocess.call(['ping', '1.1.1.1', '-c', '1'])
        subprocess.call(['ping', '8.8.8.8', '-c', '1'])
        time.sleep(5)


if __name__ == '__main__':
    process = multiprocessing.Process(target=ping_dns)
    try:
        process.start()
        uvicorn.run(app,host='0.0.0.0', port=8000)

    except KeyboardInterrupt:
        print('stop')
    finally:
        process.terminate()
