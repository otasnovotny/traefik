# Traefik

If you want to run more services on your server you can use Traefik as a reverse proxy.
There are more reasons to put your services behind a reverse proxy but one of them is 
sharing of ports 80 and 443 for individual services.

## Example of use

Create DNS record at our domain, e.g. `traefik.example.com`

Clone directory
```
git clone git@github.com:otasnovotny/traefik.git
cd traefik
```

Create `acme.json`
```
touch ./data/acme.json
sudo chmod 600 ./data/acme.json
stat --format="%a" ./data/acme.json
```

Generate a hashed-password to access Traefik dashboard (need in the next step).
```
sudo apt install apache2-utils
echo $(htpasswd -nbB USER "your-awesome-password") | sed -e s/\\$/\\$\\$/g
```

Create `.env` and set your values
```
cp .env.template .env
```

Generate traefik static configuration `traefik.yml` (due to email from .env). 
Double check if email in `traefik.yml` is the same as `ADMIN_EMAIL` in `.env`. 
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