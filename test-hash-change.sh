#!/usr/bin/env bash

echo GIT VERSION: $(git --version)
echo Getting initial Hash of "Web"
yarn -s build --dry-run=json \
  | jq '.tasks[] | select(.package=="web") | .hash'

echo Making Change to file

# add comment to last line of file
echo "// $(date)" >> ./apps/web/pages/index.tsx

echo Getting new Hash of "Web"
yarn -s build --dry-run=json \
  | jq '.tasks[] | select(.package=="web") | .hash'

# reset last line
sed -i '$ d' ./apps/web/pages/index.tsx
