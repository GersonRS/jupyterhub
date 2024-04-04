# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_CONTAINER=$REGISTRY/$OWNER/datascience-notebook
FROM $BASE_CONTAINER

LABEL org.opencontainers.image.maintainer="Jupyter Project <gersonrodriguesantos8@gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/GersonRS/jupyterhub
LABEL org.opencontainers.image.description="Jupyter Project"
LABEL org.opencontainers.image.licenses=MIT

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER ${NB_UID}

RUN mamba install --yes \
  'atom-ml[full]' \
  'boto3' \
  'mlflow' && \
  mamba clean --all -f -y && \
  fix-permissions "${CONDA_DIR}" && \
  fix-permissions "/home/${NB_USER}"
