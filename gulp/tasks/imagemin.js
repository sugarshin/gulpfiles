import pngquant from 'imagemin-pngquant';

export default function(gulp, {imagemin}, $) {
  gulp.task('imagemin', () => {
    return gulp.src(imagemin.src)
      .pipe($.imagemin({
        progressive: true,
        svgoPlugins: [{removeViewBox: false}],
        use: [pngquant()]
      }))
      .pipe($.rename(path => {
        path.dirname = path.dirname.replace('img', '.');
      }))
      .pipe(gulp.dest(imagemin.dest));
  });
}
