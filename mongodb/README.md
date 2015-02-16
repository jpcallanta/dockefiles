# mongodb
dockerfile that builds mongodb and sshd services using supervisord to manage both pids

# build info
To build simply run:
`docker build -t="mongodb" ./`

# run
To run this image:
`docker run -d -p 27017:27017 -p 2222:22 mongodb`

To ensure the container is running, type: `docker ps` and you should see the image running. 
