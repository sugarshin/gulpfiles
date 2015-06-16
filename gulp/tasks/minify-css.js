export default function(gulp, {minifyCss}, $) {
  gulp.task('minify-css', () => {
    return gulp.src(minifyCss.src)
      .pipe($.minifyCss())
      .pipe($.rename({suffix: '.min'}))
      .pipe(gulp.dest(minifyCss.dest));
  });
}
