#!/bin/sh

gitVersion=$(git --version | cut -d ' ' -f 3)
echo "Git version: $gitVersion"

curl "https://raw.githubusercontent.com/git/git/v$gitVersion/contrib/completion/git-completion.bash" -o "$HOME/.git/git-completion.bash"
curl "https://raw.githubusercontent.com/git/git/v$gitVersion/contrib/completion/git-prompt.sh" -o "$HOME/.git/git-prompt.sh"

