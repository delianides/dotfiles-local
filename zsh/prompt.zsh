local ret_status="%(?:%{$fg_bold[green]%}☺ :%{$fg_bold[red]%}☹ %s)%{$reset_color%}"

export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) ${ret_status} %'
