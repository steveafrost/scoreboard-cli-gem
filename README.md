# Scoreboard

This gem scrapes and displays yesterday's MLB matchups and their details including hits, runs, and errors.

Future version plans
1. Display scores from a day input by user.
2. Display the last 7 games of a team input by user.
3. Ability to show the league standings and drill down into division standings.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scoreboard'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scoreboard

## Usage

Once installed, running bin/scoreboard will load all MLB matchups from the previous day. The user can then type a number that corresponds to a matchup and see more details about that matchup in a formatted table. The details include hits, runs, and errors. At any time the user can type 'exit' to exit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/steveafrost/scoreboard-cli-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

