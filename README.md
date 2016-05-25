# Fresh::Erd

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fresh/erd`. To experiment with that code, run `bin/console` for an interactive prompt.

## Preview

TBD(img)

## Requirements

Ruby 2.0.0+
ActiveRecord 3.x
rails-erd 1.1.0+


## Getting started

Add this line to your application's Gemfile:

```ruby
gem 'fresh-erd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fresh_erd

## Usage

Create configuration file for 'fresh_erd':

```yml
diagrams:
  tweet:
    - User
    - Micropost
  all:
    - User
    - Micropost
    - Relationship
```

And then execute:

    $ bundle exec fresh_erd

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/muramurasan/fresh-erd.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
