gretag() {
  git tag -d $1 && git tag $1 && git push -f --tags
}
