gulp = require 'gulp'
browserify = require 'browserify'
watchify = require 'watchify'
source = require 'vinyl-source-stream'
$ = require('../package.json').settings

bOpts =
  entries: ["./#{$.SRC}/js/main.coffee"]
  extensions: ['.coffee', '.js']
  transform: ['coffeeify']

bundler = (watch) ->
  if watch
    debug: true
    bOpts.cache = {}
    bOpts.packageCache = {}
    bOpts.fullPath = true
    b = watchify browserify bOpts
  else
    b = browserify bOpts

  bundle = ->
    b
      .bundle()
      .on 'error', (err) -> console.log 'bundle error: ' + err
      .pipe source 'main.js'
      .pipe gulp.dest "#{$.DEST}#{$.PATH}/js"

  b
    .on 'update', bundle
    .on 'log', (message) -> console.log message

  return bundle()

gulp.task 'browserify', -> bundler()
gulp.task 'watchify', -> bundler true
