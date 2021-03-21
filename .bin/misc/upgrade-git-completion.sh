#!/bin/sh
home="${1:-$HOME}"

version=$(git --version | cut -d ' ' -f 3)
echo "git version: $version"

mkdir -p "$home/.bash_completion"
curl "https://raw.githubusercontent.com/git/git/v$version/contrib/completion/git-completion.bash" -o "$home/.bash_completion/git-completion.bash"
. "$home/.bash_completion/git-completion.bash"
curl "https://raw.githubusercontent.com/git/git/v$version/contrib/completion/git-prompt.sh" -o "$home/.bash_completion/git-prompt.sh"
. "$home/.bash_completion/git-prompt.sh"
