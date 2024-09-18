git clone git@github.com:otasnovotny/traefik.git
cd traefik

# make acme.json
mkdir data
cd data
touch acme.json
sudo chmod 600 acme.json

# create network
docker network create traefik-network

docker compose up -d
#wait 2-3 mins to generate acme certificates

# generate traefik user/hashed-password
echo $(htpasswd -nbB USER "PASS") | sed -e s/\\$/\\$\\$/g