# Wildfly mod_cluster load balancer and invmhttp service example

This repository contains an example how to use Wildfly server in standalone mode with mod_cluster and InvmHttp protocol. This configuration allow us to call any service deployed in our cluster without the knowledge on which server the requiered service is running.

### Deployment

We configure two Wildfly servers as mod_cluster load balancers and nodes. The servers will be called Node1 and Node2. Node1  will provide /invmhttp/rest/name service which will return the server name. Node2 server will provide /client/rest/invm service which will call /invmhttp/rest/name service using InvmHttp protocol.

![Deployment diagram](/diagrams/DeploymentDiagramModCluster.png?raw=true "Deployment diagram")

### Flow example

When we use mod_cluster with InvmHttp protocol then we don´t need to know on which server the service is running. For example  /client/rest/invm service on Node2 use /invmhttp/rest/name service. In this case Node2 doesn´t need to know on which server the /invmhttp/rest/name service is located. To call this service Node2 use URL in the form: invmhttp://{something}/invmhttp/rest/name. If the requested service is located on server localy, then the server will handle the request. Otherwise the server will forward the request to mod_cluster load ballancer (itself). Ballancer will find a host which will handle the request.

![Activity diagram](/diagrams/ActivityDiagram.png?raw=true "Activity diagram")

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
