# AquaEyes - Flood Prediction System (Frontend)

AquaEyes is a real-time flood prediction system designed for Laos. It provides visualization of sensor data including water levels, rainfall, soil moisture, and flow rates to help monitor and predict flood risks.

## 🚀 Key Features

- **Real-time Dashboard:** Monitor current water levels, rainfall intensity, soil moisture, and water flow rates.
- **Risk Assessment:** Automated risk levels (Normal, Warning, Danger, Critical) based on sensor data thresholds.
- **Data Visualization:** Interactive charts using ApexCharts and Chart.js for historical and real-time data trends.
- **Historical Data:** Comprehensive history view with filtering by device ID, sensor ID, and date ranges.
- **Multi-language Support:** Support for Lao and English languages.
- **Responsive Design:** Optimized for mobile, tablet, and desktop viewing.

## 🛠 Tech Stack

- **Framework:** [Nuxt 3](https://nuxt.com/) (Vue.js 3)
- **Styling:** [Tailwind CSS](https://tailwindcss.com/)
- **Charts:** [ApexCharts](https://apexcharts.com/), [Chart.js](https://www.chartjs.org/)
- **State Management:** [Pinia](https://pinia.vuejs.org/) (Project implies Pinia via `stores` directory)
- **Icons:** [Heroicons](https://heroicons.com/)
- **Communication:** [Socket.io-client](https://socket.io/) for real-time updates.

## 📋 Prerequisites

- [Node.js](https://nodejs.org/) (Latest LTS recommended)
- [npm](https://www.npmjs.com/) or [Yarn](https://yarnpkg.com/) or [pnpm](https://pnpm.io/)

## ⚙️ Setup & Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd AquaEyes-Frontend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   # or
   yarn install
   # or
   pnpm install
   ```

3. **Environment Variables:**
   Create a `.env` file in the root directory (or use `.env.example` if available) and configure your API base URL:
   ```env
   API_BASE_URL=http://your-api-url:4558
   ```

## 🏃‍♂️ Development

Start the development server:
```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```
The application will be available at `http://localhost:3000`.

## 📦 Production

Build the application for production:
```bash
npm run build
```

Preview the production build locally:
```bash
npm run preview
```

## 🐳 Docker Support

Run the application using Docker Compose:
```bash
docker-compose up -d
```

## 📂 Folder Structure

- `assets/`: Static assets like CSS, images, and fonts.
- `components/`: Reusable Vue components (including charts).
- `composables/`: Shared reactive logic and state.
- `layouts/`: Application layouts.
- `pages/`: Nuxt pages (Dashboard, History).
- `plugins/`: Nuxt plugins (e.g., ApexCharts).
- `stores/`: Pinia state management modules.
- `utils/`: Common utility functions.

---
Built with ❤️ for flood safety in Laos.
