# Use .NET 6 SDK as a parent image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory in the container
WORKDIR /build

ADD https://dotnetcli.azureedge.net/dotnet/Sdk/1.0.0-rc4-004915/dotnet-dev-osx-x64.1.0.0-rc4-004915.tar.gz /build/dotnet-dev-osx-x64.1.0.0-rc4-004915.tar.gz




