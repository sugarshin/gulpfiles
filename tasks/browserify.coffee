gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
$ = require './../config.json'

gulp.task 'browserify', ->
  browserify
    entries: ["./#{$.SRC}/coffee/#{$.MAIN}.coffee"]
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .transform 'debowerify'
  .bundle()
  .pipe source "#{$.MAIN}.js"
  .pipe gulp.dest $.DEST
