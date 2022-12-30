/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./public/**/*.{html,js}'],
  theme: {
    extend: {
      fontFamily: {
        spacemono: ['Space Mono', 'monospace'],
        pixel: ['Press Start 2P', 'cursive'],
      },
    },
  },
  plugins: [require('@tailwindcss/typography'), require('daisyui')],
};
