# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_CONTAINER=$REGISTRY/$OWNER/datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <gersonrodriguesantos8@gmail.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER ${NB_UID}

RUN mamba install --yes \
  'atom-ml[full]' \
  'boto3' \
  'mlflow' && \
  mamba clean --all -f -y && \
  fix-permissions "${CONDA_DIR}" && \
  fix-permissions "/home/${NB_USER}"
