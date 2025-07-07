# Docker Asset Management

This project is a full-stack asset management system, containerized with Docker and orchestrated using Docker Compose. It consists of a React frontend and a .NET 8 Web API backend, with a SQL database for persistent storage.

## Project Structure

```
DockerAssetManagement/
│
├── asset-manager-frontend/      # React frontend application
│   ├── Dockerfile
│   ├── package.json
│   └── ...
│
├── AssetManagerAPI/             # .NET 8 Web API backend
│   ├── Dockerfile
│   ├── AssetManagerAPI.sln
│   └── ...
│
├── db.Dockerfile                # Dockerfile for the database (if custom)
├── docker-compose.yml           # Docker Compose configuration
├── script.sql                   # Database initialization script
└── README.md                    # Project documentation
```

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Node.js](https://nodejs.org/) (for local frontend development)
- [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) (for local backend development)

## Getting Started

### 1. Clone the Repository

```powershell
git clone https://github.com/Yorke101/DockerAssetManagement.git
cd DockerAssetManagement
```

### 2. Build and Run with Docker Compose

This will start the backend API, frontend, and database containers.

```powershell
docker-compose up --build
```

- The React frontend will be available at: http://localhost:3000
- The .NET API will be available at: https://localhost:7040/swagger (or as configured)

### 3. Stopping the Application

```powershell
docker-compose down
```

## Project Components

### Frontend (React)
- Located in `asset-manager-frontend/`
- Provides UI for managing assets and employees
- Communicates with the backend API

### Backend (ASP.NET Core Web API)
- Located in `AssetManagerAPI/`
- Handles business logic and data access
- Exposes RESTful endpoints for asset and employee management

### Database
- Configured via `db.Dockerfile` and `script.sql`
- Stores assets, employees, and assignments

## Development

### Frontend
```powershell
cd asset-manager-frontend
npm install
npm start
```

### Backend
```powershell
cd AssetManagerAPI/AssetManagerAPI
# Run the API
# (Make sure the database is running, e.g., via Docker Compose)
dotnet run
```

## Useful Commands

- Build all containers: `docker-compose build`
- View running containers: `docker ps`
- View logs: `docker-compose logs`

## License

This project is licensed under the MIT License.
