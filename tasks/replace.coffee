gulp = require 'gulp'
replace = require 'gulp-replace'
$ = require('../package.json').settings

gulp.task 'replace-min', ->
  gulp.src "#{$.DEST}#{$.PATH}/index.html"
    .pipe replace 'main.js', "main.min.js?v#{Date.now()}"
    .pipe replace 'index.css', "index.min.css?v#{Date.now()}"
    .pipe gulp.dest "#{$.BUILD}#{$.PATH}"
