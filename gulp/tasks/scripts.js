import browserify from 'browserify';
import watchify from 'watchify';
import source from 'vinyl-source-stream';

let bundler = (gulp, conf, watch) => {
  let bOpts = conf.browserifyOpts;
  let b;

  if (watch) {
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
      .pipe(source('main.js'))
      .pipe(gulp.dest(conf.dest));
  };

  b
  .on('update', bundle)
  .on('log', message => {
    console.log(message);
  });

  return bundle();
};

export default function(gulp, {scripts}) {
  gulp.task('browserify', () => {
    return bundler(gulp, scripts);
  });
  gulp.task('watchify', () => {
    return bundler(gulp, scripts, true);
  });
}
