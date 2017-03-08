#!/bin/bash

CURRENT_VERSION="17.2.0"
VERSION_TO_RELEASE="17.3.0"
NEXT_VERSION="17.4.0"
REMOTE_NAME="origin"

declare -a ALL_DOCS_REPO_URLS

ALL_DOCS_REPO_URLS=(
  "https://github.com/gocd/docs.go.cd"
  "https://github.com/gocd/developer.go.cd"
  "https://github.com/gocd/api.go.cd"
  "https://github.com/gocd/plugin-api.go.cd"
)

REPOS=(
  "docs.go.cd"
  "developer.go.cd"
  "api.go.cd"
  "plugin-api.go.cd"
)

echo "** Update various doc sites's '/current' and create a release branch\n"

for i in "${!ALL_DOCS_REPO_URLS[@]}"; do

  REPO_URL=${ALL_DOCS_REPO_URLS[$i]}
  REPO=${REPOS[$i]}
  mkdir $REPO
  echo "Updating docs for: '$REPO'"

  echo "Cloning '$REPO_URL' into '$REPO'"
  git clone $DOCS_GOCD_REPO_LINK $REPO
  echo "Done: Cloning '$REPO_URL'"

  cd $REPO
  echo "executing in directory: $(pwd)"
  echo "Bump up version to $NEXT_VERSION"
  CURRENT_VERSION=$CURRENT_VERSION VERSION_TO_RELEASE=$VERSION_TO_RELEASE  NEXT_VERSION=$NEXT_VERSION REMOTE_NAME=$REMOTE_NAME rake bump_version

  echo "Done: Bump up version to $NEXT_VERSION"

  cd ..
  echo "Removing $REPO/"
  rm -rf $REPO

  echo "\n"
done
