module.exports = (gulp, opt, $) ->
  gulp.task 'minify-css', ->
    gulp.src opt.src
      .pipe $.minifyCSS()
      .pipe $.rename
        suffix: '.min'
      .pipe gulp.dest opt.dest
