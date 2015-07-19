# StubConstant

Here's a gem I'm extracting from my friend Máximo's gem [Journeyman][journeyman]
mostly to understand better how it works and also because I'd like to use it in
my gems.

[journeyman]: https://github.com/ElMassimo/journeyman

When practicing TDD, you may want to test your code in extreme isolation. The
idea is that any given test is only exercising the object "under test", and any
other code should not be included unless it's strictly necessary to do so. The
other code should also be tested, separately, in isolation.

## Installation

Add this line to your application's Gemfile (probably in the test section):

```ruby
gem 'stub_constant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stub_constant

## Usage

Note: this is "optimstic" because I haven't implemented it yet. But I think it
will look like this:

```ruby
Cloneable # error
StubConstant.module(:Cloneable)
Cloneable # no error
Cloneable.class #=> Module
```

```ruby
Dog # error
StubConstant.klass(:Dog)
Dog # no error
Dog.class #=> Class
```

```ruby
LIMIT # error
StubConstant.value(:LIMIT, 4)
LIMIT # no error
LIMIT.class #=> Fixnum
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/rake` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bin/rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bin/rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/maxjacobson/stub_constant. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

