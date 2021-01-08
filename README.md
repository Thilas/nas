# Synology NAS Configuration

This repository contains a bunch of scripts to help configure, maintain and operate a [Synology NAS](https://www.synology.com/products) ([DS218+](https://www.synology.com/products/DS218+) in my case).

## Features

- Provide `.bashrc` and `.profile` configuration
- Install [Entware-ng](https://entware.net/)
- Install [fish](https://fishshell.com/) with its configuration
- Change some permissions
  - Allow to use SSH keys
- Change default OpenSSH server configuration
  - Deny root and admin login
  - Allow TCP forwarding
- Install [Heimdall](https://github.com/linuxserver/Heimdall) ([docker](https://hub.docker.com/r/linuxserver/heimdall), [service](http://nassau:9080/))
- Install [Portainer](https://github.com/portainer/portainer) ([docker](https://hub.docker.com/r/portainer/portainer-ce), [service](http://nassau:9000/))
- Install [SSLH](https://github.com/yrutschle/sslh) ([docker](https://hub.docker.com/r/oorabona/sslh), [service](https://nassau:44322/))
- Install [Plex](https://www.plex.tv/) ([docker](https://hub.docker.com/r/plexinc/pms-docker), [service](http://nassau:32400/), [web](https://app.plex.tv/))
- Install [Plex Webhook for BetaSeries](https://github.com/Thilas/plex-betaseries-webhook) ([docker](https://hub.docker.com/r/thilas/plex-betaseries-webhook), [service](http://nassau:12000/))
- Install [Tautulli](https://github.com/Tautulli/Tautulli) ([docker](https://hub.docker.com/r/tautulli/tautulli), [service](http://nassau:8181/))
- Install [Medusa](https://github.com/pymedusa/Medusa) ([docker](https://hub.docker.com/r/linuxserver/medusa), [service](http://nassau:8081/))
- Install [Radarr](https://github.com/Radarr/Radarr) ([docker](https://hub.docker.com/r/linuxserver/radarr), [service](http://nassau:7878/))
- Install [Ubooquity](http://vaemendis.net/ubooquity/) ([docker](https://hub.docker.com/r/linuxserver/ubooquity), [service](http://nassau:2202/), [administration](http://nassau:2203/admin/))
- Install [Komga](https://github.com/gotson/komga) ([docker](https://hub.docker.com/r/gotson/komga), [service](http://nassau:8080/))

## Scripts

### `configure`

Each docker directory (`~/docker` and `~/media`) has a `configure` script that allows to configure the related `docker-compose.yml` file. It must be run once before starting the containers. They can be started using `nas` script (see below) or `docker-upgrade [docker|media]`

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
