nib = require 'nib'

module.exports = (gulp, opt, $) ->
  gulp.task 'stylus', ->
    gulp.src opt.src
      .pipe $.plumber
        errorHandler: $.notify.onError '<%= error.message %>'
      .pipe $.stylus
        use: nib()
        compress: true
      .pipe $.rename dirname: './'
      .pipe gulp.dest opt.dest,
        cwd: './'
