S = require('../package.json').settings

module.exports =
  script:
    browserifyOpts:
      entries: ["./#{S.SRC}/js/main.coffee"]
      extensions: ['.coffee']
      transform: ['coffeeify']
    dest: "#{S.DEST}#{S.PATH}/js"

  uglify:
    src: "./#{S.DEST}#{S.PATH}/js/main.js"
    dest: "#{S.BUILD}#{S.PATH}/js"

  jade:
    src: [
      "#{S.SRC}/**/*.jade"
      "!#{S.SRC}/**/_**/*.jade"
      "!#{S.SRC}/**/_*.jade"
    ]
    dest: "#{S.DEST}#{S.PATH}"

  stylus:
    src: [
      "#{S.SRC}/**/*.styl"
      "!#{S.SRC}/**/_**/*.styl"
      "!#{S.SRC}/**/_*.styl"
    ]
    dest: "#{S.DEST}#{S.PATH}/css"

  imagemin:
    src: [
      "#{S.DEST}#{S.PATH}/**/*.{jpg,jpeg,png,gif,svg}"
    ]
    dest: "#{S.BUILD}#{S.PATH}/img"

  clean: ["#{S.BUILD}#{S.PATH}"]

  replace:
    src: "#{S.DEST}#{S.PATH}/index.html"
    dest: "#{S.BUILD}#{S.PATH}"
