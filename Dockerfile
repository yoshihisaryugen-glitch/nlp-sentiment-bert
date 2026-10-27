FROM python:3.9-slim-bookworm

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY docker/sitecustomize.py /usr/local/lib/python3.9/site-packages/sitecustomize.py

# Match the host user (macOS uid 501 / gid 20) so notebook saves stay writable.
RUN if ! getent group 20 >/dev/null; then groupadd --gid 20 jupyter; fi \
    && useradd --uid 501 --gid 20 --create-home --shell /bin/bash jupyter

WORKDIR /workspace
COPY --chown=501:20 . /workspace

USER jupyter
EXPOSE 8888

CMD ["jupyter", "notebook", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--notebook-dir=/workspace", \
     "--NotebookApp.token=", \
     "--NotebookApp.password="]
