OS_NAME=${OS_NAME:-"DefaultOS"}

# aliases
alias py="python"
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h'
alias du='du -h'
alias ls='ls -a -F --color=auto --show-control-chars'
alias bashrc='vim ~/.bashrc'
alias reload='source ~/.bashrc'
alias ps='ps aux'
alias projects='cd ~/projects'

# prompt string 1
parse_git_branch() {
     git rev-parse --git-dir > /dev/null 2>&1
     if [ $? -ne 0 ]; then
        return
     fi
     local repo_name=$(basename `git rev-parse --show-toplevel`)
     local branch_name=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
     echo "${branch_name}"
}


PS1="\[\033[38;5;46m\]{$OS_NAME} \[\033[36m\](\u@\h) \[\033[33m\][\w] \[\033[35m\]\$(parse_git_branch)\[\033[0m\]\$ "
