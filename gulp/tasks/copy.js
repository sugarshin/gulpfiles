import gulp from 'gulp';

import {copy} from '../conf';

gulp.task('copy', () => {
  return gulp.src(copy.src)
    .pipe(gulp.dest(copy.dest));
});
