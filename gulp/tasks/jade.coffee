module.exports = (gulp, {jade}, $) ->
  gulp.task 'jade', ->
    gulp
    .src jade.src
    .pipe $.plumber
      errorHandler: $.notify.onError '<%= error.message %>'
    .pipe $.jade()# pretty: true
    .pipe $.rename (path) -> path.dirname = path.dirname.replace 'html', '.'
    .pipe gulp.dest jade.dest
