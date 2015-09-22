# whitegry_plus gulpfile

gulp = require 'gulp'
sass = require 'gulp-sass'

gulp.task 'scss', ->
  gulp.src './css/src/*.scss'
  .pipe sass(
    outputStyle: 'compressed'
  ).on('error', sass.logError)
  .pipe gulp.dest './css'

gulp.task 'default', ['scss']