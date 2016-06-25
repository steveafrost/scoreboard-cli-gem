# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "mlb_scoreboard"
  spec.version       = MLBScoreboard::VERSION
  spec.authors       = ["steveafrost"]
  spec.email         = ["ffrostt@gmail.com"]

  spec.summary       = "Access matchups and box scores from the official MLB API"
  spec.description   = "Once installed, running bin/mlbscoreboard will load all MLB matchups from the previous day. The user can then type a number that corresponds to a matchup and see more details about that matchup in a formatted table. The details include hits, runs, and errors. At any time the user can type 'exit' to exit the program."
  spec.homepage      = "https://github.com/steveafrost/scoreboard-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
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
  spec.add_runtime_dependency "terminal-table"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "json"
end
