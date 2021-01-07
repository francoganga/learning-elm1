module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      gridTemplateRows: {
        'burger': 'auto 1fr auto'
      },
      gridTemplateColumns: {
        'side-test': 'minmax(120px, 18%) 1fr'
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
