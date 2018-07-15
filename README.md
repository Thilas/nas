# Synology NAS Configuration
This repository contains a bunch of scripts to help configure, maintain and operate a Synology NAS (DS218+ in my case).

# Features
- Provide `.bashrc` and `.profile` configuration 
- Install Entware-ng
- Change some permissions
  - Allow to use SSH keys
- Change default OpenSSH server configuration
  - Deny root and admin login
  - Allow TCP forwarding
- Install Docker
  - [Plex](https://hub.docker.com/r/plexinc/pms-docker/)
  - [Medusa](https://hub.docker.com/r/linuxserver/medusa/)
  - [Radarr](https://hub.docker.com/r/linuxserver/radarr/)
  - [Ubooquity](https://hub.docker.com/r/linuxserver/ubooquity/)

# Resources
- https://github.com/Entware/Entware-ng/wiki/Install-on-Synology-NAS
- https://tech.setepontos.com/2018/03/25/control-synology-dsm-services-via-terminal-ssh/
