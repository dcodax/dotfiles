# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
export ZSH_THEME="robbyrussell"
export OH_MY_ZSH_DEBUG="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx vundle virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Alias
alias tree="tree -C"

# Avoid django database problems
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Virtual envs configuration 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export PIP_VIRTUALENV_BASE=$WORKON_HOME # Tell pip to create its virtualenvs in $WORKON_HOME.
export PIP_RESPECT_VIRTUALENV=true # Tell pip to automatically use the currently active virtualenv.

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
	source /usr/local/bin/virtualenvwrapper.sh
else
	echo "WARNING: Can't find virtualenvwrapper.sh"
fi

if [[ -r /usr/local/bin/virtualenvwrapper_lazy.sh ]]; then
	source /usr/local/bin/virtualenvwrapper_lazy.sh
else
	echo "WARNING: Can't find virtualenvwrapper_lazy.sh"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Customize to your needs...
# homebrew python
export PATH=/usr/local/share/python:$PATH
# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH
export PATH=~/src/bin/:$PATH

