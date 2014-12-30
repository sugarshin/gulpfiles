gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'

NAME = 'file-name'

$ =
  SRC: 'src'
  DEST: 'dest'
  GH_PAGES: 'gh-pages'

gulp.task 'browserify', ->
  browserify
    entries: ["#{$.SRC}/#{NAME}.coffee"]
    extensions: ['.coffee']
  .transform 'coffeeify'
  .bundle()
  .pipe source "#{NAME}.js"
  .pipe gulp.dest $.DEST
