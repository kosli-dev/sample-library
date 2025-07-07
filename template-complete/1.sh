#!/bin/bash

# Get the current git commit SHA
GIT_SHA=$(git rev-parse HEAD)
ARTIFACT=artifact.txt
# Write the SHA to artifact.txt
echo "Git sha is: $GIT_SHA" > $ARTIFACT

kosli begin trail ${GIT_COMMIT} --description "build number ${BUILD_NUMBER}"
kosli attest artifact --trail=${GIT_COMMIT} --artifact-type=file --commit-url=${COMMIT_URL} --commit=${GIT_COMMIT} $ARTIFACT --build-url=${BUILD_URL} --name=app
kosli get trail -o json ${GIT_COMMIT} > data.json
