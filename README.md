# .NET Dockerfile

This repository contains a Dockerfile that builds [CoreCLR](https://github.com/dotnet/coreclr)
(and soon [CoreFX](https://github.com/dotnet/corefx) and [Roslyn](https://github.com/dotnet/roslyn))
on Linux, from sources, suitable for running and developing
[.NET](https://github.com/dotnet) applications.

Note that the .NET repositories are evolving fast, so this may get out of date.
I'll do my best to keep up.  The [source repositories](https://github.com/dotnet) are the best place
to find authoritative, up-to-date build and install instructions.

## Base Docker Image
* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

## Installation and Usage

1. Install [Docker](http://docker.com).

2. Curl this Dockerfile:

	curl -O https://raw.githubusercontent.com/joeduffy/dotnet-dockerfile/master/Dockerfile

3. Build it:

	docker build -t dotnet .

   This will actually clone and build the .NET sources.

4. Run it:

	docker run -it dotnet

   The sources are available underneath /dotnet, and the binaries /dotnet/bin.

