import gulp from 'gulp';
import nib from 'nib';

import P from '../plugins';
import {stylus} from '../conf';

gulp.task('stylus', () => {
  return gulp.src(stylus.src)
    .pipe(P.plumber({
      errorHandler: P.notify.onError('<%= error.message %>')
    }))
    .pipe(P.stylus({
      use: nib(),
      compress: true
    }))
    .pipe(P.rename({
      dirname: './'
    }))
    .pipe(gulp.dest(stylus.dest, {
      cwd: './'
    }));
});
