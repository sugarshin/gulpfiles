gulp = require 'gulp'
plumber = require 'gulp-plumber'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
notify = require 'gulp-notify'
header = require 'gulp-header'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
bump = require 'gulp-bump'
browserSync = require 'browser-sync'
pkg = require './package.json'

banner = """
/*!
 * @license #{pkg.name} v#{pkg.version}
 * (c) #{new Date().getFullYear()} #{pkg.author} #{pkg.homepage}
 * License: #{pkg.license}
 */

"""

fileName = 'file-name'

gulp.task 'coffee', ->
  gulp.src "src/#{fileName}.coffee"
    .pipe plumber
      errorHandler: notify.onError '<%= error.message %>'

    .pipe coffeelint()
    .pipe coffee()
    .pipe header(banner)
    .pipe gulp.dest('dest/')

gulp.task 'serve', ->
  browserSync
    server:
      baseDir: './'
      index: 'demo/index.html'

gulp.task 'default', ['serve'], ->
  gulp.watch ["src/#{fileName}.coffee"], ['coffee', browserSync.reload]

gulp.task 'major', ->
  gulp.src './*.json'
    .pipe bump(
      type: 'major'
    )
    .pipe gulp.dest('./')

gulp.task 'minor', ->
  gulp.src './*.json'
    .pipe bump(
      type: 'minor'
    )
    .pipe gulp.dest('./')

gulp.task 'patch', ->
  gulp.src './*.json'
    .pipe bump(
      type: 'patch'
    )
    .pipe gulp.dest('./')

gulp.task 'build', ['coffee'], ->
  gulp.src "dest/#{fileName}.js"
    .pipe uglify
      preserveComments: 'some'
    .pipe rename
      extname: '.min.js'
    .pipe gulp.dest('dest/')
