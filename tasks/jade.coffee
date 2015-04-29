module.exports = (gulp, conf, $) ->
  gulp.task 'jade', ->
    gulp
      .src conf.src
      .pipe $.plumber
        errorHandler: $.notify.onError '<%= error.message %>'
      .pipe $.jade pretty: true
      .pipe $.rename (path) -> path.dirname = path.dirname.replace 'html', '.'
      .pipe gulp.dest conf.dest
