pngquant = require 'imagemin-pngquant'

module.exports = (gulp, {imagemin}, $) ->
  gulp.task 'imagemin', ->
    gulp
    .src imagemin.src
    .pipe $.imagemin
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      use: [pngquant()]
    .pipe $.rename (path) -> path.dirname = path.dirname.replace 'img', '.'
    .pipe gulp.dest imagemin.dest
