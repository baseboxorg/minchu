# A collection of Dockerfiles.
---
This directory tree contains several docker files used to build custom docker images.
* ####  Gnome Builder `gnome-builder`
 To run gnome-builder inside docker container. Uses Ubuntu  17.04 as base image.
 - Gnome-Usage does not build and gives an error about missing library.
 - ninja is missing some components.
* #### Ubuntu Gnome `ubuntu-gnome-zesty`
To test ubuntu post install scripts. Uses Ubuntu Gnome as image using base zesty image.

* #### Eclipse
* #### Chrome `chrome`, `chromium`
Works if only user namespaces is enabled by default. If not, use a custom seccomp profile or build a kernel with user namespaces yourself. I have checked it in virtualbox with Debian Jessie.
  - Errors you might see if you do not have user namespaces enabled
<pre>
Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted</pre>
  - Its because your kernel does not support user namespaces. You might need to enable it (debian) or rebuild your kernel with user namespaces enabled. A nice guide is at
https://blog.samcater.com/docker-arch-linux-and-user-namespaces/
after the step above Use a secomp profile (provided by Jess Frazelle) `--security-opt seccomp:chrome.json`.
  - Run the container with `--cap-add=SYS_ADMIN` or `--privilaged`.
  - **DO NOT** run with sandbox disabled!. It has access to your xserver and is a security risk without sandboxing.

* #### Spotify for linux
* #### Visual Studio Code



# Usage
* You need to build docker images before running them. Use helper scripts starting with `docker-` to launch respected applications.
* Helper scripts come with easy commands to launch your applications just run `./docker-<insert-docker-folder> -h` to see help menu.
* Remember that the helper scripts are not perfect! If something does not work please go back to docker commands.
* `docker-helper-core` is necessary to run helper scripts since v1.4 as it contains generic functions necessary to run helper scripts.
* Things might not work with Windows or macOS (has different uid) and you may have to setup ssh forwarding or change uid etc.

# Permission errors
You might have an issue with the X11 socket permissions since the default user used by the base image has an user and group ids set to 1000, in that case you can run either create your own base image with the appropriate ids or run `xhost ` on your machine to allow access to xserver and try again.
