gulp = require 'gulp'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
$ = require('../package.json').settings

gulp.task 'uglify', ->
  gulp.src "./#{$.DEST}#{$.PATH}/js/main.js"
    .pipe uglify
      preserveComments: 'some'
    .pipe rename
      suffix: '.min'
    .pipe gulp.dest "#{$.BUILD}#{$.PATH}/js"
