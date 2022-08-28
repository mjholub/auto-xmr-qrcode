#!/bin/bash
clipboard="$(xclip -o)"
length=${#clipboard}
dircheck() {
	if [[ ! -d "$HOME/XMR Adress book" ]]; then
	mkdir -p "$HOME/XMR Address book" && cd "$HOME/XMR Address book"
	return
	else
	cd "$HOME/XMR Address book" || return
	fi
}
if [ "$length" == 95 ]; then
	dircheck
	echo 'Press n for a temporary QR code (deleted after 10 minutes). To not generate a QR code, press q. Otherwise, type the filename (without extension):'
	read -r filename
	        if [ "$filename" = n ]; then
			qrencode -o tmp.png "$clipboard"
			xdg-open "tmp.png"
			xclip /dev/null
			sleep 600
			shred tmp.png
		elif [ "$filename" = q ]; then
			echo "$clipboard " > tmpclip 
			xclip tmpclip
			shred tmpclip
			clear
		else
		echo 'Also save to a text file? (y/n)'
		read -r contacts
		if [ "$contacts" = y ]; then
		if [ ! -f "default" ]; then
		touch default
		else
		echo "$filename" ":" "$clipboard" >> default
		fi
		else
		return
		fi
			qrencode -o "$filename".png "$clipboard"
			xdg-open "$filename"
			xclip /dev/null
		fi
	else 
	sleep 60
	clear
	fi
#sleep 15
#done
