***Azure DevTest Lab Overview – BigchainDB Getting Started***

This lab will have you load some simulated transations against your BigchainDB node and launch the admin portal.

You can then start it up (in the background, as a daemon) using:

`$ docker-compose up -d`

then you can load test transactions via:

`$ docker-compose run --rm bigchaindb bigchaindb-benchmark load`

If you’re on Linux, you can probably view the RethinkDB dashboard at:

`http://localhost:58080/`

Replace localhost with your VMs public IP address in the Azure console.