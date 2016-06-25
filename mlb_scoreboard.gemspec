# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "mlb_scoreboard"
  spec.version       = MLBScoreboard::VERSION
  spec.authors       = ["Steve Frost"]
  spec.email         = ["ffrostt@gmail.com"]

  spec.summary       = "Access matchups and box scores from the official MLB API"
  spec.description   = "Once installed, run bin/mlb_scoreboard to load all MLB matchups from the previous day. To see the boxscore of any matchup, type the number that corresponds to that matchup. The boxscore includes hits, runs, and errors. Type 'exit' at any time to exit the program."
  spec.homepage      = "https://github.com/steveafrost/scoreboard-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "terminal-table", "~> 1.6.0"
  spec.add_runtime_dependency "nokogiri", "~>1.6.8"
  spec.add_runtime_dependency "json", "~> 1.8.3"
end
