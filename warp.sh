#!/bin/bash

wget https://github.com/bepass-org/warp-plus/releases/download/v1.2.3/warp-plus_linux-amd64.zip

if [ $? -ne 0 ]; then
  echo "دانلود فایل warp-plus ناموفق بود."
  exit 1
fi

apk add --no-cache unzip

unzip warp-plus_linux-amd64.zip

if [ $? -ne 0 ]; then
  echo "استخراج فایل warp-plus ناموفق بود."
  exit 1
fi

rm warp-plus_linux-amd64.zip

nohup ./warp-plus > warp-plus.log 2>&1 &

if [ $? -ne 0 ]; then
  echo "اجرای warp-plus ناموفق بود."
  exit 1
fi

echo "ok"
