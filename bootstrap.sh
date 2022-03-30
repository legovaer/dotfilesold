#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

CURRENT_VERSION=$(cat .github/current_version)
SUBTITLE="by legovaer ${CURRENT_VERSION}"

clear;
printf '                                                             \n';
printf '                                                             \n';
printf '                                                             \n';
printf '                                                             \n';
printf '██████   ██████  ████████ ███████ ██ ██      ███████ ███████ \n';
printf '██   ██ ██    ██    ██    ██      ██ ██      ██      ██      \n';
printf '██   ██ ██    ██    ██    █████   ██ ██      █████   ███████ \n';
printf '██   ██ ██    ██    ██    ██      ██ ██      ██           ██ \n';
printf '██████   ██████     ██    ██      ██ ███████ ███████ ███████ \n';
printf '                                                             \n';
printf '%60s\n' "$SUBTITLE";
printf '                                                             \n';
printf '                                                             \n';

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
        --exclude ".gitignore" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
