// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-11-01',
  devtools: { enabled: true },

  modules: [
    '@vite-pwa/nuxt',
    '@nuxtjs/tailwindcss',
  ],

  pwa: {
    registerType: 'autoUpdate',
    includeAssets: ['icon.png', 'favicon.ico'],
    manifest: {
      name: 'Nuxt PWA Example',
      short_name: 'NuxtPWA',
      description: 'A Progressive Web App example with Nuxt 3',
      theme_color: '#ffffff',
      background_color: '#ffffff',
      display: 'standalone',
      orientation: 'portrait',
      icons: [
        {
          src: 'pwa-192x192.svg',
          sizes: '192x192',
          type: 'image/svg+xml',
        },
        {
          src: 'pwa-512x512.svg',
          sizes: '512x512',
          type: 'image/svg+xml',
        },
        {
          src: 'pwa-512x512.svg',
          sizes: '512x512',
          type: 'image/svg+xml',
          purpose: 'any maskable',
        },
      ],
    },
    workbox: {
      globPatterns: ['**/*.{js,css,html,png,ico,svg,woff2}'],
      runtimeCaching: [
        {
          urlPattern: /^https:\/\/api\./.test(location.origin),
          handler: 'NetworkFirst',
          options: {
            cacheName: 'api-cache',
            expiration: {
              maxEntries: 50,
              maxAgeSeconds: 60 * 60 * 24, // 24 hours
            },
            cacheableResponse: {
              statuses: [0, 200],
            },
          },
        },
        {
          urlPattern: /\.(?:png|jpg|jpeg|svg|gif|webp|ico)$/,
          handler: 'CacheFirst',
          options: {
            cacheName: 'images-cache',
            expiration: {
              maxEntries: 100,
              maxAgeSeconds: 60 * 60 * 24 * 30, // 30 days
            },
          },
        },
        {
          urlPattern: /\.(?:woff2?|eot|ttf|otf)$/,
          handler: 'CacheFirst',
          options: {
            cacheName: 'fonts-cache',
            expiration: {
              maxEntries: 50,
              maxAgeSeconds: 60 * 60 * 24 * 365, // 1 year
            },
          },
        },
      ],
    },
    client: {
      installPrompt: true,
    },
  },
})
