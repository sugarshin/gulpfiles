gulp = require 'gulp'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'
stylus = require 'gulp-stylus'
nib = require 'nib'

fileName = 'file-name'

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'stylus', ->
  gulp.src "#{$.SRC}/#{fileName}.styl"
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'
    .pipe stylus
      use: nib()
      compress: false
    .pipe gulp.dest("#{$.DEST}")
