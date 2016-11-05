# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yada/version'

Gem::Specification.new do |spec|
  spec.name          = "yada"
  spec.version       = Yada::VERSION
  spec.authors       = ["Luca Ongaro"]
  spec.email         = ["lukeongaro@gmail.com"]

  spec.summary       = 'Nonsensical text generator'
  spec.description   = 'Train a Markov Chain model on textual content and use it to generate nonsensical text in that style'
  spec.homepage      = 'https://github.com/lucaong/yada'
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
