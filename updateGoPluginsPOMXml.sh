#!/bin/bash

RELEASED_VERSION=$1
NEXT_VERSION=$2

GO_PLUGINS_REPO_URL="https://github.com/gocd/go-plugins"
REPO="go-plugins"

echo "** Updating version in pom.xml file from $RELEASED_VERSION to $NEXT_VERSION \n"

mkdir $REPO
echo "Cloning '$GO_PLUGINS_REPO_URL' into '$REPO'"
git clone $GO_PLUGINS_REPO_URL $REPO
echo "Done: Cloning '$GO_PLUGINS_REPO_URL'"
cd $REPO
echo "executing in directory: $(pwd)"

sed -i "" "s/$RELEASED_VERSION/$NEXT_VERSION/g" pom.xml
git add .
git commit -m "Update GO version in pom.xml from $RELEASED_VERSION to $NEXT_VERSION"
git push
echo "Done: Bump up version to $NEXT_VERSION"

echo "Removing $REPO/"
cd ..
rm -rf $REPO

echo "\n"