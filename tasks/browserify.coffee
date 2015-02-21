gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
C = require('./package.json').config

gulp.task 'browserify', ->
  browserify
    entries: ["./#{C.SRC}/js/#{C.MAIN}.coffee"]
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .bundle()
  .pipe source "#{C.MAIN}.js"
  .pipe gulp.dest C.DST
