# 🚀 Nuxt 3 PWA Example

A Progressive Web App built with Nuxt 3, featuring offline support, installability, and modern UX.

## ✨ Features

- **Offline Support**: Works without internet connection using service worker caching
- **Installable**: Add to home screen like a native app
- **Online/Offline Detection**: Automatic UI updates based on connection status
- **Offline Fallback Page**: Dedicated page for offline users
- **Caching Strategies**:
  - Cache-first for static assets (images, fonts)
  - Network-first for API calls
  - Stale-while-revalidate for HTML
- **Auto Updates**: Service worker updates automatically in background
- **Responsive Design**: Mobile-first with Tailwind CSS

## 🛠️ Tech Stack

- **Framework**: Nuxt 3
- **PWA**: @vite-pwa/nuxt
- **Styling**: Tailwind CSS
- **Runtime**: Bun (recommended) or Node.js

## 📦 Installation

```bash
# Using Bun (recommended)
bun install

# Or with npm/pnpm
npm install
# or
pnpm install
```

## 🚀 Development

```bash
# Start development server
bun run dev
# or
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🏗️ Build for Production

```bash
# Build for production
bun run build

# Preview production build
bun run preview
```

## 🧪 Testing Offline Functionality

### Method 1: Chrome DevTools

1. Open DevTools (F12)
2. Go to **Application** tab
3. Click **Service Workers** in the left sidebar
4. Check the **Offline** checkbox
5. Refresh the page — it should load from cache

### Method 2: Network Throttling

1. Open DevTools (F12)
2. Go to **Network** tab
3. Change throttling to **Offline**
4. Refresh the page

### Method 3: Test on Mobile

1. Deploy to a server (Vercel, Netlify, etc.)
2. Open on mobile browser
3. Install PWA (Add to Home Screen)
4. Turn off internet
5. Open the app — it should still work

## 📱 Testing Installability

### Desktop

1. Open DevTools → **Application** → **Manifest**
2. Check if manifest is valid
3. Look for "Add to home screen" prompt

### Mobile (Chrome/Safari)

1. Visit the app URL
2. Tap "Share" button
3. Select "Add to Home Screen" (iOS) or "Install App" (Android)
4. Confirm installation
5. Open from home screen — it should launch in standalone mode

## 🗂️ Project Structure

```
nuxt-pwa-example/
├── app.vue                 # Main layout with PWA UI components
├── nuxt.config.ts          # Nuxt + PWA configuration
├── pages/
│   ├── index.vue           # Home page
│   └── offline.vue         # Offline fallback page
├── public/
│   ├── pwa-192x192.svg     # App icon (192x192)
│   └── pwa-512x512.svg     # App icon (512x512)
└── package.json
```

## ⚙️ PWA Configuration

The PWA is configured in `nuxt.config.ts`:

```typescript
pwa: {
  registerType: 'autoUpdate',
  manifest: { /* ... */ },
  workbox: {
    globPatterns: ['**/*.{js,css,html,svg}'],
    runtimeCaching: [
      // API caching (NetworkFirst)
      // Image caching (CacheFirst)
      // Font caching (CacheFirst)
    ],
  },
}
```

### Caching Strategies

- **CacheFirst**: Best for assets that rarely change (images, fonts)
- **NetworkFirst**: Best for dynamic content (API calls)
- **StaleWhileRevalidate**: Balance between speed and freshness (HTML pages)

## 🎨 Customization

### Change App Name & Icons

Edit `nuxt.config.ts` → `manifest` section:

```typescript
manifest: {
  name: 'Your App Name',
  short_name: 'App',
  icons: [
    {
      src: 'your-icon.svg',
      sizes: '512x512',
      type: 'image/svg+xml',
    },
  ],
}
```

### Add Custom Caching

Edit `nuxt.config.ts` → `workbox.runtimeCaching`:

```typescript
runtimeCaching: [
  {
    urlPattern: /^https:\/\/api\.example\.com\//,
    handler: 'NetworkFirst',
    options: {
      cacheName: 'api-cache',
      expiration: {
        maxEntries: 50,
        maxAgeSeconds: 60 * 60 * 24, // 24 hours
      },
    },
  },
],
```

## 🔍 Service Worker Debugging

### Check Service Worker Status

1. DevTools → **Application** → **Service Workers**
2. See status, version, and update time

### Force Update Service Worker

```typescript
// In your component
useRegisterSW().updateServiceWorker()
```

### Clear Cache

1. DevTools → **Application** → **Cache Storage**
2. Right-click cache → **Delete**

## 📋 Lighthouse PWA Score

To test PWA compliance:

1. DevTools → **Lighthouse**
2. Select "Progressive Web App"
3. Run audit

Target: **90+** on PWA category

## 🚢 Deployment

### Vercel

```bash
npm i -g vercel
vercel
```

### Netlify

```bash
npm i -g netlify-cli
netlify deploy --prod
```

### GitHub Pages

```bash
npm run generate
# Deploy dist/ folder to gh-pages branch
```

## 📚 Resources

- [Nuxt 3 Documentation](https://nuxt.com)
- [Vite PWA Documentation](https://vite-plugin-pwa.netlify.app/)
- [Web.dev PWA Guide](https://web.dev/progressive-web-apps/)
- [MDN Service Worker API](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)

## 🐛 Common Issues

### Service Worker Not Registering

- Ensure HTTPS (or localhost)
- Check browser console for errors
- Clear browser cache and reload

### Offline Page Not Loading

- Verify caching strategy in `nuxt.config.ts`
- Check if files are in globPatterns
- Ensure fallback page is in public folder

### Install Prompt Not Showing

- Must be on HTTPS (or localhost)
- Must have at least one visit
- Browser may block repeated prompts
- Check DevTools → Application → Manifest

## 📄 License

MIT License - feel free to use this as a starting point for your project!

---

Made with ❤️ using Nuxt 3 + Vite PWA
