gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
$ = require './../config.json'

path =
  img: [
    "#{$.DEST}/**/*.{jpg,jpeg,png,gif,svg}"
  ]

gulp.task 'imagemin', ->
  gulp.src path.img
    .pipe imagemin
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      # use: [pngquant()]
    .pipe gulp.dest $.BUILD
