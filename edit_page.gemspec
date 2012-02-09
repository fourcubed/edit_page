$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "edit_page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "edit_page"
  s.version     = EditPage::VERSION
  s.authors     = ["Dan Olson"]
  s.email       = ["dolson@fourcubed.com"]
  s.homepage    = "https://github.com/DanOlson/edit_page"
  s.summary     = "A very basic CMS for rails."
  s.description = "EditPage is a very basic CMS for Rails. It does not handle authentication. It simply provides a CRUD interface for managing editable pages."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"
  s.add_dependency "tinymce-rails"
  s.add_dependency "remotipart"

  s.add_development_dependency "mysql2"
end
