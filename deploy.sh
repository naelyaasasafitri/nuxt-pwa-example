#!/bin/bash

# Cloudflare Pages Deployment Script for nuxt-pwa-example
# Usage: ./deploy.sh [account_id] [api_token]

set -e

ACCOUNT_ID=${1:-$CLOUDFLARE_ACCOUNT_ID}
API_TOKEN=${2:-$CLOUDFLARE_API_TOKEN}
PROJECT_NAME="nuxt-pwa-example"

if [ -z "$ACCOUNT_ID" ]; then
  echo "❌ Error: ACCOUNT_ID not provided"
  echo ""
  echo "Usage: ./deploy.sh <account_id> <api_token>"
  echo ""
  echo "Or set environment variables:"
  echo "  export CLOUDFLARE_ACCOUNT_ID=your_account_id"
  echo "  export CLOUDFLARE_API_TOKEN=your_api_token"
  echo "  ./deploy.sh"
  echo ""
  echo "Get Account ID from: https://dash.cloudflare.com/ → Workers & Pages"
  echo "Get API Token from: https://dash.cloudflare.com/profile/api-tokens"
  exit 1
fi

if [ -z "$API_TOKEN" ]; then
  echo "❌ Error: API_TOKEN not provided"
  exit 1
fi

echo "🚀 Deploying $PROJECT_NAME to Cloudflare Pages..."
echo "Account ID: $ACCOUNT_ID"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
  echo "❌ Error: Node.js not found. Please install Node.js first."
  echo ""
  echo "Install Node.js:"
  echo "  - Ubuntu/Debian: sudo apt install nodejs npm"
  echo "  - macOS: brew install node"
  echo "  - Download: https://nodejs.org/"
  exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Build project
echo "🔨 Building project..."
npm run generate

# Check if build output exists
if [ ! -d ".output/public" ]; then
  echo "❌ Error: Build output not found at .output/public"
  exit 1
fi

echo "✅ Build successful!"
echo "Output: .output/public"
echo ""

# Note: Direct API upload to Cloudflare Pages requires wrangler or CF Pages API
echo "📝 Next steps:"
echo ""
echo "Option 1: Use Cloudflare Pages Git Integration (Recommended)"
echo "  1. Go to https://dash.cloudflare.com/"
echo "  2. Workers & Pages → Create → Connect to Git"
echo "  3. Select repo: naelyaasasafitri/nuxt-pwa-example"
echo "  4. Build settings:"
echo "     - Framework preset: Nuxt"
echo "     - Build command: npm run generate"
echo "     - Output directory: .output/public"
echo ""
echo "Option 2: Deploy with Wrangler CLI"
echo "  1. Install wrangler: npm install -g wrangler"
echo "  2. Login: wrangler login"
echo "  3. Deploy: wrangler pages deploy .output/public --project-name=$PROJECT_NAME"
echo ""
echo "✅ Build is ready! Follow one of the options above to deploy."
