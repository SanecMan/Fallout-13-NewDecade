#!/bin/bash
set -e

if [ "$BUILD_TOOLS" = true ]; then
	  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
      npm install -g gulp-cli
      pip install --user PyYaml -q
      pip install --user beautifulsoup4 -q
fi;


