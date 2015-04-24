module.exports = (gulp, conf) ->
  gulp.task 'copy', ->
    gulp
      .src conf.src
      .pipe gulp.dest conf.dest
