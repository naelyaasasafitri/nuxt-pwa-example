# 🚀 Deploy ke Cloudflare Pages

## Cara 1: Git Integration (Recommended)

1. Buka [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Workers & Pages → Create → Connect to Git
3. Pilih repo: `naelyaasasafitri/nuxt-pwa-example`
4. Build settings:
   - Framework preset: Nuxt
   - Build command: `npm run generate`
   - Build output directory: `.output/public`
5. Deploy!

URL: `https://nuxt-pwa-example.pages.dev`

## Cara 2: GitHub Actions

### Setup Cloudflare Secrets

1. Buat API Token: [Cloudflare API Tokens](https://dash.cloudflare.com/profile/api-tokens)
   - Template: Edit Cloudflare Workers
   - Permissions: Account → Cloudflare Pages → Edit

2. Get Account ID: [Dashboard → Workers & Pages](https://dash.cloudflare.com/)

3. Add GitHub Secrets:
   - `CLOUDFLARE_API_TOKEN`
   - `CLOUDFLARE_ACCOUNT_ID`

### Trigger Workflow

Push ke main atau trigger manual dari Actions tab.

---

**Auto-deploy**: Setiap push ke branch `main` akan trigger deploy otomatis!
