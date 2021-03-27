# Synology NAS Configuration

This repository contains a bunch of scripts to help configure, maintain and operate a [Synology NAS](https://www.synology.com/products) ([DS218+](https://www.synology.com/products/DS218+) in my case).

## Features

- Provide `.bashrc` and `.profile` configuration
- Install [Entware-ng](https://entware.net/), a software repository for network attached storages, routers and other embedded devices
- Install [fish](https://fishshell.com/), a smart and user-friendly command line shell
- Change some permissions
  - Allow to use SSH keys
- Change default OpenSSH server configuration
  - Deny root and admin login
  - Allow TCP forwarding
- Install [Heimdall](https://github.com/linuxserver/Heimdall) ([docker](https://hub.docker.com/r/linuxserver/heimdall), [service](http://nassau:9080/)), an application dashboard and launcher
- Install [Portainer](https://github.com/portainer/portainer) ([docker](https://hub.docker.com/r/portainer/portainer-ce), [service](http://nassau:9000/)), a lightweight management UI which allows to easily manage your different Docker environments
- Install [SSLH](https://github.com/yrutschle/sslh) ([docker](https://hub.docker.com/r/oorabona/sslh), [service](https://nassau:44322/)), an applicative protocol multiplexer
- Install [Plex](https://www.plex.tv/) ([docker](https://hub.docker.com/r/plexinc/pms-docker), [service](http://nassau:32400/), [web](https://app.plex.tv/)), brings together all the media that matters to you
- Install [Plex Webhook for BetaSeries](https://github.com/Thilas/plex-betaseries-webhook) ([docker](https://hub.docker.com/r/thilas/plex-betaseries-webhook), [service](http://nassau:12000/)), a Plex webhook to mark series and movies as watched on BetaSeries
- Install [Tautulli](https://github.com/Tautulli/Tautulli) ([docker](https://hub.docker.com/r/tautulli/tautulli), [service](http://nassau:8181/)), a Python based monitoring and tracking tool for Plex Media Server
- Install [Medusa](https://github.com/pymedusa/Medusa) ([docker](https://hub.docker.com/r/linuxserver/medusa), [service](http://nassau:8081/)), an automatic video library manager for TV shows
- Install [Radarr](https://github.com/Radarr/Radarr) ([docker](https://hub.docker.com/r/linuxserver/radarr), [service](http://nassau:7878/)), a fork of Sonarr to work with movies à la CouchPotato
- Install [Ubooquity](http://vaemendis.net/ubooquity/) ([docker](https://hub.docker.com/r/linuxserver/ubooquity), [service](http://nassau:2202/), [administration](http://nassau:2203/admin/)), a free home server for your comics and ebooks library
- Install [Komga](https://github.com/gotson/komga) ([docker](https://hub.docker.com/r/gotson/komga), [service](http://nassau:8080/)), a media server for comics/mangas/BDs with API and OPDS support

## Scripts

### `configure`

Each docker directory (`~/docker` and `~/media`) has a `configure` script that allows to configure the related `docker-compose.yml` file. It must be run once before starting the containers. They can be started using `nas` script (see below) or `docker-upgrade [docker|media]`

### `fix-plex-transcoder`

`fix-plex-transcoder` grants the required rights on `/dev/dri` for Plex [Hardware-Accelerated Streaming](https://support.plex.tv/articles/115002178853-using-hardware-accelerated-streaming/) feature to work correctly.

This script must be triggered from DSM Task Scheduler on boot-up using the `root` account in order to restore the permissions after a reboot.

### `fix-srt`

`fix-srt` allows to fix `.srt` subtitle files so they work correctly with Plex. Basically, it ensures that all files end with at least 2 empty lines.

### `nas`

`nas` installs/upgrades/fixes/starts all features mentioned above. Logs are available in `~/.log/nas.log`.

### `tvshows`

`tvshows` allows to download automatically new tv shows from a remote server, fix their permissions (using `sudo`) and send them to Medusa's post-processing. Configuration is located in `~/.tvshows`. Logs are available in `~/.log/tvshows.log`.

`tvshows` automatically impersonates the user configured for media services so the script can be run from root as well as from the configured user. It allows to easily schedule `tvshows`.

## Media

By default, all media services (Plex, Plex Webhook for BetaSeries, Tautulli, Medusa, Radarr and Ubooquity) use the following locations:

- `~/.docker`: contains the configuration of each service
- `/volume1/media`: contains all media files (i.e. `books`, `comics`, `movies`, `music`, `tvshows`)

This `media` directory is customizable (thanks to the `configure` script) but it must be created using DSM before configuring docker containers. All required subdirectories will then be created automatically, as well as `downloads/movies` and `downloads/tvshows` subdirectories.

## Resources

- [Install on Synology NAS](https://github.com/Entware/Entware-ng/wiki/Install-on-Synology-NAS)
- [SSH Key Authentication](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)
- [How to Control Synology DSM Services via Terminal / SSH](https://tech.setepontos.com/2018/03/25/control-synology-dsm-services-via-terminal-ssh/)
- [Plex on Docker on Synology: enabling Hardware Transcoding](https://medium.com/@MrNick4B/plex-on-docker-on-synology-enabling-hardware-transcoding-fa017190cad7)
- [SRT subtitles on Chromecast constistently disappear a few minutes before the movie end](https://forums.plex.tv/t/srt-subtitles-on-chromecast-constistently-disappear-a-few-minutes-before-the-movie-end/510491/36)
