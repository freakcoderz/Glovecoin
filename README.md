
Glovecoin development tree

Glovecoin is a PoS-based cryptocurrency.

Development process
===========================

Developers work in their own trees, then submit pull requests when
they think their feature or bug fix is ready.

The patch will be accepted if there is broad consensus that it is a
good thing.  Developers should expect to rework and resubmit patches
if they don't match the project's coding conventions (see coding.txt)
or are controversial.

The master branch is regularly built and tested, but is not guaranteed
to be completely stable. Tags are regularly created to indicate new
stable release versions of Glovecoin.

Feature branches are created when there are major new features being
worked on by several people.

From time to time a pull request will become outdated. If this occurs, and
the pull is no longer automatically mergeable; a comment on the pull will
be used to issue a warning of closure. The pull will be closed 15 days
after the warning if action is not taken by the author. Pull requests closed
in this manner will have their corresponding issue labeled 'stagnant'.

Issues with no commits will be given a similar warning, and closed after
15 days from their last activity. Issues closed in this manner will be 
labeled 'stale'.

## Docker
[Instructions for installing docker](https://www.docker.com/community-edition).

First, build the image.
```
# Git clone this repo
https://github.com/freakcoderz/Glovecon.git

# go to the same directory Dockerfile exists
cd Glovecoin
# Build the container and tag it with a usable name + version
docker build -t glovecoind:v1.0.0 .
```

You should see logs similar to below. This takes a while, as it is provisioning the image by installing dependencies and building the Glovecoin binary.
```
Sending build context to Docker daemon  156.4MB

Step 1/12 : FROM ubuntu:16.04

..............

Removing intermediate container 20bf170af587

Successfully built 347a6416af66
Successfully built glovecoind:v1.0.0
```

Then, copy the unique identifier built by Docker (in this case, `347a6416af66`).
```
➜  Glovecoin git:(master) ✗ docker run -d glovecoind:v1.0.0
46ecdf76b5b7ead9271ba5f313b03f2cf8002489f11c1de17e495767da3adebf
```

This runs the binary, `Glovecoind`, with no command arguments.

`-d`: daemonize the container. Run `docker logs 347a6416af66 -f` to tail the standard output.

`-v`: persist the data in your host machine. Example: `docker run -d -v $(pwd)/docker/data:/root/.Glovecoin/ glovecoind:v1.0.0	`
