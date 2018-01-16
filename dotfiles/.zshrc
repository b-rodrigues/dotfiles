# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

unset PYTHONPATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-theme"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

bindkey -e

bindkey "^R" history-incremental-search-backward

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git,zsh-autosuggestions)

# User configuration

export PATH="~/.linuxbrew/bin:/home/cbrunos/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:~/.local/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias climacs="emacs --no-window-system"
alias fiprock="mpv http://webradiofip1.scdn.arkena.com/webradiofip1.mp3"
alias aroto="mpv 'http://streaming.radionomy.com/ArotoInstrumentalRadio?lang=en-US%2Cen'"
alias virgin="http://vr-live-mp3-128.scdn.arkena.com/virginradio.mp3"
alias fipjazz="mpv http://direct.fipradio.fr/live/fip-webradio2.mp3"
alias fipgroove="mpv http://direct.fipradio.fr/live/fip-webradio3.mp3"
alias fipmonde="mpv http://webradiofip4.scdn.arkena.com/webradiofip4.mp3"
alias fipnouveau="mpv http://webradiofip5.scdn.arkena.com/webradiofip5.mp3"
alias fipelectro="mpv http://direct.fipradio.fr/live/fip-webradio8.mp3"
alias fip45ans="mpv http://webradiofip6.scdn.arkena.com/webradiofip6.mp3"
alias nightplaza="mpv https://plaza.one/mp3"
alias fgclub="mpv http://radiofg.impek.com/fg6.m3u"
alias france24="mpv http://f24hls-i.akamaihd.net/hls/live/221192/F24_FR_LO_HLS/master_900.m3u8?Wse=4577tr"
alias fgu="mpv http://www.radiofg.com/streams/fgu.pls"
alias chilled="mpv rtmp://odw-e-04.sharp-stream.com/mosod/mp3:CHILLED.mp3"
alias fipstras="mpv http://chai5she.cdn.dvmr.fr/fipstrasbourg-midfi.mp3"
alias fip="mpv http://gisv3.tv-radio.com/station/fip_mp3/fip_mp3-128k.m3u"
alias nova="mpv http://broadcast.infomaniak.net/radionova-high.mp3"
alias update="sudo zypper ref && sudo zypper up"
alias install="sudo zypper in"
alias uninstall="sudo zypper rm"
alias search="zypper se"
alias rtl2="mpv http://streaming.radio.rtl2.fr/rtl2-1-48-192"
alias nrj="http://adwzg3.tdf-cdn.com/8470/nrj_165631.mp3"
alias xbox1player="sudo xboxdrv --detach-kernel-driver --mimic-xpad --led 2 --silent"
alias xbox2player="sudo xboxdrv --detach-kernel-driver --mimic-xpad --led 3 --silent"
alias meteolux="curl wttr.in/luxembourg"

# Setup zsh-autosuggestions
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#
## Enable autosuggestions automatically
#zle-line-init() {
#    zle autosuggest-start
#}
#
#zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
