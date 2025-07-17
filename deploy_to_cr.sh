#!/bin/bash

#gcloud secrets create tools --data-file=tools.yaml
gcloud secrets versions add tools --data-file=tools.yaml

export IMAGE=us-central1-docker.pkg.dev/database-toolbox/toolbox/toolbox:latest

gcloud run deploy toolbox \
    --image $IMAGE \
    --service-account toolbox-identity \
    --region europe-southwest1 \
    --set-secrets "/app/tools.yaml=tools:latest" \
    --args="--tools-file=/app/tools.yaml","--address=0.0.0.0","--port=8080" \
    --allow-unauthenticated


