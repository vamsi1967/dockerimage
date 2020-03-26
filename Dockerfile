#FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS build-env
#WORKDIR /app
#EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
COPY *.csproj ./
EXPOSE 80

RUN dotnet restore 
COPY . ./
#WORKDIR "/src/docker1"
#RUN dotnet build "docker1.csproj" -c Release -o /app/build

#FROM build AS publish
#RUN dotnet publish "docker1.csproj" -c Release -o /app/publish
RUN dotnet publish  -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "docker1.dll"]