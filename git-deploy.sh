#!/bin/bash

dir=$1
# If we are using a remote server we need the trailing colon for copy operations
if [ $# -eq 3 ]; then
	host=$3':'
else
	host=''
fi
# Confirms the directory we're copying to
echo $host$dir
# Copy everything
scp -rp . $host$dir
# Copy our git files to new locations in the remote .git directory
scp -rp git-remote-config $host$dir/.git/config
scp -rp git-hooks-post-update $host$dir/.git/hooks/post-update
# If we're working on a networked server we need to run this command by SSH
if [ $# -eq 3 ]; then
	ssh $3 chmod +x $dir/.git/hooks/post-update
else
	chmod +x $dir/.git/hooks/post-update
fi
# Add the remote using git bash
git remote add $2 $1/.git