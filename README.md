# Dotfiles

cf https://www.atlassian.com/git/tutorials/dotfiles

```
git clone --bare <git-repo-url> $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
config config status.showUntrackedFiles no
```

if problem with checkout :

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

