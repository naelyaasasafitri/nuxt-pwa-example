<script setup lang="ts">
import { onMounted, ref } from 'vue'

const isBackOnline = ref(false)

const checkConnection = () => {
  isBackOnline.value = navigator.onLine
}

// Poll for connection status every 2 seconds
let intervalId: number

onMounted(() => {
  checkConnection()
  intervalId = window.setInterval(checkConnection, 2000)
})

onUnmounted(() => {
  clearInterval(intervalId)
})
</script>

<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-50 px-4">
    <div class="max-w-md w-full">
      <div v-if="!isBackOnline" class="bg-white rounded-2xl shadow-xl p-8 text-center">
        <!-- Offline Icon -->
        <div class="mx-auto w-24 h-24 bg-red-100 rounded-full flex items-center justify-center mb-6">
          <svg class="w-12 h-12 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
          </svg>
        </div>

        <h1 class="text-3xl font-bold text-gray-900 mb-2">
          You're Offline
        </h1>
        <p class="text-gray-600 mb-6">
          It looks like you've lost your internet connection. Some features may not be available.
        </p>

        <div class="bg-blue-50 rounded-xl p-4 mb-6 text-left">
          <h3 class="font-semibold text-gray-900 mb-2">What's Still Available:</h3>
          <ul class="space-y-2 text-sm text-gray-700">
            <li class="flex items-center gap-2">
              <svg class="w-4 h-4 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
              </svg>
              Previously loaded pages
            </li>
            <li class="flex items-center gap-2">
              <svg class="w-4 h-4 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
              </svg>
              Cached images and assets
            </li>
            <li class="flex items-center gap-2">
              <svg class="w-4 h-4 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
              </svg>
              Local storage data
            </li>
          </ul>
        </div>

        <div class="space-y-3">
          <button
            onclick="window.location.reload()"
            class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-3 px-4 rounded-xl transition-colors"
          >
            Retry Connection
          </button>
          <NuxtLink
            to="/"
            class="block w-full bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-3 px-4 rounded-xl transition-colors text-center"
          >
            Go to Home
          </NuxtLink>
        </div>
      </div>

      <!-- Back Online State -->
      <div v-else class="bg-white rounded-2xl shadow-xl p-8 text-center">
        <div class="mx-auto w-24 h-24 bg-green-100 rounded-full flex items-center justify-center mb-6">
          <svg class="w-12 h-12 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
          </svg>
        </div>

        <h1 class="text-3xl font-bold text-gray-900 mb-2">
          You're Back Online!
        </h1>
        <p class="text-gray-600 mb-6">
          Your connection has been restored. You can now access all features.
        </p>

        <NuxtLink
          to="/"
          class="block w-full bg-green-600 hover:bg-green-700 text-white font-medium py-3 px-4 rounded-xl transition-colors text-center"
        >
          Go to Home
        </NuxtLink>
      </div>

      <!-- Helpful Tips -->
      <div class="mt-6 text-center text-sm text-gray-500">
        <p>This page is cached and works offline</p>
      </div>
    </div>
  </div>
</template>
