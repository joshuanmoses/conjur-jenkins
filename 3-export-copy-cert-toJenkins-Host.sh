#!/bin/bash

#Extract conjur.pem cert from DAP Master
docker exec -t dap1 bash -c "openssl s_client -showcerts -connect dap-master.myorg.local:443 < /dev/null 2> /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/conjur.pem"

#copy to Docker host
docker cp dap1:/tmp/conjur.pem .

#copy cert to Jenkins Host
sudo scp conjur.pem jmoses@10.10.10.100:/home/jmoses
