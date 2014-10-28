# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tag_monster/version'

Gem::Specification.new do |spec|
  spec.name          = "tag_monster"
  spec.version       = TagMonster::VERSION
  spec.authors       = ["Daniel Smith"]
  spec.email         = ["jellymann@gmail.com"]
  spec.summary       = %q{EAT ALL THE TAGS!}
  spec.description   = %q{Tag monster helps you extract information from enormous XML files without eating up all your memory and knocking your server over.}
  spec.homepage      = "https://github.com/jellymann/tag_monster"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
