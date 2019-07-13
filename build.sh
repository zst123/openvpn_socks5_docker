#!/bin/bash

cat <<- 'EOF' >> ./theme
	dracula_theme_black="\[$(tput setaf 0)\]"
	dracula_theme_red="\[$(tput setaf 1)\]"
	dracula_theme_green="\[$(tput setaf 2)\]"
	dracula_theme_yellow="\[$(tput setaf 3)\]"
	dracula_theme_blue="\[$(tput setaf 4)\]"
	dracula_theme_magenta="\[$(tput setaf 5)\]"
	dracula_theme_cyan="\[$(tput setaf 6)\]"
	dracula_theme_white="\[$(tput setaf 7)\]"
	dracula_theme_clear_attributes="\[$(tput sgr0)\]"

	export PS1="${debian_chroot:+($debian_chroot)}${dracula_theme_yellow}\u@\h:${dracula_theme_green}\w${dracula_theme_red} # ${dracula_theme_clear_attributes}"
EOF

IMAGE="openvpn_holder"
docker build -t "$IMAGE" .

rm ./theme
