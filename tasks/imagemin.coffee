gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
pngquant = require 'imagemin-pngquant'
$ = require('../package.json').settings

path = [
  "#{$.DEST}#{$.PATH}/**/*.{jpg,jpeg,png,gif,svg}"
]

gulp.task 'imagemin', ->
  gulp.src path
    .pipe imagemin
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      use: [pngquant()]
    .pipe gulp.dest "#{$.BUILD}#{$.PATH}/img"
