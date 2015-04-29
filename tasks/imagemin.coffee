pngquant = require 'imagemin-pngquant'

module.exports = (gulp, conf, $) ->
  gulp.task 'imagemin', ->
    gulp
      .src conf.src
      .pipe $.imagemin
        progressive: true
        svgoPlugins: [{removeViewBox: false}]
        use: [pngquant()]
      .pipe $.rename (path) -> path.dirname = path.dirname.replace 'img', '.'
      .pipe gulp.dest conf.dest
