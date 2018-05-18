#!/bin/sh
# From https://stackoverflow.com/questions/6666489/is-there-a-simple-command-to-convert-a-branch-to-a-tag

BRANCHNAME=$1
TAGNAME=$2

echo "Request to convert the branch ${BRANCHNAME} to a tag with the same name accepted."
echo "Processing..."
echo " "

git show-ref --verify --quiet refs/heads/${BRANCHNAME}
# $? == 0 means local branch with <branch-name> exists. 

if [ $? == 0 ]; then
   git checkout ${BRANCHNAME}
   git tag ${BRANCHNAME}
   git checkout master
   git branch ${BRANCHNAME} -d
   echo " "
   echo "Updated list branches, sorted chronologically: "
   echo "---------------------------------------------- "
   git log --no-walk --date-order --oneline --decorate $(git rev-list --branches --no-walk) | cut -d "(" -f 2 | cut -d ")" -f 1
else
   echo "Sorry. The branch ${BRANCHNAME} does NOT seem to exist. Exiting."
fi
