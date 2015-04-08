gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
$ = require('../package.json').settings

gulp.task 'browserify', ->
  browserify
    entries: ["./#{$.SRC}/js/main.coffee"]
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .bundle()
  .pipe source 'main.js'
  .pipe gulp.dest "#{$.DEST}#{$.PATH}/js"
