#!/usr/bin/env bash

GCLOUD_PROJECT="${GCLOUD_PROJECT:-''}"
GCLOUD_REGION="${GCLOUD_REGION:-''}"
CONTAINER_REPO="${CONTAINER_REPO:-''}"
REGISTRY="${GCLOUD_REGION}-docker.pkg.dev"

IMAGE_NAME="${1}"
IMAGE_VERSION="demo"
IMAGE_TAG="${REGISTRY}/${GCLOUD_PROJECT}/${CONTAINER_REPO}/${IMAGE_NAME}:${IMAGE_VERSION}"


echo "${IMAGE_TAG}"
