wsl --list --running --verbose

wsl --list --verbose

wsl --shutdown
wsl --export docker-desktop-data docker-desktop-data.tar
wsl --unregister docker-desktop-data
wsl --import docker-desktop-data D:\home\.docker .\docker-desktop-data.tar --version 2
