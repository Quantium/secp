# Local Development Setup

This document explains how to set up and run the local Node.js test server for development purposes.

## Prerequisites

- Node.js (version 14.0.0 or higher)
- npm (version 6.0.0 or higher)

## Installation

1. Install dependencies:
   ```bash
   npm install
   ```

## Running the Server

### Development Mode (with auto-reload)
```bash
npm run dev
```
This uses nodemon to automatically restart the server when files change.

### Production Mode
```bash
npm start
```
This runs the server directly with Node.js.

### Alternative Static Server
If you prefer to use the original static server:
```bash
npm run start:static
```

## Server Features

- **Port**: 3000 (configurable via PORT environment variable)
- **Static File Serving**: Serves all files from the root directory
- **SPA Support**: Routes all requests to index.html for single-page application support
- **Health Check**: `/api/health` endpoint for monitoring
- **Error Handling**: Comprehensive error handling with development/production modes
- **Graceful Shutdown**: Handles SIGTERM and SIGINT signals

## Configuration

The server configuration can be customized in `config.js`:

- Server port and host
- Static file settings
- CORS configuration
- Logging levels
- Security settings

## Environment Variables

- `PORT`: Server port (default: 3000)
- `HOST`: Server host (default: localhost)
- `NODE_ENV`: Environment (development/production)
- `LOG_LEVEL`: Logging level (default: info)

## API Endpoints

- `GET /` - Serves the main application
- `GET /api/health` - Health check endpoint
- `GET /*` - Serves static files or falls back to index.html

## Development Workflow

1. Start the development server: `npm run dev`
2. Make changes to your files
3. The server will automatically restart on file changes
4. Access your application at `http://localhost:3000`

## Troubleshooting

### Port Already in Use
If port 3000 is already in use, set a different port:
```bash
PORT=3001 npm run dev
```

### Dependencies Issues
If you encounter dependency issues:
```bash
rm -rf node_modules package-lock.json
npm install
```

### File Permissions
Ensure you have proper permissions to read/write files in the project directory.

## Notes

- This server is for **local development only**
- It will **NOT** be deployed to S3
- The server is configured for development with relaxed security settings
- For production deployment, use the existing S3 deployment process
