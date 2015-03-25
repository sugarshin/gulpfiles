gulp = require 'gulp'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
$ = require('../package.json').projectConf

path =
  html: [
    "#{C.SRC}/**/*.jade"
    "!#{C.SRC}/**/_**/*.jade"
    "!#{C.SRC}/**/_*.jade"
  ]

gulp.task 'jade', ->
  gulp.src path.html
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe jade pretty: true
    .pipe gulp.dest "#{$.DST}#{$.PATH}",
      cwd: './'
