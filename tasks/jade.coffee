gulp = require 'gulp'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
$ = require('../package.json').settings

path = [
  "#{$.SRC}/**/*.jade"
  "!#{$.SRC}/**/_**/*.jade"
  "!#{$.SRC}/**/_*.jade"
]

gulp.task 'jade', ->
  gulp.src path
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe jade pretty: true
    .pipe rename
      dirname: './'
    .pipe gulp.dest "#{$.DEST}#{$.PATH}",
      cwd: './'
