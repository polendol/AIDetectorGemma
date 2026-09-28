FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1


WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN useradd --create-home --uid 1001 appuser \
 && mkdir /data && chown appuser:appuser /data #new folder created for the txt files
USER appuser

COPY --chown=appuser:appuser . .

#reading and writing in relative paths
WORKDIR /data
CMD ["python", "/app/AI_detector_Gemma3qat.py"]