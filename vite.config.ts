import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  preview: {
    port: 4545,
    strictPort: true,
    host: true
  },
  server:{
    port: 3000,
    strictPort: true,
    host: true
  },
  plugins: [react()],
});
