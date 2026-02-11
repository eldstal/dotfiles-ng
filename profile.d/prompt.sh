if [ "$UID" == "0" ]; then
	export PS1="\[\e[37m\]\u@\h\[\e[0m\]:\W\[\e[1;31m\]#\[\e[0m\] "
else
	export PS1="\[\e[37m\]\u@\h\[\e[0m\]:\W\[\e[38;5;81m\]\$\[\e[0m\] "
fi
