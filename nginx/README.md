# mongodb
dockerfile that builds mongodb and sshd services using supervisord to manage both pids

# build info
To build simply run:
`docker build -t="nginx" ./`

# run
To run this image:
`docker run -d -p 80:80 nginx`

To ensure the container is running, type: `docker ps` and you should see the image running. 
