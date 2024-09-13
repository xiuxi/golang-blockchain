#!/bin/bash
source /etc/environment
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
	git branch --track "${branch##*/}" "$branch"
	git checkout ${branch##*/}
	value=${branch##*/}
	java j.zip_without_git_folder "${value}.zip"
	chmod a+x zip.sh
	./zip.sh
done
