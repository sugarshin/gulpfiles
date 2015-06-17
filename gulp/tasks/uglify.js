import gulp from 'gulp';

import P from '../plugins';
import {uglify} from '../conf';

gulp.task('uglify', () => {
  return gulp.src(uglify.src)
    .pipe(P.uglify({
      preserveComments: 'some'
    }))
    .pipe(P.rename({
      suffix: '.min'
    }))
    .pipe(gulp.dest(uglify.dest));
});
