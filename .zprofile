# If we are in WSL then configure Windows path variables.
# TODO: Find out why this still runs in Docker container.
if grep -qi microsoft /proc/version; then
	export WINHOME=$(wslpath -u "$(powershell.exe '$env:Userprofile' | tr -d '\r')")
	export APPDATA=$WINHOME/AppData/Roaming
	export DESKTOP=$WINHOME/Desktop
	export DOWNLOADS=$WINHOME/Downloads
	# If Google Drive is mounted then set some more path variables.
	if [ -d "/mnt/g" ] ; then
		export GDRIVE=/mnt/g/My\ Drive
		export GBACKUPS=/mnt/g/My\ Drive/Backups
	fi
	# If we have a Wezterm config file then set the environment variable to it.
	if [ -f "$WINHOME/.wezterm.lua" ] ; then
		export WEZTERMCONFIG=$WINHOME/.wezterm.lua
	fi
fi

# Make Homebrew packages available.
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# If we are on Windows and have Neovide installed through scoop then add it to our PATH.
if [ -d "$WINHOME/scoop/apps/neovide/current" ] ; then
	PATH="$WINHOME/scoop/apps/neovide/current:$PATH"
fi

# If cargo is installed then source its env file.
if [ -f "$HOME/.cargo/env" ] ; then
	. "$HOME/.cargo/env"
fi

# If Volta is installed then add it to our PATH.
if [ -d "$HOME/.volta" ] ; then
	export VOLTA_HOME="$HOME/.volta"
	export VOLTA_FEATURE_PNPM=1
	if [ -d "$VOLTA_HOME/bin" ] ; then
		export PATH=$VOLTA_HOME/bin:$PATH
	fi
fi

# If there is a local bin directory then add it to our PATH.
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# If there is a code directory env file then source it.
if [ -f "$HOME/code/env" ] ; then
	. "$HOME/code/env"
fi

export EDITOR="nvim"

# Proxy
# export HTTP_PROXY=http://192.168.0.100:3128
# export HTTPS_PROXY=http://192.168.0.100:3128
# export NO_PROXY=127.0.0.1,localhost
