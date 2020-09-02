#!/bin/sh

# ghcr.io/imjohnbo/buildah-playground:sha
buildah bud -t ghcr.io/$GITHUB_REPOSITORY:$GITHUB_SHA .

buildah push --creds=$GITHUB_ACTOR:$CR_PAT ghcr.io/$GITHUB_REPOSITORY:$GITHUB_SHA
