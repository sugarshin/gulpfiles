import gulp from 'gulp';

import P from '../plugins';
import {jade} from '../conf';

gulp.task('jade', () => {
  return gulp.src(jade.src)
    .pipe(P.plumber({
      errorHandler: P.notify.onError('<%= error.message %>')
    }))
    .pipe(P.jade(/*{
      pretty: true
    }*/))
    .pipe(P.rename(path => {
      path.dirname = path.dirname.replace('html', '.');
    }))
    .pipe(gulp.dest(jade.dest));
});
