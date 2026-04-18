#!/usr/bin/env bash
# Tạo bài viết mới với đầy đủ frontmatter + folder ảnh.
# Cách dùng:
#   ./scripts/new-post.sh "Tên bài viết của mình"
#   ./scripts/new-post.sh "Tên bài viết" --draft   # tạo trong _drafts/

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 \"Tiêu đề bài viết\" [--draft]"
  exit 1
fi

TITLE="$1"
DRAFT=false
[ "$2" = "--draft" ] && DRAFT=true

# Tạo slug: lowercase, bỏ dấu tiếng Việt, thay space bằng dash
SLUG=$(echo "$TITLE" \
  | iconv -f utf-8 -t ascii//TRANSLIT 2>/dev/null \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')

# Fallback nếu iconv không có trên Windows: tự thay chữ có dấu
if [ -z "$SLUG" ] || [ "$SLUG" = "-" ]; then
  SLUG=$(echo "$TITLE" \
    | tr '[:upper:]' '[:lower:]' \
    | sed 'y/àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ/aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd/' \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')
fi

DATE=$(date +%Y-%m-%d)
DATETIME=$(date +"%Y-%m-%d %H:%M:%S %z")
FILENAME="${DATE}-${SLUG}.md"
IMG_DIR="assets/img/posts/${DATE}-${SLUG}"

if $DRAFT; then
  POST_PATH="_drafts/${FILENAME}"
else
  POST_PATH="_posts/${FILENAME}"
fi

if [ -e "$POST_PATH" ]; then
  echo "File đã tồn tại: $POST_PATH"
  exit 1
fi

mkdir -p "$IMG_DIR"
touch "$IMG_DIR/.gitkeep"

cat > "$POST_PATH" <<EOF
---
title: "${TITLE}"
date: ${DATETIME}
categories: [Chuyên mục]
tags: [tag1]
math: false
mermaid: false
pin: false
image:
  path: /${IMG_DIR}/cover.png
  alt: ${TITLE}
---

## Mở bài

<!-- viết mở bài ở đây -->

## Nội dung

<!-- nội dung chính -->

## Kết luận

<!-- tóm tắt -->
EOF

echo "✓ Tạo bài viết: $POST_PATH"
echo "✓ Folder ảnh:   $IMG_DIR/"
if $DRAFT; then
  echo "→ Đây là draft. Preview bằng: bundle exec jekyll serve --drafts"
  echo "→ Khi xong, move sang _posts/ để xuất bản."
fi
