# linux-git-profile-switcher
Simple script to switch between git profiles

- The way this works is you put your profiles in ~/.local/share/git
- Each in it's own folder. For example ~/.local/share/git/profile1; ~/.local/share/git/profile2
  - Each profile contains the appropriate files. For example: ".gitconfig" and ".git-credentials"
  - When the script runs and you select a profile and its files will be copied to your home folder.
