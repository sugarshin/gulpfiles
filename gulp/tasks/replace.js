// todo
export default function(gulp, {replace}, $) {
  gulp.task('replace', () => {
    return gulp.src(replace.src)
      .pipe($.replace(replace.replacements[0][0], replace.replacements[0][1]))
      .pipe($.replace(replace.replacements[1][0], replace.replacements[1][1]))
      .pipe(gulp.dest(replace.dest));
  });
}
