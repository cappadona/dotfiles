#!/usr/bin/env zsh

cd "$(dirname "${(%):-%x}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt;
else
	echo -en "This may overwrite existing files in your home directory. Are you sure? (y/n) "
	read -r yn
	if [[ $yn =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
