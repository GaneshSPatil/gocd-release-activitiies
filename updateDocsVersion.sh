#!/bin/bash

CURRENT_VERSION="16.4.0"
VERSION_TO_RELEASE="16.5.0"
NEXT_VERSION="16.6.0"
REMOTE_NAME="origin"

DOCS_GOCD_REPO_LINK="https://github.com/GaneshSPatil/docs.go.cd"
DEVELOPER_GOCD_REPO_LINK="https://github.com/GaneshSPatil/developer.go.cd"

declare -a ALL_DOCS_REPO_URLS

ALL_DOCS_REPO_URLS=(
  "https://github.com/GaneshSPatil/docs.go.cd"
  "https://github.com/GaneshSPatil/developer.go.cd"
)

REPOS=(
  "docs.go.cd"
  "developer.go.cd"
)

echo "** Update various doc sites's '/current' and create a release branch"

for i in "${!ALL_DOCS_REPO_URLS[@]}"; do
  REPO_URL=${ALL_DOCS_REPO_URLS[$i]}
  REPO=${REPOS[$i]}
  mkdir $REPO
  echo "Cloning '$REPO_URL' into '$REPO'"
  # git clone $DOCS_GOCD_REPO_LINK
  echo "Done: Cloning '$REPO_URL'"

  cd $REPO
  echo "Bump up version to $NEXT_VERSION"
  # CURRENT_VERSION=$CURRENT_VERSION VERSION_TO_RELEASE=$VERSION_TO_RELEASE  NEXT_VERSION=$NEXT_VERSION REMOTE_NAME=$REMOTE_NAME rake bump_version

  echo "Done: Bump up version to $NEXT_VERSION"

  cd ..
done
