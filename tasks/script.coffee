browserify = require 'browserify'
watchify = require 'watchify'
source = require 'vinyl-source-stream'

bundler = (opt, watch) ->
  bOpts = opt.browserifyOpts

  if watch
    bOpts.debug = true
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
      .pipe gulp.dest opt.dest

  b
    .on 'update', bundle
    .on 'log', (message) -> console.log message

  return bundle()

module.exports = (gulp, opt) ->
  gulp.task 'browserify', -> bundler opt
  gulp.task 'watchify', -> bundler opt, true
