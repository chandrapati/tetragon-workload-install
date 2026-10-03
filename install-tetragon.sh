#!/usr/bin/env bash
# Install Tetragon and the tetra CLI on a Linux workload (amd64).
# Script by Leonardo Milher.
#
# Run this on the workload: a VM, a bare-metal host, or any Linux host
# where you want the Tetragon agent. It is not the Kubernetes Helm install.
set -euo pipefail

curl -LO https://github.com/cilium/tetragon/releases/download/v1.7.1/tetragon-v1.7.1-amd64.tar.gz
curl -LO https://github.com/cilium/tetragon/releases/latest/download/tetra-linux-amd64.tar.gz
tar -xzf tetragon-v1.7.1-amd64.tar.gz
sudo tar -xzf tetra-linux-amd64.tar.gz -C /usr/local/bin/
sudo chmod +x /usr/local/bin/tetra
cd tetragon-v1.7.1-amd64/
sudo ./install.sh
