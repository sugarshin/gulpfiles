import gulp from 'gulp';
import del from 'del';

import {clean} from '../conf';

gulp.task('clean', cb => {
  del(clean.path, cb);
});
