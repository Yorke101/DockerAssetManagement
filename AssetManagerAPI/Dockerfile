# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src


# Copy solution and project files (relative to build context)
COPY AssetManagerAPI.sln ./
COPY AssetManagerAPI/AssetManagerAPI.csproj ./AssetManagerAPI/

# Restore dependencies
RUN dotnet restore ./AssetManagerAPI/AssetManagerAPI.csproj

# Copy the rest of the source code
COPY . .

# Build the application
RUN dotnet publish -c Release -o /app/publish

# Use the official ASP.NET runtime image for the final stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Copy published output from build stage
COPY --from=build /app/publish .

# Expose port 80
EXPOSE 80

# Set the entrypoint
ENTRYPOINT ["dotnet", "AssetManagerAPI.dll"]
