gulp = require 'gulp'
replace = require 'gulp-replace'
$ = require './../config.json'

gulp.task 'replace-min', ->
  gulp.src "./#{$.DEST}/index.html"
    .pipe replace("#{$.MAIN}.js", "#{$.MAIN}.min.js")
    .pipe gulp.dest $.DEST

gulp.task 'replace-normal', ->
  gulp.src "./#{$.DEST}/index.html"
    .pipe replace("#{$.MAIN}.min.js", "#{$.MAIN}.js")
    .pipe gulp.dest $.DEST
