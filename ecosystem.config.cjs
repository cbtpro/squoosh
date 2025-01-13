module.exports = {
  apps: [
    {
      name: 'squoosh', // 应用程序名称
      // exec_mode: 'cluster',
      // instances: 'max',
      exec_mode: 'fork',
      instances: '1',
      script: 'npx',
      args: [
        'serve',
        '--listen=9981',
        '--config',
        '../../../serve.json',
        '.tmp/build/static',
      ],
      interpreter: 'none',
      env: {
        NODE_ENV: 'development',
        DEV_PORT: process.env.DEV_PORT,
      },
      env_production: {
        NODE_ENV: 'production',
        DEV_PORT: process.env.DEV_PORT,
      },
    },
  ],
};
