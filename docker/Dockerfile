FROM python:2.7-alpine

RUN apk add git 
RUN pip install configparser && pip install gitpython requests future jinja2 colorama
RUN mkdir /build && \
    cd /build && \
    MONOLITHE_REPO="https://github.com/nuagenetworks/monolithe.git" && \
    [[ -z "$MONOLITHE_BRANCH" ]] && MONOLITHE_BRANCH="master" && \
    [[ -z "$SPEC_TAG" ]] && SPEC_TAG="master" && \
    SPEC_REPO="https://github.com/nuagenetworks/vsd-api-specifications.git" && \
    VSPK_GENERATOR_REPO="https://github.com/nuagenetworks/vspkgenerator.git" && \
    GIT_REPOS_ROOT=/build/git && \
    VSPK_GENERATOR_HOME=$GIT_REPOS_ROOT/vspkgenerator && \
    SPECIFICATION_DIR=/api-specifications && \
    GENERATION_VERSION=$VSPK_VERSION && \
    PYTHONPATH=$GIT_REPOS_ROOT/monolithe && \
    mkdir -p "$GIT_REPOS_ROOT"  && \
    cd "$GIT_REPOS_ROOT" && \
    git clone $MONOLITHE_REPO && \
    git clone $SPEC_REPO "$SPECIFICATION_DIR" && \
    git clone $VSPK_GENERATOR_REPO $VSPK_GENERATOR_HOME && \
    cd $GIT_REPOS_ROOT/monolithe && git checkout $MONOLITHE_BRANCH && pip install . && \
    cd $VSPK_GENERATOR_HOME && pip install . && \
    rm -rf $GIT_REPOS_ROOT
COPY entrypoint.sh /

ENTRYPOINT ["sh","entrypoint.sh"]
