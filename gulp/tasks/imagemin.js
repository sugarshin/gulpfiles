import gulp from 'gulp';
import pngquant from 'imagemin-pngquant';

import P from '../plugins';
import {imagemin} from '../conf';

gulp.task('imagemin', () => {
  return gulp.src(imagemin.src)
    .pipe(P.imagemin({
      progressive: true,
      svgoPlugins: [{removeViewBox: false}],
      use: [pngquant()]
    }))
    .pipe(P.rename(path => {
      path.dirname = path.dirname.replace('img', '.');
    }))
    .pipe(gulp.dest(imagemin.dest));
});
