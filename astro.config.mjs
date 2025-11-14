import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind()],
  site: 'https://black-gnome.com',
  build: {
    assets: 'assets',
  },
  image: {
    domains: ['picsum.photos', 'w.soundcloud.com'],
  },
});
