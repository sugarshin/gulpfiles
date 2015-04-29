module.exports = (gulp, conf, $) ->
  gulp.task 'uglify', ->
    gulp
      .src conf.src
      .pipe $.uglify
        preserveComments: 'some'
      .pipe $.rename suffix: '.min'
      .pipe gulp.dest conf.dest
