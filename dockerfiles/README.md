# A collection of Dockerfiles.
---
This directory tree contains several docker files used to build custom docker images.
* ####  gnome-builder
 To run gnome-builder inside docker container. Uses Ubuntu  17.04 as base image.
 - Gnome-Usage does not build and gives an error about missing library.
 - ninja is missing some components.
* #### ubuntu-gnome-zesty
To test ubuntu post install scripts. Uses ubuntu Gnome as image using base zesty image.

#### TO ADD TO REPO [FUTURE]
* #### Eclipse
* #### Chrome `google-chrome`, `chromium`, `google-chrome-dev`
* #### Spotify for linux
* #### Visual Studio Code
* #### Kali linux with metasploit. `kali-linux`
* #### android-studio


# Usage
* You need to build docker images before running them. Use helper scripts starting with `docker-` to launch respected applications.
* Helper scripts come with easy commands to launch your applications just run `./docker-<insert-docker-folder> -h` to see help menu.
* Remember that the helper scripts are not perfect! If something does not work please go back to docker commands.
* Things might not work with Windows or macOS (has different uid) and you may have to setup ssh forwarding or change uid accordingly.

# Permission errors
You might have an issue with the X11 socket permissions since the default user used by the base image has an user and group ids set to 1000, in that case you can run either create your own base image with the appropriate ids or run `xhost ` on your machine to allow access to xserver and try again.
