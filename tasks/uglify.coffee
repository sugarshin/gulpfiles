gulp = require 'gulp'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
C = require('./package.json').config

gulp.task 'uglify', ->
  gulp.src "./#{C.DST}/#{C.MAIN}.js"
    .pipe uglify
      preserveComments: 'some'
    .pipe rename
      extname: '.min.js'
    .pipe gulp.dest C.DST
