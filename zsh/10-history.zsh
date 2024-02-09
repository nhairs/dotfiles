# General references:
# - https://zsh.sourceforge.io/Doc/Release/Options.html
# - https://www.soberkoder.com/better-zsh-history/
# - https://unix.stackexchange.com/a/625366 (history duplicates related)
# - https://www.reddit.com/r/zsh/comments/wy0sm6/comment/ilujd15/

# The path/location of the history file
HISTFILE=~/.histfile
# The number of commands that are loaded into memory from the history file
HISTSIZE=1000000
# The number of commands that are stored in the zsh history file
SAVEHIST=1000000

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

# vim:ft=zsh
