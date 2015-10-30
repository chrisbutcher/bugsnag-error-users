# Bugsnag Error Users (a Rake task)
[![Build Status](https://api.travis-ci.org/repositories/chrisbutcher/bugsnag-error-users.svg)](https://travis-ci.org/chrisbutcher/bugsnag-error-users)

Fetch usernames from Bugsnag error URLs. Something I'd like to see Bugsnag support via their API. Consider this gem a temporary solution.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bugsnag-error-users'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bugsnag-error-users

## Usage

Once installed, set your Bugsnag API auth token, via an initializer:
```ruby
# config/initializers/bugsnag-api.rb
Bugsnag::Api.configure do |config|
  config.auth_token = "API_TOKEN"
end
```

Then, you can run the rake task, passing in a Bugsnag error URL as a parameter:
```bash
$ rake bugsnag:error_users[https://bugsnag.com/<organization>/<project>/errors/<error_id>]
```

A unique list of user names and ids of affected users will be printed to your terminal.
Note: query params will be ignored, so you can just paste the error URL directly from your browser.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chrisbutcher/bugsnag-error-users. Contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
