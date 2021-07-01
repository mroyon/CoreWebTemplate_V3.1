#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
#RUN apt-get update -y && apt-get install -y libgdiplus && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
#RUN apt-get update \
    #&& apt-get install -y --allow-unauthenticated \
        #libc6-dev \
        #libgdiplus \
        #libx11-dev \
     #&& rm -rf /var/lib/apt/lists/* 

WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["WebAppFront/WebAppFront.csproj", "WebAppFront/"]
RUN dotnet restore "WebAppFront/WebAppFront.csproj"
COPY . .
WORKDIR "/src/WebAppFront"
RUN dotnet build "WebAppFront.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebAppFront.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebAppFront.dll"]
