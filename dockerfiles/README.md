# A collection of Dockerfiles.
---
This directory tree contains several docker files used to build custom docker images.
* ####  gnome-builder
 To run gnome-builder inside docker container. Uses Ubuntu  17.04 as base image.
 - Gnome-Usage does not build and gives an error about missing library.
 - ninja is missing some components.
* ### ubuntu-gnome-zesty
To test ubuntu post install scripts. Uses ubuntu Gnome as image using base zesty image.
