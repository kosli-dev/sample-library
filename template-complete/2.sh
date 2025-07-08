#!/bin/bash

# Get the current git commit SHA
GIT_SHA=$(git rev-parse HEAD)
ARTIFACT=artifact.txt
# Write the SHA to artifact.txt
echo "Git sha is: $GIT_SHA" > $ARTIFACT
# This script performs the following Kosli operations:
# 1. Begins a new Kosli trail for the specified Git commit, adding a description with the build number.
# 2. Attests an artifact to the Kosli trail, specifying artifact type, commit URL, commit hash, artifact file, build URL, and artifact name.
# 3. Retrieves the Kosli trail data in JSON format and saves it to 'data.json'.
#
# Required environment variables:
# - GIT_COMMIT: The Git commit hash to associate with the Kosli trail.
# - BUILD_NUMBER: The build number for description purposes.
# - COMMIT_URL: The URL to the commit in the source control system.
# - ARTIFACT: The path to the artifact file to attest.
# - BUILD_URL: The URL to the build/job in the CI system.

kosli begin trail ${GIT_COMMIT} --description "build number ${BUILD_NUMBER}"
kosli attest artifact --trail=${GIT_COMMIT} --artifact-type=file --commit-url=${COMMIT_URL} --commit=${GIT_COMMIT} $ARTIFACT --build-url=${BUILD_URL} --name=app

# Scenario 2: attest the sbom and junit, but fail one of them.
echo "here is an sbom" > sbom.json
echo "here is a Junit test file" >  junit.xml

kosli attest generic --name sbom --trail ${GIT_COMMIT} --attachments  sbom.json
kosli attest generic --name unit-tests --trail ${GIT_COMMIT} --attachments junit.xml --compliant=false

kosli get trail -o json ${GIT_COMMIT} > data.json
