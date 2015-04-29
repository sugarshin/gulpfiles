module.exports = (gulp, conf, $) ->
  gulp.task 'minify-css', ->
    gulp
      .src conf.src
      .pipe $.minifyCss()
      .pipe $.rename
        suffix: '.min'
      .pipe gulp.dest conf.dest
