# Interspire [![Build Status](https://travis-ci.org/Oshuma/interspire.png?branch=master)](https://travis-ci.org/Oshuma/interspire) [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=3N885MZB7QCY6&lc=US&item_name=Dale%20Campbell&item_number=app_config&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)

Ruby library for the [Interspire API](https://www.interspire.com/support/kb/questions/1224/Email+Marketer+XML+API+Documentation).

See the `Interspire::API` class for detailed documentation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interspire'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install interspire
```

## Usage

The API class requires 3 parameters; the API URL of your Interspire installation, a username, and that username's token.
This information can be found under the 'Users & Groups' menu on your Interspire installation.
You might have to enable API access for the user.

```ruby
api_url = 'http://example.com/xml.php'
user    = 'luser'
token   = 'some_valid_api_token'

api = Interspire::API.new(api_url, user, token)

# Get an array of Interspire::ContactList objects:
api.get_lists  # => [#<Interspire::ContactList:0x8bc6cb0 @id="7", @name="List Foo", ...
```

See the `Interspire::API` class for documentation on the available methods.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

