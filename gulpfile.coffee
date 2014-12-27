gulp = require 'gulp'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'
requireDir = require 'require-dir'
requireDir './tasks'

reload = browserSync.reload

fileName = 'file-name'

$ =
  SRC: 'src'
  DEST: 'dest'
  DEMO: 'demo'

gulp.task 'serve', ->
  browserSync
    server:
      baseDir: './'
      index: "#{$.DEMO}/index.html"

gulp.task 'default', ['serve'], ->
  gulp.watch ["#{$.SRC}/#{fileName}.coffee"], ['coffee', reload]

gulp.task 'build', ['coffee'], ->
  gulp.src "#{$.DEST}/#{fileName}.js"
    .pipe uglify(
      preserveComments: 'some'
    )
    .pipe rename(
      extname: '.min.js'
    )
    .pipe gulp.dest("#{$.DEST}")
