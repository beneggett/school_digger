[![Gem Version](https://badge.fury.io/rb/school_digger.svg)](https://badge.fury.io/rb/school_digger)
[![Build Status](https://travis-ci.com/beneggett/school_digger.svg?branch=master)](https://travis-ci.com/beneggett/school_digger)

# SchoolDigger

Fully Implements the SchoolDigger API in Ruby


## Installation

Add this line to your application's Gemfile:
```ruby
gem 'school_digger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install school_digger

Be sure to define your SchoolDigger credentials by setting up environment variables in your application appropriately. Refer to the .env.sample file for details.
```
SCHOOL_DIGGER_APP_ID = 'my-id'
SCHOOL_DIGGER_APP_KEY = 'my-key'
```

## Usage

There are 7 primary APIs that are wrapped. Below you will see basic examples of how to use them. For more information about what optional query parameters are available, please consult the [SchoolDigger API Docs](https://developer.schooldigger.com/docs#/)


#### Autocomplete
```
SchoolDigger::Api.new.autocomplete('San Die', st: "CA")
```

#### Search Districts
```
SchoolDigger::Api.new.districts('CA')
SchoolDigger::Api.new.schools('CA', q: "Los Angeles")
```

#### Find a District
```
SchoolDigger::Api.new.district("0600001")
```

#### Show District Rankings by State
```
SchoolDigger::Api.new.district_rankings('CA')
```

#### Search Schools
```
SchoolDigger::Api.new.schools('CA')
SchoolDigger::Api.new.schools('CA', q: "East High")
```

#### Find a School
```
SchoolDigger::Api.new.school("490003601072")
```

#### Show School Rankings by State
```
SchoolDigger::Api.new.school_rankings('CA')
```

## Features

Implemented APIs from [SchoolDigger API Docs](https://developer.schooldigger.com/docs#/)

(Last updated on February 28, 2019)

| API |  Description | Implemented? |
| --- | --- | --- |
| Autocomplete | Returns a simple and quick list of schools for use in a client-typed autocomplete | 👍 |
| Search Districts | Returns a list of districts | 👍 |
| Find District | Returns a detailed record for one district | 👍 |
| Search Schools | Returns a list of schools | 👍 |
| Find School | Returns a detailed record for one school | 👍 |
| School Rankings | Returns a SchoolDigger School Rankings list | 👍 |
| District Rankings | Returns a SchoolDigger School Rankings list | 👍 |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/school_digger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SchoolDigger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/school_digger/blob/master/CODE_OF_CONDUCT.md).
