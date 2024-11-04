# Sink Ruby API library

The Sink Ruby library provides convenient access to the Sink REST API from any Ruby 3.0+
application.

It is generated with [Stainless](https://www.stainlessapi.com/).

## Documentation

Documentation for the most recent version of this gem can be found [on RubyDoc](https://rubydoc.info/github/stainless-sdks/sink-ruby-public).

The underlying REST API documentation can be found on [stainlessapi.com](https://stainlessapi.com).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by
adding the following to your application's `Gemfile`:

```ruby
gem "sink", git: "https://github.com/stainless-sdks/sink-ruby-public", branch: "main"
```

To fetch an initial copy of the gem:

```sh
bundle install
```

To update the version used by your application when updates are pushed to
GitHub:

```sh
bundle update sink
```

## Usage

```ruby
require "sink"

sink = Sink::Client.new(
  user_token: "My User Token", # defaults to ENV["SINK_CUSTOM_API_KEY_ENV"]
  environment: "sandbox", # defaults to "production"
  username: "Robert",
  some_number_arg_required_no_default: 0,
  some_number_arg_required_no_default_no_env: 0,
  required_arg_no_env: "<example>"
)

card = sink.cards.create(
  type: "SINGLE_USE",
  exp_month: "08",
  not_: "TEST",
  shipping_address: {
    "address1" => "180 Varick St",
    "city" => "New York",
    "country" => "USA",
    "first_name" => "Jason",
    "last_name" => "Mimosa",
    "state" => "NY",
    "postal_code" => "H0H0H0"
  }
)

puts(card.token)
```

### Errors

When the library is unable to connect to the API, or if the API returns a
non-success status code (i.e., 4xx or 5xx response), a subclass of
`Sink::HTTP::Error` will be thrown:

```ruby
begin
  sink.cards.create(type: "an_incorrect_type")
rescue Sink::HTTP::Error => e
  puts(e.code) # 400
end
```

Error codes are as followed:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >=500       | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 1 times by default, with a short
exponential backoff. Connection errors (for example, due to a network
connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors,
and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
sink = Sink::Client.new(
  max_retries: 0, # default is 1
  username: "Robert",
  some_number_arg_required_no_default: 0,
  some_number_arg_required_no_default_no_env: 0,
  required_arg_no_env: "<example>"
)

# Or, configure per-request:
sink.cards.provision_foo("my card token", digital_wallet: "GOOGLE_PAY", max_retries: 5)
```

### Timeouts

By default, requests will time out after 60 seconds.
Timeouts are applied separately to the initial connection and the overall request time,
so in some cases a request could wait 2\*timeout seconds before it fails.

You can use the `timeout` option to configure or disable this:

```ruby
# Configure the default for all requests:
sink = Sink::Client.new(
  timeout: nil, # default is 60
  username: "Robert",
  some_number_arg_required_no_default: 0,
  some_number_arg_required_no_default_no_env: 0,
  required_arg_no_env: "<example>"
)

# Or, configure per-request:
sink.cards.create(type: "DIGITAL", timeout: 5)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the
library is in initial development and has a major version of `0`, APIs may change
at any time.

## Requirements

Ruby 3.0 or higher.
