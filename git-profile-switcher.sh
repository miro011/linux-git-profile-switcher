#!/bin/bash

# put profiles in ~/.local/share/git/ - each in its own folder with whatever name

declare -a gitProfileNamesArr=()

for gitCfgDir in $(find "$HOME/.local/share/git" -type f -name '.gitconfig'); do
    gitProfileName=$(basename $(dirname "$gitCfgDir"))
    gitProfileNamesArr+=("$gitProfileName")
done

gitProfileNamesArr=($(printf '%s\n' "${gitProfileNamesArr[@]}" | sort)) # sort array
gitProfileNamesArr=('Reset' "${gitProfileNamesArr[@]}") # add reset as the first option

clear
echo "SELECT AN OPTION AND CLICK ENTER:"
for ((i=0; i<${#gitProfileNamesArr[@]}; i++)); do
    echo "[$i] ${gitProfileNamesArr[$i]}"
done

while true; do
    read uin
    uin=$(echo "$uin" | xargs) # trim
    if [[ "$uin" =~ ^[0-9]+$ && -v gitProfileNamesArr[$uin] ]]; then
        break
    else
        echo "Invalid input, try again."
    fi
done

find "$HOME" -maxdepth 1 -type f -iname ".git*" -delete

if [[ "$uin" != "0" ]]; then
    cp -r "$HOME/.local/share/git/${gitProfileNamesArr[$uin]}/". "$HOME"
fi
