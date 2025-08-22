module.exports = {
  // Server configuration
  server: {
    port: process.env.PORT || 3000,
    host: process.env.HOST || 'localhost',
    environment: process.env.NODE_ENV || 'development'
  },
  
  // Static file serving
  static: {
    root: __dirname,
    index: 'index.html',
    maxAge: process.env.NODE_ENV === 'production' ? '1d' : 0
  },
  
  // CORS settings for development
  cors: {
    enabled: process.env.NODE_ENV === 'development',
    origin: process.env.NODE_ENV === 'development' ? '*' : false,
    credentials: true
  },
  
  // Logging configuration
  logging: {
    level: process.env.LOG_LEVEL || 'info',
    format: process.env.NODE_ENV === 'development' ? 'dev' : 'combined'
  },
  
  // Security settings
  security: {
    helmet: process.env.NODE_ENV === 'production',
    rateLimit: {
      windowMs: 15 * 60 * 1000, // 15 minutes
      max: process.env.NODE_ENV === 'development' ? 1000 : 100
    }
  }
};
