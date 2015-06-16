#!/usr/bin/sh

npm i -D babel babelify browser-sync browserify coffeeify del gulp gulp-imagemin gulp-jade gulp-load-plugins gulp-minify-css gulp-notify gulp-plumber gulp-rename gulp-replace gulp-stylus gulp-uglify imagemin-pngquant nib require-dir run-sequence vinyl-source-stream watchify
mkdir -p build dest src/html src/css src/js
touch src/html/index.html src/css/index.css src/js/main.js
rm -rf .git init.sh
