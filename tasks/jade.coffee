module.exports = (gulp, opt, $) ->
  gulp.task 'jade', ->
    gulp.src opt.src
      .pipe $.plumber
        errorHandler: $.notify.onError '<%= error.message %>'
      .pipe $.jade pretty: true
      .pipe $.rename dirname: './'
      .pipe gulp.dest opt.dest,
        cwd: './'
