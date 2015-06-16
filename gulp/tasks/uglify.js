export default function(gulp, {uglify}, $) {
  gulp.task('uglify', () => {
    return gulp.src(uglify.src)
      .pipe($.uglify({
        preserveComments: 'some'
      }))
      .pipe($.rename({
        suffix: '.min'
      }))
      .pipe(gulp.dest(uglify.dest));
  });
}
