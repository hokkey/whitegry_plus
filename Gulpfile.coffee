# whitegry_plus gulpfile

gulp = require 'gulp'
sass = require 'gulp-sass'
tar = require 'gulp-tar'
gzip = require 'gulp-gzip'
rename = require 'gulp-rename'
rimraf = require 'rimraf'

gulp.task 'scss', ->
  gulp.src './css/src/*.scss'
  .pipe sass(
    outputStyle: 'compressed'
  ).on('error', sass.logError)
  .pipe gulp.dest './css'

gulp.task 'make', ->
  console.log 'Creating rsp package...'
  gulp.src [
    './**/*'
    '!./node_modules/'
    '!./node_modules/**/*'
    '!./.gitignore'
    '!./*.coffee'
    '!./*.json'
    '!./css/src/'
    '!./css/src/**/*'
    '!./*.rsp'
    '!./*.gz'
  ]
  .pipe tar 'whitegry_plus.tar'
  .pipe do gzip
  .pipe rename './whigegry_plus.rsp'
  .pipe gulp.dest '.'
  console.log 'Complete.'

gulp.task 'clean', ->
  rimraf './whitegry_plus.rsp'


gulp.task 'default', ['scss']