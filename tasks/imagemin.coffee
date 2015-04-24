pngquant = require 'imagemin-pngquant'

module.exports = (gulp, conf, $) ->
  gulp.task 'imagemin', ->
    gulp
      .src conf.src
      .pipe $.imagemin
        progressive: true
        svgoPlugins: [{removeViewBox: false}]
        use: [pngquant()]
      .pipe gulp.dest conf.dest
