var gulp = require('gulp');
var replace = require('gulp-replace');
var $ = require('../package.json').settings;

gulp.task('replace-min', function() {
  return gulp
          .src('' + $.DEST + $.PATH + '/index.html')
          .pipe(
            replace('main.js', 'main.min.js?v' + Date.now())
          )
          .pipe(
            replace('index.css', 'index.min.css?v' + Date.now())
          )
          .pipe(gulp.dest('' + $.BUILD + $.PATH));
});
