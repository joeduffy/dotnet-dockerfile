#
# .NET Dockerfile
#
# https://github.com/joeduffy/dotnet-dockerfile
#

FROM dockerfile/ubuntu
MAINTAINER joeduffy

# Add the LLVM package source.
RUN echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.6 main" | \
    tee /etc/apt/sources.list.d/llvm.list
RUN apt-get install -y wget
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -

# Update packages based on the new package list.
RUN apt-get update -y

# Install build tools.
RUN apt-get install -y cmake
RUN apt-get install -y llvm-3.5 clang-3.5 lldb-3.6 lldb-3.6-dev
RUN apt-get install -y git

# Install runtime dependencies.
RUN apt-get install -y libunwind8 libunwind8-dev
RUN apt-get install -y libssl-dev # for System.Security.Cryptography.Native
RUN apt-get install -y gettext

# Now setup the dotnet directory and clone the sources.
RUN mkdir /dotnet
RUN git clone --depth=1 https://github.com/dotnet/coreclr /dotnet/coreclr

# Build and install the runtime bits.
RUN cd /dotnet/coreclr && ./build.sh
RUN mv /dotnet/coreclr/bin /dotnet/bin

