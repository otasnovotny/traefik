# Traefik

If you want to run more services on your server, you can use Traefik as a reverse proxy.

## Example of usage

Make acme.json
```
git clone git@github.com:otasnovotny/traefik.git
cd traefik
```

Make acme.json
```
mkdir data
cd data
touch acme.json
sudo chmod 600 acme.json
```

Generate traefik user / hashed-password to access Traefik dashboard.
```
sudo apt install apache2-utils
echo $(htpasswd -nbB USER "PASS") | sed -e s/\\$/\\$\\$/g
```

Create .env
```
# and set proper values!!!
cp .env.example .env
```

Generate traefik static configuration `traefik.yml` (due to email from .env). 
Doube check if email in `traefik.yml` is the same as `ADMIN_EMAIL` in `.env`.
It will be used in `./data/acme.json`.
```
env $(cat .env) envsubst < traefik.template.yml > traefik.yml
```

Create traefik network
```
docker network create traefik-network
```

Run service. 
```
docker compose up -d
```

In the browser type `DOMAIN` from your `.env`.
Usually it takes up to 2-3 minutes to generate acme certificates.