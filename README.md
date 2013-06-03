# Interspire [![Build Status](https://travis-ci.org/Oshuma/interspire.png?branch=master)](https://travis-ci.org/Oshuma/interspire)

Ruby library for the {http://www.interspire.com/ Interspire} API ({https://www.interspire.com/support/kb/questions/1224/Email+Marketer+XML+API+Documentation pdf}).

See the {Interspire::API} class for detailed documentation.

## Installation

Add this line to your application's Gemfile:

    gem 'interspire'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install interspire

## Usage

The API class requires 3 parameters; the API URL of your Interspire installation, a username, and that username's token.
This information can be found under the 'Users & Groups' menu on your Interspire installation.
You might have to enable API access for the user.

    api_url = 'http://example.com/xml.php'
    user    = 'luser'
    token   = 'some_valid_api_token'

    api = Interspire::API.new(api_url, user, token)

    # Get an array of Interspire::ContactList objects:
    api.get_lists  # => [#<Interspire::ContactList:0x8bc6cb0 @id="7", @name="List Foo", ...

See the {Interspire::API} class for documentation on the available methods.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
