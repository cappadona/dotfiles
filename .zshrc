# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,bash_prompt,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nick/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nick/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/nick/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nick/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
