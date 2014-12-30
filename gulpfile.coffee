gulp = require 'gulp'
browserSync = require 'browser-sync'
sequence = require 'gulp-sequence'
requireDir = require 'require-dir'

requireDir './tasks'

reload = browserSync.reload

NAME = 'file-name'

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'serve', ->
  browserSync
    startPath: '/'
    server:
      baseDir: './'
      index: "#{$.DEST}/"
      routes:
        '/': "#{$.DEST}/"

gulp.task 'default', ['serve'], ->
  gulp.watch ["#{$.SRC}/*.coffee"], ['browserify', reload]

# gulp.task 'build', ['coffee'], ->
#   gulp.src "#{$.DEST}/#{NAME}.js"
#     .pipe uglify(
#       preserveComments: 'some'
#     )
#     .pipe rename(
#       extname: '.min.js'
#     )
#     .pipe gulp.dest $.DEST
