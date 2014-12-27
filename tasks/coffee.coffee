gulp = require 'gulp'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'

fileName = 'file-name'

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'coffee', ->
  gulp.src "#{$.SRC}/#{fileName}.coffee"
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe coffeelint()
    .pipe coffee()
    .pipe gulp.dest("#{$.DEST}")
