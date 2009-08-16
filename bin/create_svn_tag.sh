#!/bin/bash -e
#
# Assumes repository is laid out like .../$package/{trunk,branches,tags}/...

dh_testdir

PKG_NAME=$(dpkg-parsechangelog | grep '^Source:' | awk '{print $2}')
PKG_VER=$(dpkg-parsechangelog | grep '^Version:' | awk '{print $2}')
CUR_URI=$(svn info debian | grep '^URL:' | awk '{print $2}')
TAG_URI=$(echo "$CUR_URI" | sed "s@/branches/.*\$@/tags/$PKG_VER@")

echo "Copying: $CUR_URI"
echo "To:      $TAG_URI"

svn copy "$CUR_URI" "$TAG_URI" -m "Tagging $PKG_NAME $PKG_VER release."
