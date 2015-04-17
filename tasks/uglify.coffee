module.exports = (gulp, opt, $) ->
  gulp.task 'uglify', ->
    gulp.src opt.src
      .pipe uglify
        preserveComments: 'some'
      .pipe rename
        suffix: '.min'
      .pipe gulp.dest opt.dest
