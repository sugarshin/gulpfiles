gulp = require 'gulp'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
$ = require './../config.json'



path =
  html: [
    "#{$.SRC}/**/*.jade"
    "!#{$.SRC}/**/_**/*.jade"
    "!#{$.SRC}/**/_*.jade"
  ]

gulp.task 'jade', ->
  gulp.src "#{$.SRC}/*.jade"
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe jade pretty: true
    .pipe gulp.dest $.DEST
