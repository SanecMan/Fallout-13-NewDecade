#!/bin/bash
set -e

if [ "$BUILD_TOOLS" = true ]; then
	  apt-get install -y --yes npm
      npm install -g gulp-cli
      pip install --user PyYaml -q
      pip install --user beautifulsoup4 -q
fi;


