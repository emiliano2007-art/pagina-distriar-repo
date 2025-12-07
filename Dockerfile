FROM python:3.11-slim

# set workdir to /app
WORKDIR /app

# install system deps
RUN apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev && rm -rf /var/lib/apt/lists/*

# copy requirements and install
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# copy backend source
COPY backend /app/backend

# create uploads folder
RUN mkdir -p /app/backend/uploads

# expose port
EXPOSE 8000

# default command
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
