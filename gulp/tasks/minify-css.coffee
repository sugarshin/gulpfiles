module.exports = (gulp, {minifyCss}, $) ->
  gulp.task 'minify-css', ->
    gulp
    .src minifyCss.src
    .pipe $.minifyCss()
    .pipe $.rename suffix: '.min'
    .pipe gulp.dest minifyCss.dest
