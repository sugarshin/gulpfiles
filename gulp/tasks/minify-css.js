import gulp from 'gulp';

import P from '../plugins';
import {minifyCss} from '../conf';

gulp.task('minify-css', () => {
  return gulp.src(minifyCss.src)
    .pipe(P.minifyCss())
    .pipe(P.rename({suffix: '.min'}))
    .pipe(gulp.dest(minifyCss.dest));
});
