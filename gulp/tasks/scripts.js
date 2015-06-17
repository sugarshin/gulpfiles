// todo
import gulp from 'gulp';
import browserify from 'browserify';
import watchify from 'watchify';
import source from 'vinyl-source-stream';
import eventStream from 'event-stream';

import P from '../plugins';
import {scripts} from '../conf';

const bundler = (entry, isWatch) => {
  let bOpts = scripts.browserifyOpts;
  let b;

  bOpts.entries = [scripts.common, entry]

  if (isWatch) {
    // bOpts.debug = true
    bOpts.cache = {};
    bOpts.packageCache = {};
    bOpts.fullPath = true;
    b = watchify(browserify(bOpts));
  } else {
    b = browserify(bOpts);
  }

  let bundle = () => {
    return b.bundle()
      .on('error', err => {
        console.log(`bundle error: ${err}`);
      })
      .pipe(source(entry))
      .pipe(P.rename({
        dirname: '',
        extname: '.js'
      }))
      .pipe(gulp.dest(scripts.dest));
  };

  b
  .on('update', bundle)
  .on('log', message => {
    console.log(message);
  });

  return bundle();
};

gulp.task('browserify', () => {
  let tasks = scripts.entryFiles.map(entry => {
    return bundler(entry);
  });
  return eventStream.merge.apply(null, tasks);
});

gulp.task('watchify', () => {
  let tasks = scripts.entryFiles.map(entry => {
    return bundler(entry, true);
  });
  return eventStream.merge.apply(null, tasks);
});
