gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
$ = require './../config.json'



path =
  img: [
    "#{$.SRC}/www/img/*.{jpg,jpeg,png,gif,svg}"
  ]

gulp.task 'imagemin', ->
  gulp.src path.img
    .pipe imagemin
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      # use: [pngquant()]
    .pipe gulp.dest "#{$.ROOT}/img"
