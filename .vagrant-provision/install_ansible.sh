#!/bin/bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "Installing ansible"
apt-get update
apt-get install -y vim curl wget make git pipx

# Najnowszy Ansible z PyPI (pakiet z repozytorium Ubuntu bywa kilka wydań wstecz);
# pipx instaluje go w izolowanym środowisku, a polecenia trafiają do /usr/local/bin.
export PIPX_HOME=/opt/pipx
export PIPX_BIN_DIR=/usr/local/bin
pipx install --force ansible

# kolekcja z modułami docker (docker_compose_v2) używana przez projekt/
ansible-galaxy collection install -p /usr/share/ansible/collections community.docker community.mysql

echo "Done"
