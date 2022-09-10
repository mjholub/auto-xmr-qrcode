# auto-xmr-qrcode
## Automatic QR code for Monero

A Shell script that can be assigned to a keyboard shortcut to read the clipboard and when the length of the sting in it matches the standard Monero address length, generates a QR code with the address using qrencode. The code can be either stored in a temporary file, or kept in an address book directory under the filename provided by user.

### Install dependencies:

Pacman:
`sudo pacman -Syy qrencode xclip xdg-open`

Apt:
`sudo apt update && sudo apt install qrencode xclip xdg-open`

Dnf:
`sudo dnf install qrencode xclip xdg-open`
