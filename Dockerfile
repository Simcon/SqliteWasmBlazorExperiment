FROM mcr.microsoft.com/dotnet/aspnet:10.0.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:10.0.101 AS build

# Python is required by Emscripten (emcc) for WASM AOT compilation
RUN apt-get update && apt-get install -y python3 && ln -s /usr/bin/python3 /usr/bin/python

RUN dotnet workload install wasm-tools

WORKDIR /src

# Copy everything
COPY ./Src ./

# Publish
FROM build AS publish
RUN dotnet publish ./SqliteWasmBlazorExperiment/SqliteWasmBlazorExperiment.csproj -c Release -o /app/publish /p:UseAppHost=false

# Build image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENV ASPNETCORE_ENVIRONMENT=Development

ENTRYPOINT ["dotnet", "SqliteWasmBlazorExperiment.dll"]
