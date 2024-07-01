# tidal-connect

## Install docker for moOde

```code
sudo apt-get update
sudo apt-get install docker.io docker-compose
sudo usermod -a -G docker $USER
```

Put the content of this project into `/usr/local/tidal-connect/`  
Choose your .env file from samples folder, for example if you have "Apple USB-C to 3.5mm" soundcard, copy `samples/applejack.env` into `/usr/local/tidal-connect/` folder as `.env` file.  

Use the `build.sh` to show errors in logs while rebuilding docker image.

The build refresh the image apt source.list (archive replaced by legacy) and install libasound2-plugins package for providing speex/samplerate resamplers when it's needed.  

## Service install

Copy the `assets/systemd/system/tidal-connect.service` into `/etc/systemd/system/` folder.  

Start with `systemctl start tidal-connect`, it will run `docker-composer up -d --no-recreate` command.  
Set to autoload with `systemctl enable tidal-connect`

## Triggerhappy config
[Triggerhappy media.conf for cheap remote control use with Raspberry Pi and MoOde.](https://github.com/zamiere/tidal-connect/blob/main/assets/triggerhappy/triggers.d/media.conf)  
Remove `/etc/systemd/system/multi-user.target.wants/triggerhappy.service` symlink.
Override with a copy from `/lib/systemd/system/triggerhappy.service` to `/etc/systemd/system/triggerhappy.service` and change `--user nobody` to `--user pi` or another user with sudo access on moOde.
Reload the changed scripts with `systemctl daemon-reload`.
Enable the service with `systemctl enable triggerhappy` and restart with `systemctl restart triggerhappy`.
Check if a shortcut doesn't work with `systemctl status triggerhappy`.

## Control scripts

`next-song.sh`, `pause-song-sh`, `previous-song.sh` used by triggerhappy.  
You can watch the speaker-controller-application screen with `speaker-controller.sh` command, dont use "q" or "Ctrl+c" to exit, only detach from screen with "Ctrl+b", "d" keys.  
Read more about tmux commands [here](https://man7.org/linux/man-pages/man1/tmux.1.html)

More scripts with reading out current song title, etc. available [here](https://github.com/ce-designs/tidal-connect-docker)

## Apple USB-C to 3.5mm Headphone Jack on Moode (32bit) with softvol

Sample .env file:
[userconfig/applejack.asound.conf](https://github.com/zamiere/tidal-connect/blob/main/samples/applejack.env)

asound.conf:
[userconfig/applejack.asound.conf](https://github.com/zamiere/tidal-connect/blob/main/userconfig/applejack.asound.conf)

# tidal-connect upstream

Original project page with more instructions and config files available [here](https://github.com/GioF71/tidal-connect/)
