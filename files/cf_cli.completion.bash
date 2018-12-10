_cf-cli-completion() {
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 "${COMP_WORDS[@]}"))
    return 0
}
complete -F _cf-cli-completion cf
