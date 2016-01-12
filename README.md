# Wildfly mod_cluster load balancer and invmhttp service example

This repository contains a configuration example of two Wildfly servers. Servers are running in standalone mode. Both servers are configurated as mod_cluster load balancers and nodes.

## Getting Started

### Prerequisites

We need to allow multicast on loopback because both servers are bind to localhost address. 
Run as root following commands.

```sh
ifconfig lo multicast
route add -net 224.0.0.0 netmask 240.0.0.0 dev lo
```

### Instalation

Run setup.sh script located in this repository.

```sh
$ ./setup.sh
```
