pngquant = require 'imagemin-pngquant'

module.exports = (gulp, opt, $) ->
  gulp.task 'imagemin', ->
    gulp
      .src opt.src
      .pipe $.imagemin
        progressive: true
        svgoPlugins: [{removeViewBox: false}]
        use: [pngquant()]
      .pipe gulp.dest opt.dest
