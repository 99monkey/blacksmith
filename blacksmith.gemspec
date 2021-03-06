require File.expand_path("../lib/version.rb", __FILE__)
Gem::Specification.new do |s|
  s.name        = 'blacksmith-js'
  s.version     =  Blacksmith::VERSION
  s.date        = '2012-10-14'
  s.summary     = "build js library, extensions with blacksmith"
  s.description = "build js library, extensions with blacksmith"
  s.authors     = ["Eugene Varlamov"]
  s.email       = 'varlamoved@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://varlamoved.ru/blacksmith'
  s.executables << 'blacksmith'
  s.add_dependency("listen", ["~> 0.5.3"])
  s.add_dependency("uglifier", ["~> 1.3.0"])
  s.add_dependency("gzip")
  s.add_dependency("jshintrb")
end

