MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem :git => 'https://github.com/mattn/mruby-sha1.git'
  conf.gem :git => 'https://github.com/mattn/mruby-sinatic.git'
  conf.gem :git => 'https://github.com/mattn/mruby-http.git'
  conf.gem :git => 'https://github.com/mattn/mruby-uv.git'
  conf.gem :git => 'https://github.com/mattn/mruby-json.git'
  conf.gem :git => 'https://github.com/mattn/mruby-sandbox.git'
end
