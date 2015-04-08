gulp = require 'gulp'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
$ = require('../package.json').settings

path = [
  "#{C.SRC}/**/*.jade"
  "!#{C.SRC}/**/_**/*.jade"
  "!#{C.SRC}/**/_*.jade"
]

gulp.task 'jade', ->
  gulp.src path
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe jade pretty: true
    .pipe gulp.dest "#{$.DEST}#{$.PATH}",
      cwd: './'
