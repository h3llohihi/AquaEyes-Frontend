// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  runtimeConfig: {
    public: {
      apiBaseUrl: process.env.API_BASE_URL || "http://localhost:4558",
    },
  },
  experimental: {
    // Ensure #app-manifest virtual module is generated for Bun/Vite
    appManifest: true,
  },
  devtools: { enabled: false },
  css: ["~/assets/css/main.css"],
  plugins: ["~/plugins/apexcharts.js"],

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  ssr: true,
  app: {
    head: {
      title: "AquaEyes - Flood Prediction System",
      meta: [
        {
          name: "description",
          content: "AquaEyes flood prediction system for Laos",
        },
      ],
      link: [
        {
          rel: "stylesheet",
          href: "https://fonts.googleapis.com/css2?family=Noto+Sans+Lao+Looped:wght@100..900&display=swap",
        },
      ],
    },
    pageTransition: { name: "page", mode: "out-in" },
  },

  build: {
    transpile: ["vue3-apexcharts"],
  },

  compatibilityDate: "2025-03-30",
});
