nib = require 'nib'

module.exports = (gulp, conf, $) ->
  gulp.task 'stylus', ->
    gulp.src conf.src
      .pipe $.plumber
        errorHandler: $.notify.onError '<%= error.message %>'
      .pipe $.stylus
        use: nib()
        compress: true
      .pipe $.rename dirname: './'
      .pipe gulp.dest conf.dest,
        cwd: './'
