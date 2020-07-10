#!/bin/bash

#Install cert conjur.pem  into Keystore
sudo keytool -import -alias conjur -keystore /etc/pki/java/cacerts -file /home/jmoses/conjur.pem

#Validate that conjur.pem is installed into keystore
sudo keytool -list -keystore /etc/pki/java/cacerts | grep conjur
