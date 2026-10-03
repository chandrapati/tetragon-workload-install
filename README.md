# Install Tetragon on a workload

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=chandrapati.tetragon-workload-install&left_text=visitors)

Install [Tetragon](https://tetragon.io) and the `tetra` CLI **on the workload itself**: a Linux VM, a bare-metal host, or any amd64 Linux host where you want the agent. This is the package install that runs `install.sh` and starts the `tetragon` service. It is not the Kubernetes Helm install.

**Install script by Leonardo Milher.** These commands are his. They are written so they can be added to a Cisco Secure Workload host install script.

> Community notes, not an official Cisco or Tetragon product document. The packages come from the upstream [Tetragon releases](https://github.com/cilium/tetragon/releases). For kernel requirements and policy, use the [official installation docs](https://tetragon.io/docs/installation/).

---

## What lands on the workload

| Piece | Where it goes |
|---|---|
| Tetragon **v1.7.1** | Unpacked in the current directory, then installed by `install.sh` as a service |
| `tetra` CLI | `/usr/local/bin/tetra` |

Tetragon is pinned to **v1.7.1**. The `tetra` CLI is taken from the latest release asset, which is how the script was written.

You need a Linux **amd64** workload with `curl`, `tar`, and `sudo`.

---

## Install

On the workload:

```bash
curl -LO https://github.com/cilium/tetragon/releases/download/v1.7.1/tetragon-v1.7.1-amd64.tar.gz
curl -LO https://github.com/cilium/tetragon/releases/latest/download/tetra-linux-amd64.tar.gz
tar -xzf tetragon-v1.7.1-amd64.tar.gz
sudo tar -xzf tetra-linux-amd64.tar.gz -C /usr/local/bin/
sudo chmod +x /usr/local/bin/tetra
cd tetragon-v1.7.1-amd64/
sudo ./install.sh
```

The same commands are in [`install-tetragon.sh`](install-tetragon.sh).

---

## Check the workload

```bash
which tetra
tetra version
sudo systemctl status tetragon
```

`tetragon` should be active. `which tetra` should print `/usr/local/bin/tetra`.

Watch events on the workload. Leave this running, then open a second terminal on the same host and run any command:

```bash
tetra getevents -o compact
```

---

## Related

- [Tetragon in the eBPF world](https://github.com/chandrapati/tetragon-ebpf-segmentation) — what Tetragon observes and enforces, next to Cilium and Cisco Secure Workload
- [Tetragon installation](https://tetragon.io/docs/installation/)
- [tetra CLI](https://tetragon.io/docs/reference/cli/)
