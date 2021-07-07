## Getting started

- Clone this repo

- Build it!  
```bash 
podman build --rm --compress --force-rm -t ubi8minimal-firefox .
```
- Run it! 
```bash 
podman run --rm \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev/dri:/dev/dri \
-v="$HOME/.Xauthority:/home/developer/.Xauthority:z" \
--security-opt=label=type:container_runtime_t \
-e DISPLAY  \
localhost/ubi8minimal-firefox

```