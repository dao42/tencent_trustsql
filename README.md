# TencentTrustsql

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tencent_trustsql`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tencent_trustsql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tencent_trustsql

## Usage

```ruby
    private_key = TencentTrustsql.user_private_key
    user_id = uid(database user id)
    config/initialize/tencent_trustsql.rb
    TencentTrustsql.configure do |c|
      c.mch_private_key = private_key_from_baas
      c.mch_id = mch_id
    end
    client = TencentTrustsql::Client.new private_key, user_id
    client.test_idm_user_register
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tencent_trustsql. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the TencentTrustsql project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tencent_trustsql/blob/master/CODE_OF_CONDUCT.md).


