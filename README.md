# gatekeeper

if RUBY_ENV="development" read from .env

Environment variables needed
API_URL
ACCESS_KEY
SECRET_KEY
DOGAPI_KEY
DOGAPP_KEY

Label in rancher
autoscale = ""
docker run -e FORCE_HOSTNAME=auto -e SEEDS="master:8090" --name influxDB --expose 8090 --expose=8099 -d tutum/influxdb:latest
docker run -v /var/run:/var/run -v /sys/fs/cgroup:/sys/fs/cgroup --link influxDB:influx -e "INFLUXDB_HOST=influx" -d mardle/telegraf

curl --unix-socket /var/run/docker.sock http:/containers/json


    curl -s -u "0A401BFB5DE51DBB5356:JdoejjURK7owQqW1raAHzL427ybCEPDi7K45kqBv" -X Get \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    "http://rancher.accedo.tv:8080/v1/projects/1a280/services/1s159" | jq -r '[.state, .healthState]'
