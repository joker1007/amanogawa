# Amanogawa
[![Gem Version](https://badge.fury.io/rb/amanogawa.svg)](http://badge.fury.io/rb/amanogawa)

Listing GitHub repositories which you starred.

![amanogawa](https://cloud.githubusercontent.com/assets/116996/6059979/231f04be-ad7b-11e4-8f75-03b7a8590a8c.gif)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amanogawa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amanogawa

## Usage

### Sync
First, sync your starred repositories.
```sh
$ amanogawa --sync -t <your auth token>

# or

$ amanogawa --sync -u <your github username> -p <your github password>

# or

$ amanogawa --sync  # use .netrc (cf. https://github.com/octokit/octokit.rb)

# => Write to ~/.cache/amanogawa.dump
```

### Simple Listing

```sh
$ amanogawa
jquense/react-widgets - set of stateless ui widgets for React
geraintluff/uri-templates - JavaScript utility for RFC 6570: URI Templates
ismasan/oat - Adapters-based API serializers with Hypermedia support for Ruby apps.
k0kubun/activerecord-precount - N+1 count query killer for ActiveRecord
ko1/pretty_backtrace - Pretty your exception backtrace.
jhudson8/react-backbone - backbone-aware mixins for react
# ...
```

### Fetch current starred and Listing

```sh
$ amanogawa --fetch -t <your auth token>
```

### Use Format

```sh
$ amanogawa -f "%f - %u"
jquense/react-widgets - set of stateless ui widgets for React
jquense/react-widgets - https://api.github.com/repos/jquense/react-widgets
geraintluff/uri-templates - https://api.github.com/repos/geraintluff/uri-templates
ismasan/oat - https://api.github.com/repos/ismasan/oat
k0kubun/activerecord-precount - https://api.github.com/repos/k0kubun/activerecord-precount
ko1/pretty_backtrace - https://api.github.com/repos/ko1/pretty_backtrace
jhudson8/react-backbone - https://api.github.com/repos/jhudson8/react-backbone
```

### Format table

```ruby
FORMAT_TABLE = {
  "%i" => "id",
  "%n" => "name",
  "%f" => "full_name",
  "%d" => "description",
  "%u" => "url",
  "%s" => "ssh_url",
  "%g" => "git_url",
  "%C" => "created_at",
  "%P" => "pushed_at",
  "%U" => "updated_at",
}
```

And, convert `%t` to Tab.


## Contributing

1. Fork it ( https://github.com/joker1007/amanogawa/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
