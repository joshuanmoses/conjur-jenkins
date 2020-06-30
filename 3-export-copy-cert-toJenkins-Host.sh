#!/bin/bash

#Extract conjur.pem cert from DAP Master
docker exec -t dap1 bash -c "openssl s_client -showcerts -connect dap-master.cyber-ark-demo.local:443 < /dev/null 2> /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/conjur.pem"

#copy to Docker host
docker cp dap1:/tmp/conjur.pem .

#copy cert to Jenkins Host
sudo scp conjur.pem user01@10.0.0.20:/home/user01
