# **README.md**
### A Dockerfile for [Apache ActiveMQ](http://activemq.apache.org/)

---
# **Description**
***ActiveMQ version - 5.9.0***
### Boilerplate Stuff
 * Based on Ubuntu 14.04
 * Will automatically update and upgrade Linux packages


### Dockerfile Build Application Specifics
 * Automatically installs the following:
   * curl
   * default Java JRE
 * Pulls ActiveMQ version 5.9.0 from the Apache download archive
 * Exposes the default ports for:
   * ActiveMQ web front end - 8161
   * OpenWire transport listener - 61616
   * AMPQ transport listener - 5672
   * STOMP transport listener - 61613
   * MQTT transport listener - 1883 
   * WS transport listener - 61614
 * Creates a volume to the default configuration directory so the user
   can mount his/her own configuration directory. Default configuration
   files from Apache are included in this repository

---
# **Usage**
## Building the image
To build the image from the Dockerfile
```sh
sudo docker build -t nickmich/activemq:5.9.0 .
```
## Starting the container
 * Use the following to run the minimum for AMQ. Update the port mappings as needed for the transport listeners.
```sh
sudo docker run -d --name amq -p 8161:8161 -v $PWD/conf:/opt/apache/activemq/apache-activemq-5.9.0/conf nickmich/activemq:5.9.0
```
## Kicking the tires
 * To verify the container is up and running normally:
```sh
sudo docker ps
```
and confirm that your container shows up
 * To verify AMQ is running:
```sh
sudo docker inspect <container name>
```
and search for IP address of the container (or just use localhost).
 * In your browser, navigate to : < ip-address >:8161/admin and confirm you can login

