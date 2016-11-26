# FreshERD

FreshERD is a gem that outputs ER diagram by setting yaml.

The output of ER diagram is realized by wrapping call of [rails-erd](https://github.com/voormedia/rails-erd).

This gem generate a diagram based on your application's Active Record models.


## Getting started

Add this line to your application's Gemfile:

```ruby
gem 'fresh_erd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fresh_erd


## Usage

Create configuration file (Write your application's Active Record models):

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

    $ bundle exec fresh_erd --input="config/fresh_erd.yml" --output="./"


### Options

- --input : Write the path of the configuration file.
- --output : Write the path of the output ER diagram.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
