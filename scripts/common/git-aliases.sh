echo
echo "Setting up Git aliases..."
git config --global alias.gst status
git config --global alias.gdf diff
git config --global alias.gco checkout
git config --global alias.gci commit
git config --global alias.gscam "git commit -S -a -m"
git config --global alias.gcan "commit -S --amend --no-edit -a"
git config --global alias.gcp cherry-pick
git config --global alias.gbr branch
git config --global alias.gsta stash
git config --global alias.glg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.grb "rebase"
git config --global alias.grm "rebase master"
git config --global alias.grim "rebase -i master"