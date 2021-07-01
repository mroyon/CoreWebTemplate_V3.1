version: '3.4'

services:
  webappfront:
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
    ports:
      - "192.168.8.109:44380:80"
      - "192.168.8.109:44324:443"
    volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro

  webapi:
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
    ports:
      - "192.168.8.109:44381:80"
      - "192.168.8.109:44325:443"
    volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro

  webadmin:
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
    ports:
      - "192.168.8.109:44382:80"
      - "192.168.8.109:44326:443"
    volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro
