$:.push File.expand_path("../lib", __FILE__)

require 'iye/version'

Gem::Specification.new do |s|
  s.name     = "iye"
  s.version  = Iye::VERSION
  s.date     = "2017-03-01"
  s.summary  = "I18n Yaml Editor"
  s.email    = "hv@firmafon.dk"
  s.homepage = "http://github.com/firmafon/iye"
  s.description = "I18n YAML Editor"
  s.authors  = ["Harry Vangberg"]
  s.executables << "iye"
  s.files    = [
    "README.md",
    "Rakefile",
		"iye.gemspec",
    "bin/iye",
		"lib/iye.rb",
		"lib/iye/app.rb",
		"lib/iye/category.rb",
		"lib/iye/key.rb",
		"lib/iye/store.rb",
		"lib/iye/transformation.rb",
		"lib/iye/translation.rb",
		"lib/iye/web.rb",
    "views/layout.erb",
    "views/categories.html.erb",
    "views/translations.html.erb"
  ]
  s.test_files = [
    "test/test_helper.rb",
    "test/unit/test_app.rb",
    "test/unit/test_category.rb",
    "test/unit/test_key.rb",
    "test/unit/test_store.rb",
    "test/unit/test_transformation.rb",
    "test/unit/test_translation.rb"
  ]
  s.add_dependency "cuba", ">= 3"
  s.add_dependency "tilt", ">= 1.3"
  s.add_dependency "psych", ">= 1.3.4"
end
