#! /bin/bash

# NOTE: do NOT call this script upload.sh if you do NOT want a infinite recursive loop downloading more and more upload.sh files...

if [ "$TRAVIS" == "" ]; then
    echo "Error: this script is supposed to run on Travis CI"
    exit 1
fi

# if not building for master, do not upload to GitHub
if [ "$TRAVIS_BRANCH" != "$TRAVIS_TAG" ] && [ "$TRAVIS_BRANCH" != "master" ]; then export TRAVIS_EVENT_TYPE=pull_request; fi

wget https://github.com/probonopd/uploadtool/raw/master/upload.sh

bash upload.sh Red_Eclipse_Legacy*.AppImage*
