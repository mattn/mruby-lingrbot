MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem "#{root}/mrbgems/mruby-sprintf"
  conf.gem "#{root}/mrbgems/mruby-print"
  conf.gem "#{root}/mrbgems/mruby-math"
  conf.gem "#{root}/mrbgems/mruby-time"
  conf.gem "#{root}/mrbgems/mruby-struct"
  conf.gem "#{root}/mrbgems/mruby-enum-ext"
  conf.gem "#{root}/mrbgems/mruby-string-ext"
  conf.gem "#{root}/mrbgems/mruby-numeric-ext"
  conf.gem "#{root}/mrbgems/mruby-array-ext"
  conf.gem "#{root}/mrbgems/mruby-hash-ext"
  conf.gem "#{root}/mrbgems/mruby-range-ext"
  conf.gem "#{root}/mrbgems/mruby-proc-ext"
  conf.gem "#{root}/mrbgems/mruby-random"
  conf.gem "#{root}/mrbgems/mruby-bin-mirb"
  conf.gem "#{root}/mrbgems/mruby-bin-mruby"

  conf.gem :git => 'https://github.com/mattn/mruby-sha1.git'
  conf.gem :git => 'https://github.com/mattn/mruby-sinatic.git'
  conf.gem :git => 'https://github.com/mattn/mruby-http.git'
  conf.gem :git => 'https://github.com/mattn/mruby-uv.git'
  conf.gem :git => 'https://github.com/mattn/mruby-json.git'
  conf.gem :git => 'https://github.com/mattn/mruby-sandbox.git'
  conf.gem :git => 'https://github.com/mattn/mruby-curl.git'
  #conf.gem :git => 'https://github.com/mattn/mruby-pcre-regexp'
  conf.gem :git => 'https://github.com/mattn/mruby-updategems'
end
