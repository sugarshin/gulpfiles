// configure

const D = {
  PATH: '/path/to/root',
  SRC: 'src',
  DEST: 'dest',
  BUILD: 'build'
};

export default {
  D: D,

  serve: {
    notify: false,
    startPath: D.PATH,
    server: {
      baseDir: './',
      index: `${D.DEST}${D.PATH}/`,
      routes: (() => {
        let obj = {};
        obj['' + D.PATH] = `${D.DEST}${D.PATH}/`;
        return obj;
      })()
    }
  },

  scripts: {
    browserifyOpts: {
      entries: [`./${D.SRC}/js/main.js`],
      extensions: ['.coffee'],
      transform: ['babelify', 'coffeeify']
    },
    dest: `${D.DEST}${D.PATH}/js`
  },

  uglify: {
    src: `./${D.DEST}${D.PATH}/js/main.js`,
    dest: `${D.BUILD}${D.PATH}/js`
  },

  jade: {
    src: [
      `${D.SRC}/**/*.jade`,
      `!${D.SRC}/**/_**/*.jade`,
      `!${D.SRC}/**/_*.jade`
    ],
    dest: `${D.DEST}${D.PATH}`
  },

  stylus: {
    src: [
      `${D.SRC}/**/*.styl`,
      `!${D.SRC}/**/_**/*.styl`,
      `!${D.SRC}/**/_*.styl`
    ],
    dest: `${D.DEST}${D.PATH}/css`
  },

  minifyCss: {
    src: `./${D.DEST}${D.PATH}/css/main.css`,
    dest: `${D.BUILD}${D.PATH}/css`
  },

  imagemin: {
    src: [
      `${D.DEST}${D.PATH}/**/*.{jpg,jpeg,png,gif,svg}`
    ],
    dest: `${D.BUILD}${D.PATH}/img`
  },

  clean: [`${D.BUILD}${D.PATH}`],

  replace: {
    src: `${D.DEST}${D.PATH}/index.html`,
    dest: `${D.BUILD}${D.PATH}`,
    replacements: [
      ['main.js?v', `main.min.js?v${Date.now()}`],
      ['index.css?v', `index.min.css?v${Date.now()}`]
    ]
  },

  copy: {
    src: [
      `${D.DEST}/**`,
      `!${D.DEST}/css/**`,
      `!${D.DEST}/js/**`,
      `!${D.DEST}/img/**`
    ],
    dest: D.BUILD
  }
}