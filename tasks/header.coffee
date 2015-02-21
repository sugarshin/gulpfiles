gulp = require 'gulp'
header = require 'gulp-header'
fs = require 'fs'
C = require('./package.json').config

getPackageJson = -> JSON.parse(fs.readFileSync('./package.json'))

getBanner = ->
  pkg = getPackageJson()
  banner = """
  /*!
   * @license #{pkg.name} v#{pkg.version}
   * (c) #{new Date().getFullYear()} #{pkg.author} #{pkg.homepage}
   * License: #{pkg.license}
   */

  """


gulp.task 'header', ->
  gulp.src "#{C.DST}/#{C.MAIN}.js"
    .pipe header(getBanner())
    .pipe gulp.dest C.DST
