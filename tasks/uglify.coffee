gulp = require 'gulp'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
$ = require './../config.json'

gulp.task 'uglify', ->
  gulp.src "./#{$.DEST}/#{$.MAIN}.js"
    .pipe uglify
      preserveComments: 'some'
    .pipe rename
      extname: '.min.js'
    .pipe gulp.dest $.DEST
