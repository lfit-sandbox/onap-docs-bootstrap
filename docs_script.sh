#!/bin/bash
wget -q https://github.com/lfit-sandbox/onap-docs-bootstrap/archive/master.tar.gz
sleep 1

#If docs dir exists:
tar xzf master.tar.gz \
  --wildcards 'onap-docs-bootstrap-master/docs/*' \
  --strip-components=1

#if .gitignore doesnt exist.
if [[ -f .gitignore ]]; then
tar xzf master.tar.gz \
  onap-docs-bootstrap-master/.gitignore \
  --strip-components=1 -O \
  > gitignore.stage
else
tar xzf master.tar.gz \
  onap-docs-bootstrap-master/.gitignore \
  --strip-components=1 -O \
  > .gitignore
fi

tar xzf master.tar.gz onap-docs-bootstrap-master/.readthedocs.yaml --strip-components=1 -O > .readthedocs.yaml

rm master.tar.gz
rm docs_script.sh

echo "Helper script run"

git status

echo "Any files with and directories with stage in their name need to be manually merged, as these files or directories already existed in your repo"


