# Use .NET 6 SDK as a parent image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory in the container
WORKDIR /build

RUN wget https://dotnetcli.azureedge.net/dotnet/Sdk/1.0.0-rc4-004915/dotnet-dev-osx-x64.1.0.0-rc4-004915.tar.gz .

# Add the .NET SDK tar.gz file to the image
ADD dotnet-dev-osx-x64.1.0.0-rc4-004915.tar.gz /usr/share/dotnet/

# Set the environment variable to point to the new SDK 
ENV DOTNET_ROOT=/usr/share/dotnet 

# Verify the installed SDK version 
RUN dotnet --version

# Copy the project files to the working directory
COPY . .

# Restore the project dependencies
RUN dotnet restore lotrapi.csproj

# Publish the project
RUN dotnet publish lotrapi.csproj -c Release -o /app/publish

# Use a runtime image for the final build
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS api

# Set metadata for the container
LABEL Name=lotrapi Version=0.0.1

# Set the working directory in the container
WORKDIR /app

# Expose the application port
EXPOSE 5000

# Copy the published application from the build stage
COPY --from=build /app/publish .

# Specify the entry point for the application
ENTRYPOINT ["dotnet", "lotrapi.dll"]
