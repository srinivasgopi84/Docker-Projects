FROM mcr.microsoft.com/dotnet/aspnet:8.0.11-cbl-mariner2.0-distroless-composite-extra
WORKDIR /build
COPY . .
RUN dotnet restore lotrapi.csproj
RUN dotnet publish lotrapi.csproj -c Release

FROM mcr.microsoft.com/dotnet/aspnet:8.0.11-cbl-mariner2.0-distroless-composite-extra
LABEL Name=lotrapi Version=0.0.1
WORKDIR /app
EXPOSE 5000
COPY --from=build /build/bin/Release/netcoreapp1.1/publish .
ENTRYPOINT dotnet lotrapi.dll
