/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./public/**/*.{html,js}'],
  theme: {
    extend: {
      fontFamily: {
        spacemono: ['Space Mono', 'monospace'],
      },
    },
  },
  plugins: [require('@tailwindcss/typography'), require('daisyui')],
};
