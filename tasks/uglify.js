var gulp = require('gulp');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var $ = require('../package.json').settings;

gulp.task('uglify', function() {
  return gulp
          .src('./' + $.DEST + $.PATH + '/js/main.js')
          .pipe(uglify({
            preserveComments: 'some'
          }))
          .pipe(rename({
            suffix: '.min'
          }))
          .pipe(gulp.dest('' + $.BUILD + $.PATH + '/js'));
});
