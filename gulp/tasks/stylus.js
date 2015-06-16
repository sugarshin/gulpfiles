import nib from 'nib';

export default function(gulp, {stylus}, $) {
  gulp.task('stylus', () => {
    return gulp.src(stylus.src)
      .pipe($.plumber({
        errorHandler: $.notify.onError('<%= error.message %>')
      }))
      .pipe($.stylus({
        use: nib(),
        compress: true
      }))
      .pipe($.rename({
        dirname: './'
      }))
      .pipe(gulp.dest(stylus.dest, {
        cwd: './'
      }));
  });
}
