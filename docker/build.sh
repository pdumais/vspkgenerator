#!/bin/bash
set -e
set -x

VSPK_VERSION=$1
LANGUAGE_PLUGIN=$2
SPEC_TAG=$3

[[ -z "$MONOLITHE_REPO" ]] && MONOLITHE_REPO="https://github.com/nuagenetworks/monolithe.git"
[[ -z "$MONOLITHE_BRANCH" ]] && MONOLITHE_BRANCH="master"
[[ -z "$SPEC_REPO" ]] && SPEC_REPO="https://github.com/nuagenetworks/vsd-api-specifications.git"
[[ -z "$SPEC_TAG" ]] && SPEC_TAG="master"

export GIT_REPOS_ROOT=/build/git
export VSPK_GENERATOR_HOME=$GIT_REPOS_ROOT/vspkgenerator
export SPECIFICATION_DIR=$GIT_REPOS_ROOT/api-specifications
export GENERATION_VERSION=$VSPK_VERSION
export PYTHONPATH=$GIT_REPOS_ROOT/monolithe

mkdir -p "$GIT_REPOS_ROOT"

# Pull monolithe
cd "$GIT_REPOS_ROOT"
git clone $MONOLITHE_REPO
cd monolithe && git checkout $MONOLITHE_BRANCH && pip install .
 
# Pull the specs
cd "$GIT_REPOS_ROOT"
git clone $SPEC_REPO "$SPECIFICATION_DIR"
cd "$SPECIFICATION_DIR" 

cd $VSPK_GENERATOR_HOME
pip install .
generate-vspk -f $SPECIFICATION_DIR --generation-version $GENERATION_VERSION -L $LANGUAGE_PLUGIN -b $SPEC_TAG

