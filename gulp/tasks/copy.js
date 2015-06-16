export default function(gulp, {copy}) {
  gulp.task('copy', () => {
    return gulp.src(copy.src)
      .pipe(gulp.dest(copy.dest));
  });
}
