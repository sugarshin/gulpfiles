const DIR = module.exports.DIR = {
  PATH: '/path/to/root',
  SRC: 'src',
  DEST: 'dest',
  BUILD: 'build'
};

module.exports.serve = {
  notify: false,
  startPath: DIR.PATH,
  ghostMode: false,
  server: {
    baseDir: './',
    index: `${DIR.DEST}${DIR.PATH}/`,
    routes: {
      [DIR.PATH]: `${DIR.DEST}${DIR.PATH}/`
    }
  }
};

module.exports.scripts = {
  common: '',
  entryFiles: [
    `./${DIR.SRC}/js/main.js`//,
    // `./${DIR.SRC}/js/sub.coffee`
  ],
  browserifyOpts: {
    extensions: ['.coffee'],
    transform: ['babelify', 'coffeeify']
  },
  dest: `${DIR.DEST}${DIR.PATH}/js`
};

module.exports.uglify = {
  src: `./${DIR.DEST}${DIR.PATH}/js/main.js`,
  dest: `${DIR.BUILD}${DIR.PATH}/js`,
  opts: {
    preserveComments(node, comment) {
      return comment.value.indexOf('This header is generated by licensify') > -1;
    }
  }
};

module.exports.jade = {
  src: [
    `${DIR.SRC}/**/*.jade`,
    `!${DIR.SRC}/**/_**/*.jade`,
    `!${DIR.SRC}/**/_*.jade`
  ],
  dest: `${DIR.DEST}${DIR.PATH}`,
  opts: {
    pretty: false
  }
};

module.exports.stylus = {
  src: [
    `${DIR.SRC}/**/*.styl`,
    `!${DIR.SRC}/**/_**/*.styl`,
    `!${DIR.SRC}/**/_*.styl`
  ],
  dest: `${DIR.DEST}${DIR.PATH}/css`
};

module.exports.minifyCss = {
  src: `${DIR.DEST}${DIR.PATH}/css/main.css`,
  dest: `${DIR.BUILD}${DIR.PATH}/css`
};

module.exports.imagemin = {
  src: [
    `${DIR.DEST}${DIR.PATH}/**/*.{jpg,jpeg,png,gif,svg}`
  ],
  dest: `${DIR.BUILD}${DIR.PATH}/img`
};

module.exports.clean = {
  path: [`${DIR.BUILD}${DIR.PATH}`]
};

module.exports.replace = {
  src: `${DIR.DEST}${DIR.PATH}/index.html`,
  dest: `${DIR.BUILD}${DIR.PATH}`,
  replacements: [
    ['main.js?v', `main.min.js?v=${Date.now()}`],
    ['main.css?v', `main.min.css?v=${Date.now()}`]
  ]
};

module.exports.copy = {
  src: [
    `${DIR.DEST}/**`,
    `!${DIR.DEST}/css/**`,
    `!${DIR.DEST}/js/**`,
    `!${DIR.DEST}/img/**`
  ],
  dest: DIR.BUILD
};
