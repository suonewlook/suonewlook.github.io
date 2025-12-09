#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "==> Add changes"
git add .

# 没有改动就退出
if git diff --cached --quiet; then
  echo "No changes to deploy."
  exit 0
fi

echo "==> Commit"
git commit -m "Content update: $(date "+%Y-%m-%d %H:%M")"

echo "==> Push"
git push origin main

echo "Done! 🚀"
