<script setup lang="ts">
import { ref } from 'vue'

// Simulate some data fetching
const data = ref([
  { id: 1, title: 'Feature 1: Offline Support', desc: 'Works without internet connection' },
  { id: 2, title: 'Feature 2: Installable', desc: 'Add to home screen like native app' },
  { id: 3, title: 'Feature 3: Fast Loading', desc: 'Cached assets load instantly' },
  { id: 4, title: 'Feature 4: Push Notifications', desc: 'Get updates when you\'re online' },
])

const features = ref([
  'Service Worker caching',
  'Offline fallback pages',
  'Install prompt on mobile',
  'Auto-updates in background',
  'Network-aware UI',
  'Cache-first for static assets',
])
</script>

<template>
  <div class="space-y-8">
    <!-- Hero Section -->
    <section class="text-center py-12">
      <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
        Welcome to Nuxt PWA
      </h1>
      <p class="text-xl text-gray-600 max-w-2xl mx-auto">
        A Progressive Web App example with offline support, installability, and modern UX
      </p>
    </section>

    <!-- Features Grid -->
    <section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div
        v-for="item in data"
        :key="item.id"
        class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow"
      >
        <div class="bg-blue-50 rounded-lg p-3 w-fit mb-4">
          <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
          </svg>
        </div>
        <h3 class="text-lg font-semibold text-gray-900 mb-2">
          {{ item.title }}
        </h3>
        <p class="text-gray-600">
          {{ item.desc }}
        </p>
      </div>
    </section>

    <!-- PWA Capabilities -->
    <section class="bg-white rounded-xl shadow-sm border border-gray-200 p-8">
      <h2 class="text-2xl font-bold text-gray-900 mb-6">PWA Capabilities</h2>
      <ul class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <li
          v-for="feature in features"
          :key="feature"
          class="flex items-center gap-3 text-gray-700"
        >
          <svg class="w-5 h-5 text-green-500 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
          </svg>
          {{ feature }}
        </li>
      </ul>
    </section>

    <!-- Testing Instructions -->
    <section class="bg-blue-50 rounded-xl p-8">
      <h2 class="text-2xl font-bold text-gray-900 mb-4">How to Test Offline</h2>
      <ol class="space-y-3 text-gray-700">
        <li class="flex gap-3">
          <span class="bg-blue-600 text-white rounded-full w-6 h-6 flex items-center justify-center flex-shrink-0 text-sm font-bold">1</span>
          <span>Open DevTools → Application tab → Service Workers</span>
        </li>
        <li class="flex gap-3">
          <span class="bg-blue-600 text-white rounded-full w-6 h-6 flex items-center justify-center flex-shrink-0 text-sm font-bold">2</span>
          <span>Check "Offline" checkbox to simulate offline mode</span>
        </li>
        <li class="flex gap-3">
          <span class="bg-blue-600 text-white rounded-full w-6 h-6 flex items-center justify-center flex-shrink-0 text-sm font-bold">3</span>
          <span>Refresh the page — it should still load from cache</span>
        </li>
        <li class="flex gap-3">
          <span class="bg-blue-600 text-white rounded-full w-6 h-6 flex items-center justify-center flex-shrink-0 text-sm font-bold">4</span>
          <span>Navigate to <code class="bg-white px-2 py-0.5 rounded text-sm">/offline</code> — should show fallback page</span>
        </li>
      </ol>
    </section>

    <!-- Status Indicators -->
    <section class="grid grid-cols-1 md:grid-cols-3 gap-4">
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-sm font-medium text-gray-500 mb-2">Service Worker</h3>
        <div class="flex items-center gap-2">
          <div class="w-3 h-3 bg-green-500 rounded-full"></div>
          <span class="text-lg font-semibold text-gray-900">Active</span>
        </div>
      </div>
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-sm font-medium text-gray-500 mb-2">Cache Strategy</h3>
        <span class="text-lg font-semibold text-gray-900">Stale-While-Revalidate</span>
      </div>
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 class="text-sm font-medium text-gray-500 mb-2">Assets Cached</h3>
        <span class="text-lg font-semibold text-gray-900">All Static</span>
      </div>
    </section>
  </div>
</template>
