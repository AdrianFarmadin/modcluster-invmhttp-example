#!/bin/bash
mkdir -p ~/bin
export PATH=~/bin:$PATH
[ ! -f "wildfly-10.0.0.CR5.zip" ] && wget http://download.jboss.org/wildfly/10.0.0.CR5/wildfly-10.0.0.CR5.zip
[ ! -f "~/.node1rc" ] && ./bin/setup.sh -i node1 -j $HOME/node1 -d $(pwd) -r wildfly-10.0.0.CR5
node1 configure config
node1 deploy invmhttp.war
[ ! -f "~/.node2rc" ] && ./bin/setup.sh -i node2 -j $HOME/node2 -o 100 -d $(pwd) -r wildfly-10.0.0.CR5    
node2 configure config
node2 deploy invmother.war
