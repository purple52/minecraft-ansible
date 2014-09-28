# Minecraft Ansible

Simplify managing Minecraft on your Ubuntu server using Ansible.

The following instructions are for setting up a Minecraft server from scratch using Ubuntu as the operating system. This can be done on a physical machine or a virtual machine. However, the basics in this project could easily be reused for managing an existing server or even multiple servers.

## Pre-setup

1. Install Ubuntu server edition, selecting the SSH Server option when prompted for addition software to install.
2. Copy your SSH key to the new server using ssh-copy-id.

## Setup

1. Install Ansible
2. Add your Minecraft server to /etc/ansible/hosts
    [minecraft]
    your.hostname.or.ip.address
3. Install the packages required for Ansible to work by running:
    ansible-playbook --ask-sudo-pass -l minecraft bootstrap.yml

## Minecraft installation

1. Run the following to install Minecraft:
    ansible-playbook --ask-sudo-pass -l minecraft minecraft.yml
