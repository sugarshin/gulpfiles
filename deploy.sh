#!/usr/bin/env sh

git add --all
git commit -m $(date)
git subtree push -P dst origin gh-pages --squash
