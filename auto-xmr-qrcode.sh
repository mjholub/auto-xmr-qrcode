#!/bin/zsh
#while true; do
clipboard="$(xclip -o)"
length=${#clipboard}
until [ "$length != 95" ]; do
sleep 1
done
dircheck() {
	if [[ ! -d "$HOME/XMR Adress book" ]]; then
	mkdir -p "$HOME/XMR Address book" && cd "$HOME/XMR Address book"
	return
	else
	cd "$HOME/XMR Address book"
	fi
}

if [ "$length" == 95 ]; then
	dircheck
	echo 'Press n for a temporary QR code (deleted after 10 minutes). To not generate a QR code, press q. Otherwise, type the filename:'
	read -r filename
	        if [ "$filename" = n ]; then
			qrencode -o tmp.png "$clipboard"
			xdg-open "tmp.png"
			xclip /dev/null
			sleep 600
			rm tmp.png
		elif [ "$filename" = q ]; then
			echo "$clipboard " > tmpclip 
			xclip tmpclip
			rm tmpclip
			clear
		else
			qrencode -o "$filename" "$clipboard"
			xdg-open "$filename"
			xclip /dev/null
		fi
	else 
	sleep 60
	clear
	fi
#sleep 15
#done
