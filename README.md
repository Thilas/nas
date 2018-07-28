# Synology NAS Configuration
This repository contains a bunch of scripts to help configure, maintain and operate a [Synology NAS](https://www.synology.com/products) ([DS218+](https://www.synology.com/products/DS218+) in my case).

# Features
- Provide `.bashrc` and `.profile` configuration
- Install [Entware-ng](https://entware.net/)
- Install [fish](https://fishshell.com/) with its configuration
- Change some permissions
  - Allow to use SSH keys
- Change default OpenSSH server configuration
  - Deny root and admin login
  - Allow TCP forwarding
- Install [SSLH](https://github.com/yrutschle/sslh) ([docker](https://hub.docker.com/r/oorabona/sslh/), [service](http://192.168.1.1:44322/))
- Install [Plex](https://www.plex.tv/) ([docker](https://hub.docker.com/r/plexinc/pms-docker/), [service](http://192.168.1.1:32400/), [web](https://app.plex.tv/))
- Install [Tautulli](https://github.com/Tautulli/Tautulli) ([docker](https://hub.docker.com/r/tautulli/tautulli/), [service](http://192.168.1.1:8181/))
- Install [Medusa](https://github.com/pymedusa/Medusa) ([docker](https://hub.docker.com/r/linuxserver/medusa/), [service](http://192.168.1.1:8081/))
- Install [Radarr](https://github.com/Radarr/Radarr) ([docker](https://hub.docker.com/r/linuxserver/radarr/), [service](http://192.168.1.1:7878/))
- Install [Ubooquity](http://vaemendis.net/ubooquity/) ([docker](https://hub.docker.com/r/linuxserver/ubooquity/), [service](http://192.168.1.1:2202/), [administration](http://192.168.1.1:2203/admin/))

# Scripts
## nas
`nas` installs/upgrades/configures all features mentioned above. Logs are available in `~/.log/nas.log`.

## tvshows
`tvshows` allows to download automatically new tv shows from a remote server, fix their permissions and send them to Medusa's post-processing. Configuration is located in `~/.tvshows`. Logs are available in `~/.log/tvshows.log`.

# Resources
- https://github.com/Entware/Entware-ng/wiki/Install-on-Synology-NAS
- https://help.ubuntu.com/community/SSH/OpenSSH/Keys
- https://tech.setepontos.com/2018/03/25/control-synology-dsm-services-via-terminal-ssh/
