gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
$ = require './../config.json'

gulp.task 'browserify', ->
  browserify
    entries: ["./#{$.SRC}/coffee/#{$.NAME}.coffee"]
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .transform 'debowerify'
  .bundle()
  .pipe source "#{$.NAME}.js"
  .pipe gulp.dest $.DEST
