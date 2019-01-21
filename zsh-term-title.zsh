autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn '\e]2;%n@%m:%~\a'
}
	
function xterm_title_preexec () {
	_cmd=($(echo $2))
	print -n "\e]2;${(q)_cmd[1]}\a"
}
	
if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi