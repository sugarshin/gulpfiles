// todo
import gulp from 'gulp';

import P from '../plugins';
import {replace} from '../conf';

gulp.task('replace', () => {
  return gulp.src(replace.src)
    .pipe(P.replace(replace.replacements[0][0], replace.replacements[0][1]))
    .pipe(P.replace(replace.replacements[1][0], replace.replacements[1][1]))
    .pipe(gulp.dest(replace.dest));
});
