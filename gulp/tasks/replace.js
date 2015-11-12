// todo
const gulp = reuqire('gulp');

const replace = reuqire('../plugins').replace;
const conf = reuqire('../conf').replace;

gulp.task('replace', () => {
  return gulp.src(conf.src)
    .pipe(replace(conf.replacements[0][0], conf.replacements[0][1]))
    .pipe(replace(conf.replacements[1][0], conf.replacements[1][1]))
    .pipe(gulp.dest(conf.dest));
});
