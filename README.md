# Dotgpg::Environment [![Gem Version](https://badge.fury.io/rb/dotgpg-environment.svg)](https://badge.fury.io/rb/dotgpg-environment)

This gem enables you to read and write [dotgpg](https://github.com/ConradIrwin/dotgpg)-encrypted files using an interface based on [Dotenv::Environment](https://github.com/bkeepers/dotenv/blob/master/lib/dotenv/environment.rb).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dotgpg-environment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dotgpg-environment

## Usage

```ruby
# create a new file
e = Dotgpg::Environment.new 'foo.gpg'

# set some values
e['FOO'] = "BAR"
e['BAZ'] = "BAT"

# save an encrypted version
e.write

# read in an existing file
f = Dotgpg::Environment.new 'foo.gpg'

# a call to #read is implicit if the provided file already exists
f['FOO']
# => "BAR"

# set values in the current ENV
f.apply!

# set values in the current ENV but don't overwrite existing values
f.apply
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/modosc/dotgpg-environment/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
