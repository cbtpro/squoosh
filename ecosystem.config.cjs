module.exports = {
  apps: [
    {
      name: 'squoosh', // 应用程序名称
      // exec_mode: 'cluster',
      // instances: 'max',
      // exec_mode: 'fork',
      // instances: '1',
      script: 'npm',
      args: [
        // 'serve',
        // '--listen=8080',
        // '--config',
        // '../../../serve.json',
        // '.tmp/build/static',
        'run',
        'serve',
      ],
      interpreter: 'none',
      env: {
        NODE_ENV: 'development',
        DEV_PORT: process.env.DEV_PORT,
        PORT: '--listen=9981',
      },
      env_production: {
        NODE_ENV: 'production',
        DEV_PORT: process.env.DEV_PORT,
      },
    },
  ],
};
