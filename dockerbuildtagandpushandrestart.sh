#!/bin/sh
set -e

echo " "
echo "          WE"
echo "     DOIN"
echo "  SOME"
echo "     GANGSTER"
echo "        SHIT"
echo "    UP"
echo "  IN"
echo "    HERE"
echo "  "


TARGET=$1

if [ -z "$TARGET" ]; then
  echo "no target"
  exit 1
fi

echo "TARGET: $TARGET"

cd $TARGET
docker build . -t ghcr.io/highlord-syagrius/$TARGET:latest
docker push ghcr.io/highlord-syagrius/$TARGET:latest
cd ..

sudo kubectl rollout restart deployment $TARGET

echo ""
