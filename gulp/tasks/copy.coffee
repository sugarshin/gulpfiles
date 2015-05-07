module.exports = (gulp, {copy}) ->
  gulp.task 'copy', ->
    gulp
    .src copy.src
    .pipe gulp.dest copy.dest
