/** @type {import('next').NextConfig} */
const nextConfig = {
  transpilePackages: ['@app/ui', '@app/types', '@app/config'],
};

module.exports = nextConfig;
