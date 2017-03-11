#!/bin/bash

EXISTING_VERSION=$1
VERSION_TO_UPDATE=$2

GOCD_REPO_URL="https://github.com/gocd/gocd"
REPO="gocd"

echo "** Updating build.gradle file from $EXISTING_VERSION to $VERSION_TO_UPDATE revision\n"

#mkdir $REPO
echo "Cloning '$GOCD_REPO_URL' into '$REPO'"
git clone $GOCD_REPO_URL $REPO
echo "Done: Cloning '$GOCD_REPO_URL'"
cd $REPO
echo "executing in directory: $(pwd)"

sed -i "" "s/$EXISTING_VERSION/$VERSION_TO_UPDATE/g" build.gradle
git add .
git commit -m "Bump up version to $VERSION_TO_UPDATE"
git push
echo "Done: Bump up version to $VERSION_TO_UPDATE"

echo "Removing $REPO/"
cd ..
rm -rf $REPO

echo "\n"