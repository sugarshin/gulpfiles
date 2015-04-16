var gulp = require('gulp');
var del = require('del');
var $ = require('../package.json').settings;

gulp.task('clean', function(cb) {
  return del(["" + $.BUILD + $.PATH], cb);
});
