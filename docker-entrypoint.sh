#!/usr/bin/env bash

VERSION=$(sha1sum ./app.jar | cut -c1-40)

export VERSION

exec "$@"
