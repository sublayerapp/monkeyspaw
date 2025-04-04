require_relative "lib/monkeyspaw/version"

Gem::Specification.new do |s|
  s.name = "monkeyspaw"
  s.version = MonkeysPaw::VERSION
  s.authors = ["Scott Werner"]
  s.email = "scott@sublayer.com"

  s.summary = "A prompt-driven web framework for Ruby - be careful what you wish for"
  s.description = "MonkeysPaw is a micro web framework that grants your wishes through AI prompts, but as with any wish-granting entity, the clarity of your request determines what you receive. Craft your prompts with care, lest your website manifest in unexpected ways."
  s.homepage = "https://github.com/sublayerapp/monkeyspaw"
  s.license = "MIT"
  s.required_ruby_version = ">= 3.0"

  s.metadata['homepage_uri'] = s.homepage

  s.files = Dir.glob(%w[lib/**/*.rb exe/monkeyspaw bin/monkeyspaw README.md LICENSE])
  s.bindir = "exe"
  s.executables = ["monkeyspaw"]
  s.require_paths = ["lib"]

  s.add_dependency "rack", "~> 3.1"
  s.add_dependency "puma", "~> 6.6"
  s.add_dependency "sublayer", "~> 0.2.8"

  s.add_development_dependency "bundler", "~> 2.6"
  s.add_development_dependency "rake", "~> 13.2"
  s.add_development_dependency "rspec", "~> 3.13"
  s.add_development_dependency "pry", "~> 0.15"
end
