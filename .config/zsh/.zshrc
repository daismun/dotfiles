# Created by Murasaki
setopt auto_cd
typeset -g -A key

# BUllSHJIT

bindkey "^?" backward-delete-char
bindkey "^U"    backward-kill-line
bindkey "^u"    backward-kill-line
bindkey "^[l"   down-case-word
bindkey "^[L"   down-case-word

# alt+<- | alt+->
bindkey "^[f" forward-word
bindkey "^[b" backward-word

# ctrl+<- | ctrl+->
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey -s '^F' 'vifm^M'
bindkey -s '^G' 'mogrify -format jpeg -quality 75% -path cmpr/ -resize 75% *.{jpg,png}'


# Aliases {{{

alias caramel_mac='echo "40:8d:5c:f2:04:cd"'
alias sagej='sage -n jupyter'
alias move_by_date='for x in */*; do   d=$(date -r "$x" +%Y-%m-%d);   mkdir -p DATES/"$d";   mv -- "$x" DATES/"$d/"; done'
alias mnt_nya='mkdir ~/Nya && sshfs murasaki@nyarlathotep:$HOME ~/Nya'
alias umnt_nya="fusermount -u ~/Nya && rm -r ~/Nya"
alias vim='nvim'
alias vi="nvim --noplugin"
alias cat="bat"
alias fix_pulseaudio="pulseaudio --daemonize=no --exit-idle-time=-1"
alias p="doas pacman"
alias pm="pulsemixer"
alias am="alsamixer"
alias ls="exa -l --icons"
alias cls="clear && ls"
alias sw="sudo poweroff"
alias yt_gaut='yt-dlp --extract-audio --audio-format mp3 --output "%(uploader)s%(title)s.%(ext)s"'
alias yt_gat='yt-dlp --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s"'
alias gethw='(printf "\nCPU\n\n"; lscpu; printf "\nMEMORY\n\n"; free -h; printf "\nDISKS\n\n"; lsblk; printf "\nPCI\n\n"; lspci; printf "\nUSB\n\n"; lsusb; printf "\nNETWORK\n\n"; ifconfig) | less'
alias clip_ffmpeg='ffmpeg -ss 00:00:30.0 -i input.wmv -c copy -t 00:00:10.0 output.wmv'
alias compress_jpeg="echo 'guetzli is better, use it'"
alias compress_videos="echo 'ffmpeg -i input.mp4 -vcodec libx265 -crf 28 output.mp4'"
alias make_montage="echo 'montage -background 'RGB(17,5,44)' -geometry 1200x1200'"
alias upscale_images="mogrify -path output/ -filter Triangle -define filter:support=2 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -resize 1500 -quality 100 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip *.jpg"
# }}}

# Functions
function cd() {
	builtin cd $@
   ls
}

function mkcd() {
    mkdir -p "$*"
      cd "$*"
}

# Completion

zmodload zsh/complist 
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

jav () {
  if [ -z "$1" ] ; then
    read name
  else
    name="$1"
  fi
  links="$(curl -s "$(curl -s "https://www2.javhdporn.net/video/$name" | grep "embedURL" | grep -o "{.*}" | jq '.["@graph"]' | jq -r '.[].embedURL' | sed '/^null$/d' | sed 's/\/v\//\/api\/source\//')" --data-raw 'r=&d=javmvp.com' | jq -r '.data[] | select(.label | contains("720p", "480p","360p")).file' | tail -n1)"
  mpv "$links"
}


# Colored man
man() {
  env \
     LESS_TERMCAP_mb=$(printf "\e[1;31m") \
     LESS_TERMCAP_md=$(printf "\e[1;31m") \
     LESS_TERMCAP_me=$(printf "\e[0m") \
     LESS_TERMCAP_se=$(printf "\e[0m") \
     LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
     LESS_TERMCAP_ue=$(printf "\e[0m") \
     LESS_TERMCAP_us=$(printf "\e[1;32m") \
     man "$@"
}

# Prompt 
PROMPT='%F{6}%n%f@%F{9}%m%f %F{4}%B%~%b%f %# '

# Good stuff
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# vim: fdm=marker:
