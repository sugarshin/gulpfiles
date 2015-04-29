# settings
S =
  PATH: "/path/to/root"
  SRC: "src"
  DEST: "dest"
  BUILD: "build"

module.exports =
  S: S

  serve:
    notify: false
    startPath: S.PATH
    server:
      baseDir: './'
      index: "#{S.DEST}#{S.PATH}/"
      routes:
        "#{S.PATH}": "#{S.DEST}#{S.PATH}/"

  scripts:
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

  minifyCss:
    src: "./#{S.DEST}#{S.PATH}/css/main.css"
    dest: "#{S.BUILD}#{S.PATH}/css"

  imagemin:
    src: [
      "#{S.DEST}#{S.PATH}/**/*.{jpg,jpeg,png,gif,svg}"
    ]
    dest: "#{S.BUILD}#{S.PATH}/img"

  clean: ["#{S.BUILD}#{S.PATH}"]

  replace:
    src: "#{S.DEST}#{S.PATH}/index.html"
    dest: "#{S.BUILD}#{S.PATH}"
    replacements: [
      ['main.js?v', "main.min.js?v#{Date.now()}"]
      ['index.css?v', "index.min.css?v#{Date.now()}"]
    ]

  copy:
    src: [
      "#{S.DEST}/**"
      "!#{S.DEST}/css/**"
      "!#{S.DEST}/js/**"
      "!#{S.DEST}/img/**"
    ]
    dest: S.BUILD
