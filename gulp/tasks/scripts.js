import gulp from 'gulp';
import gutil from 'gulp-util';
import browserify from 'browserify';
import watchify from 'watchify';
import licensify from 'licensify';
import source from 'vinyl-source-stream';
import eventStream from 'event-stream';

import { rename } from '../plugins';
import { scripts as conf } from '../conf';

const bundler = (entry, isWatch) => {
  const bOpts = conf.browserifyOpts;
  let b;

  bOpts.entries = [conf.common, entry]

  if (isWatch) {
    // bOpts.debug = true
    bOpts.cache = {};
    bOpts.packageCache = {};
    bOpts.fullPath = true;
    b = watchify(browserify(bOpts));
  } else {
    b = browserify(bOpts);
  }

  b.plugin(licensify);

  const bundle = () => {
    return b.bundle()
      .on('error', err => {
        gutil.log(gutil.colors.bgRed('ERROR'), err);
      })
      .pipe(source(entry))
      .pipe(rename({
        dirname: '',
        extname: '.js'
      }))
      .pipe(gulp.dest(conf.dest));
  };

  b
  .on('update', bundle)
  .on('log', message => {
    gutil.log(gutil.colors.bgGreen('Bundle'), gutil.colors.magenta(entry), message);
  });

  return bundle();
};

gulp.task('browserify', () => {
  const tasks = conf.entryFiles.map(entry => {
    return bundler(entry);
  });
  return eventStream.merge.apply(null, tasks);
});

gulp.task('watchify', () => {
  const tasks = conf.entryFiles.map(entry => {
    return bundler(entry, true);
  });
  return eventStream.merge.apply(null, tasks);
});
