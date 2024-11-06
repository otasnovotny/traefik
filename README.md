# Traefik

If you want to run more services on your server, you can use Traefik as a reverse proxy.

## Example of usage

```bash
# make acme.json
git clone git@github.com:otasnovotny/traefik.git
cd traefik

# make acme.json
mkdir data
cd data
touch acme.json
sudo chmod 600 acme.json

# create network
docker network create traefik-network

# generate traefik user/hashed-password
sudo apt install apache2-utils
echo $(htpasswd -nbB USER "PASS") | sed -e s/\\$/\\$\\$/g

# create .env - and set values!!!
cp .env.example .env

# run service
docker compose up -d
# usually it takes up to 2-3 minutes to generate acme certificates
```

