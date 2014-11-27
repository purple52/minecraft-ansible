# Minecraft Ansible

Simplify managing Minecraft on your Ubuntu server using Ansible.

The following instructions are for setting up a Minecraft server from scratch using Ubuntu as the operating system. This can be done on a physical machine or a virtual machine. However, the basics in this project could easily be reused for managing an existing server or even multiple servers.

## Pre-setup

1. Install Ubuntu server edition, selecting the SSH Server option when prompted for addition software to install.
2. Copy your SSH key to the new server using `ssh-copy-id`.

## Setup

1. Install Ansible
2. Add your Minecraft server to `/etc/ansible/hosts`:

        [minecraft]
        your.hostname.or.ip.address

3.

3. Install the packages required for Ansible to work by running:

        ansible-playbook --ask-sudo-pass -l minecraft bootstrap.yml

## Installation

### Spigot

1. Add a variable defining where to find your copy of version 1649 of the Spigot jar to `/etc/ansible/hosts`:

           [minecraft:vars]
           spigot1649_path=/path/to/spigot1649.jar

2. Run the following to configure the server to run Spigot:

        ansible-playbook --ask-sudo-pass -l minecraft spigot-server.yml

## Updating Spigot

To update the patch applied to Spigot, either update the values in `roles/spigot-server/defaults/main..yml` or add
updated versions of the following variables to the `[minecraft:vars]` section of your `/etc/ansible/hosts`:

        # What version Spigot patch to apply
        spigot_patch_version: '20141113a'
        # MD5 checksum of the patch being applied
        spigot_patch_md5: '12ace759005798adf91d9fe4675fff48'
        # MD5 checksum of the finished, patched jar file
        spigot_patched_jar_md5: '870c9021be261bd285c966c642b23c32'

Then rerun:

        ansible-playbook --ask-sudo-pass -l minecraft spigot-server.yml

## Minecraft server console

To connect to the Minecraft server console:

1. SSH to your server.
2. Run:

        sudo -u minecraft tmux attach-session -t minecraft
