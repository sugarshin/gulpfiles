const gulp = require('gulp');
const pngquant = require('imagemin-pngquant');

const plugins = require('../plugins');
const conf = require('../conf').imagemin;

gulp.task('imagemin', () => {
  return gulp.src(conf.src)
    .pipe(plugins.imagemin({
      progressive: true,
      svgoPlugins: [{removeViewBox: false}],
      use: [pngquant()]
    }))
    .pipe(plugins.rename(path => {
      path.dirname = path.dirname.replace('img', '.');
    }))
    .pipe(gulp.dest(conf.dest));
});
