# 🚀 Quick Start Deploy - nuxt-pwa-example

## Deploy ke Cloudflare Pages (Recommended)

### Step 1: Buka Cloudflare Dashboard

1. Login ke [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Pilih account kamu
3. Klik **Workers & Pages**
4. Klik **Create application**
5. Pilih **Pages** tab
6. Klik **Connect to Git**

### Step 2: Connect GitHub Repository

1. Cari repo: `naelyaasasafitri/nuxt-pwa-example`
2. Klik **Begin setup**

### Step 3: Configure Build Settings

Pastikan settings seperti ini:

```
Project name: nuxt-pwa-example
Production branch: main
Framework preset: Nuxt
Build command: npm run generate
Build output directory: .output/public
Root directory: (leave empty - default)
```

### Step 4: Environment Variables (Opsional)

Jika tidak perlu, biarkan kosong.

### Step 5: Deploy!

Klik **Save and Deploy**.

Tunggu sekitar 1-2 menit. Cloudflare akan:
1. Clone repo
2. Install dependencies
3. Build project
4. Deploy ke global CDN

### Step 6: Akses Website

Setelah deploy selesai, kamu akan dapat URL seperti:
```
https://nuxt-pwa-example.pages.dev
```

---

## 🔄 Auto-Deploy Setiap Push

Setelah setup Git Integration, setiap kali kamu push ke branch `main`:
```bash
git add .
git commit -m "update: your changes"
git push
```

Cloudflare akan otomatis rebuild dan deploy! 🚀

---

## 📱 Test PWA Features

Setelah deploy:

1. **Install as App**
   - Buka di mobile browser
   - Pilih "Add to Home Screen" / "Install App"

2. **Test Offline**
   - Buka website
   - Matikan internet
   - Refresh - masih bisa diakses

3. **Check Service Worker**
   - Buka DevTools → Application → Service Workers
   - Pastikan status "Activated"

---

## 🐛 Troubleshooting

### Build Gagal?
Check log di:
Cloudflare Dashboard → Workers & Pages → nuxt-pwa-example → Deployments → [klik deployment]

### PWA Tidak Installable?
Pastikan:
1. Site di-serve via HTTPS (Cloudflare Pages otomatis HTTPS)
2. Service Worker terdaftar (cek DevTools)
3. Manifest.json accessible di root

### Custom Domain?
1. Cloudflare Dashboard → Workers & Pages → nuxt-pwa-example
2. Custom domains → Set up a custom domain
3. Ikuti instruksi DNS

---

## 📚 Alternative Deployment Methods

### Netlify
1. Connect repo: `naelyaasasafitri/nuxt-pwa-example`
2. Build command: `npm run generate`
3. Publish directory: `.output/public`

### Vercel
1. Import repo
2. Framework preset: Nuxt
3. Build command: `npm run generate`

---

Need help? Check:
- [Cloudflare Pages Docs](https://developers.cloudflare.com/pages/)
- [Nuxt 3 Deployment](https://nuxt.com/docs/getting-started/deployment)
