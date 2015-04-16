var gulp = require('gulp');
var browserSync = require('browser-sync');
var runSequence = require('run-sequence');
var requireDir = require('require-dir');
var $ = require('./package.json').settings;
var reload = browserSync.reload;

requireDir('./tasks');

gulp.task('serve', function() {
  var obj;
  browserSync({
    notify: false,
    startPath: $.PATH,
    server: {
      baseDir: './',
      index: '' + $.DEST + $.PATH + '/',
      routes: (
        obj = {},
        obj['' + $.PATH] = '' + $.DEST + $.PATH + '/',
        obj
      )
    }
  });
});

gulp.task('start', function(cb) {
  return runSequence(['jade', 'stylus', 'browserify'], 'watchify', 'serve', cb);
});

gulp.task('default', ['start'], function() {
  gulp.watch(['./' + $.SRC + '/**/*.jade'], ['jade', reload]);
  gulp.watch(['./' + $.SRC + '/**/*.styl'], ['stylus', reload]);
  gulp.watch(['./' + $.DEST + '/**/*.js'], reload);
});

gulp.task('build', function(cb) {
  return runSequence(
    'clean',
    ['jade', 'stylus'],
    'copy',
    ['replace-min', 'minify-css', 'browserify', 'imagemin'],
    'uglify',
    cb
  );
});
