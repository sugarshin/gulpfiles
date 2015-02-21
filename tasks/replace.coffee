gulp = require 'gulp'
replace = require 'gulp-replace'
C = require('./package.json').config

gulp.task 'replace-min', ->
  gulp.src "./#{C.DST}/index.html"
    .pipe replace("#{C.MAIN}.js", "#{C.MAIN}.min.js")
    .pipe gulp.dest C.DST

gulp.task 'replace-normal', ->
  gulp.src "./#{C.DST}/index.html"
    .pipe replace("#{C.MAIN}.min.js", "#{C.MAIN}.js")
    .pipe gulp.dest C.DST
