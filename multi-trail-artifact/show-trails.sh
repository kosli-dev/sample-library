#!/bin/bash
set -e

FINGERPRINT=$(kosli fingerprint artifact.txt --artifact-type file)

kosli search $FINGERPRINT --output json > result.json

cat result.json