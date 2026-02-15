<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount } from 'vue'

// Online/offline status
const isOnline = ref(true)
const showOfflineBanner = ref(false)

// PWA install prompt
const deferredPrompt = ref<any>(null)
const showInstallPrompt = ref(false)
const isInstalled = ref(false)

// Check if PWA is installed
const checkInstalled = () => {
  isInstalled.value = window.matchMedia('(display-mode: standalone)').matches ||
    (window.navigator as any).standalone === true
}

// Handle install prompt
const handleInstallClick = async () => {
  if (!deferredPrompt.value) return

  deferredPrompt.value.prompt()
  const { outcome } = await deferredPrompt.value.userChoice

  if (outcome === 'accepted') {
    console.log('PWA installation accepted')
    showInstallPrompt.value = false
  }

  deferredPrompt.value = null
}

const handleBeforeInstallPrompt = (e: Event) => {
  e.preventDefault()
  deferredPrompt.value = e
  showInstallPrompt.value = true
}

// Listen to online/offline events
const updateOnlineStatus = () => {
  isOnline.value = navigator.onLine
  if (!isOnline.value) {
    showOfflineBanner.value = true
    // Auto-hide after 5 seconds
    setTimeout(() => {
      showOfflineBanner.value = false
    }, 5000)
  }
}

// Listen for app installed event
const handleAppInstalled = () => {
  isInstalled.value = true
  showInstallPrompt.value = false
}

onMounted(() => {
  // Initial checks
  isOnline.value = navigator.onLine
  checkInstalled()

  // Event listeners
  window.addEventListener('online', updateOnlineStatus)
  window.addEventListener('offline', updateOnlineStatus)
  window.addEventListener('beforeinstallprompt', handleBeforeInstallPrompt)
  window.addEventListener('appinstalled', handleAppInstalled)
})

onBeforeUnmount(() => {
  window.removeEventListener('online', updateOnlineStatus)
  window.removeEventListener('offline', updateOnlineStatus)
  window.removeEventListener('beforeinstallprompt', handleBeforeInstallPrompt)
  window.removeEventListener('appinstalled', handleAppInstalled)
})
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Offline Banner -->
    <Transition
      enter-active-class="transition-all duration-300"
      enter-from-class="-translate-y-full opacity-0"
      enter-to-class="translate-y-0 opacity-100"
      leave-active-class="transition-all duration-300"
      leave-from-class="translate-y-0 opacity-100"
      leave-to-class="-translate-y-full opacity-0"
    >
      <div
        v-if="showOfflineBanner"
        class="fixed top-0 left-0 right-0 z-50 bg-orange-500 text-white px-4 py-3 text-center"
      >
        <span class="font-medium">⚠️ You're offline. Some features may not be available.</span>
      </div>
    </Transition>

    <!-- Install Prompt -->
    <Transition
      enter-active-class="transition-all duration-300"
      enter-from-class="translate-y-full opacity-0"
      enter-to-class="translate-y-0 opacity-100"
      leave-active-class="transition-all duration-300"
      leave-from-class="translate-y-0 opacity-100"
      leave-to-class="translate-y-full opacity-0"
    >
      <div
        v-if="showInstallPrompt && !isInstalled"
        class="fixed bottom-4 left-4 right-4 md:left-auto md:right-4 md:w-96 bg-white rounded-xl shadow-2xl p-4 z-40 border border-gray-200"
      >
        <div class="flex items-start gap-3">
          <div class="bg-blue-500 rounded-lg p-2">
            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
            </svg>
          </div>
          <div class="flex-1">
            <h3 class="font-semibold text-gray-900">Install Nuxt PWA</h3>
            <p class="text-sm text-gray-600 mt-1">Add to home screen for offline access</p>
            <div class="flex gap-2 mt-3">
              <button
                @click="handleInstallClick"
                class="flex-1 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors"
              >
                Install
              </button>
              <button
                @click="showInstallPrompt = false"
                class="px-4 py-2 text-gray-600 hover:bg-gray-100 rounded-lg text-sm font-medium transition-colors"
              >
                Later
              </button>
            </div>
          </div>
        </div>
      </div>
    </Transition>

    <!-- Header -->
    <header class="bg-white shadow-sm">
      <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <div class="flex items-center gap-2">
            <div class="bg-blue-600 rounded-lg p-2">
              <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <span class="font-bold text-xl text-gray-900">Nuxt PWA</span>
          </div>

          <!-- Connection Status -->
          <div class="flex items-center gap-2">
            <span
              class="flex items-center gap-1.5 px-3 py-1.5 rounded-full text-sm font-medium"
              :class="isOnline ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'"
            >
              <span
                class="w-2 h-2 rounded-full"
                :class="isOnline ? 'bg-green-500' : 'bg-red-500'"
              ></span>
              {{ isOnline ? 'Online' : 'Offline' }}
            </span>
          </div>
        </div>
      </nav>
    </header>

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <NuxtPage />
    </main>

    <!-- Footer -->
    <footer class="bg-white border-t border-gray-200 mt-auto">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <p class="text-center text-gray-600 text-sm">
          Built with Nuxt 3 + Vite PWA • Offline support enabled
        </p>
      </div>
    </footer>
  </div>
</template>

<style scoped>
/* Ensure smooth transitions */
.transition-all {
  transition-property: all;
}
</style>
