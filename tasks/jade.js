var gulp = require('gulp');
var jade = require('gulp-jade');
var plumber = require('gulp-plumber');
var notify = require('gulp-notify');
var rename = require('gulp-rename');
var $ = require('../package.json').settings;

var path = [
  $.SRC + '/**/*.jade',
  '!' + $.SRC + '/**/_**/*.jade',
  '!' + $.SRC + '/**/_*.jade'
];

gulp.task('jade', function() {
  return gulp
          .src(path)
          .pipe(plumber({
            errorHandler: notify.onError('<%= error.message %>')
          }))
          .pipe(jade({
            pretty: true
          }))
          .pipe(rename({
            dirname: './'
          }))
          .pipe(gulp.dest('' + $.DEST + $.PATH, {
            cwd: './'
          }));
});
