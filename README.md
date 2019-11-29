# hunter.cr

[![Docs](https://img.shields.io/badge/docs-available-brightgreen.svg)](https://arubinofaux.github.io/hunter.cr/index.html)
[![License](https://img.shields.io/github/license/arubinofaux/hunter.cr)](https://github.com/arubinofaux/hunter.cr/blob/master/LICENSE)

A Crystal-Lang wrapper for [Hunter.io](https://hunter.io) API V2

## Installation

1. Add this to your application's `shard.yml`:

```yaml
dependencies:
  hunter:
    github: arubinofaux/hunter.cr
```

2. Run `shards install`

## Usage

#### Setup Work

```crystal
require "hunter"

client = Hunter.new(api_key)
```

#### Domain Search

```crystal
client.domain.search(domain: "intercom.io", type: "personal")
```

#### Email Finder

```crystal
client.email.finder(domain: "asana.com", first_name: "Dustin", last_name: "Moskovitz")
```

#### Email Verifier

```crystal
client.email.verifier(email: "steli@close.io")
```

#### Email Count

```crystal
client.email.count(domain: "intercom.io")
```

#### Account Information

```crystal
client.account
```

## Development

For development you will need API Credentials from [Hunter.io](https://hunter.io/api_keys)

If you found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!

## Contributing

1. Fork it (<https://github.com/arubinofaux/hunter.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [arubinofaux](https://github.com/arubinofaux) - creator and maintainer
