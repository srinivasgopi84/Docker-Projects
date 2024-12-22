FROM mcr.microsoft.com/dotnet/aspnet:8.0.11-cbl-mariner2.0-distroless-composite-extra:sha256:86adf67d9bd5c39b5b1961d3b1a1f747b67a4e6b2432debdaef2190b5ced3dc2
WORKDIR /build
COPY . .
RUN dotnet restore lotrapi.csproj
RUN dotnet publish lotrapi.csproj -c Release

FROM mcr.microsoft.com/dotnet/aspnet:8.0.11-cbl-mariner2.0-distroless-composite-extra:sha256:86adf67d9bd5c39b5b1961d3b1a1f747b67a4e6b2432debdaef2190b5ced3dc2
LABEL Name=lotrapi Version=0.0.1
WORKDIR /app
EXPOSE 5000
COPY --from=build /build/bin/Release/netcoreapp1.1/publish .
ENTRYPOINT dotnet lotrapi.dll
