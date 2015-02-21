gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
C = require('./package.json').config

path =
  img: [
    "#{C.DST}/**/*.{jpg,jpeg,png,gif,svg}"
  ]

gulp.task 'imagemin', ->
  gulp.src path.img
    .pipe imagemin
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      # use: [pngquant()]
    .pipe gulp.dest C.BUILD
