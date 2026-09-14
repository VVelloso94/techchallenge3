# Build
FROM python:3.12-slim AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    VIRTUAL_ENV=/opt/venv

ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

WORKDIR /app

# Ambiente virtual
RUN python -m venv ${VIRTUAL_ENV}

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Runtime
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    VIRTUAL_ENV=/opt/venv

ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

RUN useradd -m -u 10001 appuser

WORKDIR /app

COPY --from=builder --chown=appuser:appuser ${VIRTUAL_ENV} ${VIRTUAL_ENV}

COPY --chown=appuser:appuser . .

USER appuser

EXPOSE 8000

CMD ["python", "app.py"]