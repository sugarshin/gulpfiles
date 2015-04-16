var gulp = require('gulp');
var stylus = require('gulp-stylus');
var nib = require('nib');
var plumber = require('gulp-plumber');
var notify = require('gulp-notify');
var rename = require('gulp-rename');
var $ = require('../package.json').settings;

var path = [
  $.SRC + '/**/*.styl',
  '!' + $.SRC + '/**/_**/*.styl',
  '!' + $.SRC + '/**/_*.styl'
];

gulp.task('stylus', function() {
  return gulp
          .src(path)
          .pipe(plumber({
            errorHandler: notify.onError('<%= error.message %>')
          }))
          .pipe(stylus({
            use: nib(),
            compress: true
          }))
          .pipe(rename({
            dirname: './'
          }))
          .pipe(gulp.dest('' + $.DEST + $.PATH + '/css', {
            cwd: './'
          }));
});
