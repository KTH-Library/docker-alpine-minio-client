# minio and minio client

An example with a `docker-compose.yml` file and two services:

- minio exposed on port 9000 and 9001 (regular minio web UI and also the "console" web UI)
- minio client in an alpine container, showing 1m periodically scheduled jobs

## What is shown?

The `Dockerfile` uses a minimal alpine base layer and adds the "minio client" binary. Advantages:

- The "mc" image is much smaller (36 MB vs 136 MB) than the stock "minio/mc" image and does not have its entrypoint overridden. 
- Alpine has crond from busybox pre-installed. 
- Output there is logged so it by default is visible using "docker-compose logs -f mc"

> How is the "minio client" connection to the "minio server" configured?

- In `docker-compose.yml`, an environment variable for the "mc" service sets up a connection to the object storage service "minio".

> How are transfers scheduled periodically?

- The script in ./cron/scripts/1m runs periodically in the "mc" service.

## Using locally

See the Makefile targets for building etc.

To test locally, add hostnames to /etc/hosts (ie console.data.mydomain.org and data.mydomain.org)

## References

Traefik integration:

- https://techoverflow.net/2022/03/27/a-working-traefik-docker-compose-minio-setup-with-console/

Secure multi-tenant object storage:

- https://blog.min.io/secure-multi-tenant-object-storage/

Standalone console

- https://github.com/minio/console#start-console-service
