import gulp from 'gulp';
import loadPlugins from 'gulp-load-plugins';
import browserSync from 'browser-sync';
import runSequence from 'run-sequence';
import requireDir from 'require-dir';

import conf from './gulp/conf';

let $ = loadPlugins();

let reload = browserSync.reload;

let tasks = requireDir('./gulp/tasks');

Object.keys(tasks).forEach(name => {
  tasks[name](gulp, conf, $);
});

gulp.task('serve', () => {
  browserSync(conf.serve);
});

gulp.task('predefault', cb => {
  runSequence(
    ['jade', 'stylus', 'browserify'],
    'watchify',
    'serve',
    cb
  );
});

gulp.task('default', ['predefault'], () => {
  gulp.watch(
    [`./${conf.D.SRC}/**/*.jade`],
    ['jade', reload]
  );
  gulp.watch(
    [`./${conf.D.SRC}/**/*.styl`],
    ['stylus', reload]
  );
  gulp.watch(
    [`./${conf.D.DEST}/**/*.js`],
    reload
  );
});

gulp.task('build', cb => {
  runSequence(
    'clean',
    ['jade', 'stylus'],
    'copy',
    ['replace', 'minify-css', 'browserify', 'imagemin'],
    'uglify',
    cb
  );
});
