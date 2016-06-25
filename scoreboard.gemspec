# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scoreboard/version'

Gem::Specification.new do |spec|
  spec.name          = "scoreboard"
  spec.version       = Scoreboard::VERSION
  spec.authors       = ["steveafrost"]
  spec.email         = ["ffrostt@gmail.com"]

  spec.summary       = "A gem that scrapes and displays MLB scores from yesterday"
  spec.description   = "This gem will be an ongoing project. The first release will be able to scrape and display scores from the previous day's MLB games. The second release will be able to do that same thing but from any chosen day. Finally, the third release will be able to display the last 7 games of a selected team."
  spec.homepage      = "https://github.com/steveafrost/scoreboard-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "json"
end
