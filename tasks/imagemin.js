var gulp = require('gulp');
var imagemin = require('gulp-imagemin');
var pngquant = require('imagemin-pngquant');
var $ = require('../package.json').settings;

var path = ['' + $.DEST + $.PATH + '/**/*.{jpg,jpeg,png,gif,svg}'];

gulp.task('imagemin', function() {
  return gulp
          .src(path)
          .pipe(imagemin({
            progressive: true,
            svgoPlugins: [{
              removeViewBox: false
            }],
            use: [pngquant()]
          }))
          .pipe(gulp.dest('' + $.BUILD + $.PATH + '/img'));
});
