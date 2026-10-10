#!/usr/bin/env bash
# 旧Wixサイトから画像・PDFをダウンロードして static/ に保存する（初回のみ自動実行）
set -u
cd "$(dirname "$0")/.."
mkdir -p static/images static/files
fail=0
while IFS=$'\t' read -r name url; do
  [ -z "$name" ] && continue
  out="static/images/$name"
  [ -s "$out" ] && continue
  if curl -fsSL --retry 3 -o "$out" "$url"; then echo "OK  $name"; else echo "NG  $name ($url)"; rm -f "$out"; fail=$((fail+1)); fi
done < scripts/wix-images.tsv
[ -s static/files/campus-map.pdf ] || curl -fsSL --retry 3 -o static/files/campus-map.pdf \
  "https://6d4d9360-0c1d-495c-923a-83661062ddc4.filesusr.com/ugd/d1dce9_ac7038f936894f1585fc5dfc33238382.pdf" || echo "NG  campus-map.pdf"
# 大きすぎる写真を長辺1600pxに縮小（表示を軽くするため）
if command -v mogrify >/dev/null; then
  find static/images -maxdepth 1 -iname '*.jpg' -size +600k -exec mogrify -resize '1600x1600>' -quality 85 {} \;
fi
echo "failed: $fail"
