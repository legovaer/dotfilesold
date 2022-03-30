# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.secrets can be used for exports or settings you don’t want to commit.
for file in ~/.{path,secrets,exports,bash_prompt,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load fzf if it is installed.
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;
unset option;

# Load NVM script
source $(brew --prefix nvm)/nvm.sh
