import gulp from 'gulp';
import requireDir from 'require-dir';
import browserSync from 'browser-sync';
import runSequence from 'run-sequence';

import {D, serve} from './gulp/conf';

const reload = browserSync.reload;

requireDir('./gulp/tasks');

gulp.task('serve', () => {
  browserSync(serve);
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
    [`./${D.SRC}/**/*.jade`],
    ['jade', reload]
  );
  gulp.watch(
    [`./${D.SRC}/**/*.styl`],
    ['stylus', reload]
  );
  gulp.watch(
    [`./${D.DEST}/**/*.js`],
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
