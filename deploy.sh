#!/bin/bash
set -e

# 进入博客目录（保险）
cd "$(dirname "$0")"

echo "==> Pull latest (safe)"
git pull --rebase || true

echo "==> Add changes"
git add .

# 如果没有任何改动就退出
if git diff --cached --quiet; then
  echo "No changes to deploy."
  exit 0
fi

echo "==> Commit"
git commit -m "Content update: $(date "+%Y-%m-%d %H:%M")"

echo "==> Push"
git push origin main

echo "Done! 🚀"
