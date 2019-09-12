#!/bin/sh

version=$(git --version | cut -d ' ' -f 3)
echo "git version: $version"

mkdir "$HOME/.bash_completion"
curl "https://raw.githubusercontent.com/git/git/v$version/contrib/completion/git-completion.bash" -o "$HOME/.bash_completion/git-completion.bash"
curl "https://raw.githubusercontent.com/git/git/v$version/contrib/completion/git-prompt.sh" -o "$HOME/.bash_completion/git-prompt.sh"

