#!bin/bash

# for debugging
set -ex

TARGET_BASE=

GIT_DIR=

while read oldrev newrev ref
do
    if [ "$ref" = "refs/heads/test" ]; then
        echo "Ref $ref received. Deploying test branch on server..."
        git --work-tree="${TARGET_BASE}_test" --git-dir="${GIT_DIR}" checkout -f test
    elif [ "$ref" = "refs/heads/prod" ]; then
        git --work-tree="${TARGET_BASE}_prod" --git-dir="${GIT_DIR}" checkout -f prod 
        echo "Ref $ref received. Deploying prod branch on server..."
    else
        echo "Ref $ref received. Doing nothing: only the test branch or prod branch may be deployed on this server"
    fi
done
