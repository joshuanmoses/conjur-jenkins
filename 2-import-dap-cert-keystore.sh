#!/bin/bash

# IMPORT: Basic Script to import DAP Master SSL Certificate into Keystore (docker-host2)

# Global Variables
keystoreDir="/etc/pki/java/cacerts"
certDir="/home/user01"
accountName="CAU"

# Import DAP Master SSL Certificate into Keystore (docker-host2)
echo "Import DAP Master SSL Certificate into Keystore (docker-host2)"
echo "------------------------------------"
set -x
sudo keytool -import -alias conjur -keystore $keystoreDir -file $certDir/conjur-$accountName.pem
set +x

# Verify DAP Master SSL Certificate is imported into Keystore (docker-host2)
echo "Verify DAP Master SSL Certificate is imported into Keystore (docker-host2)"
echo "------------------------------------"
set -x
sudo keytool -list -keystore $keystoreDir | grep conjur
set +x
