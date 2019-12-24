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
    client = TencentTrustsql::Client.new
    client.test_idm_user_register(private_key, user_id)
```
## 资产发行申请接口
```ruby
    client = TencentTrustsql::Client.new
    client.apply(options)
```
## 资产直接转让提交
```ruby
require 'tencent_trustsql'
TencentTrustsql.configure do |c|
  c.mch_private_key = ''
  c.mch_id = ''
end
client = TencentTrustsql::Client.new
# 待替换为 资产直接转让申请 返回结果
sign_str_list = [
        {
            "account": "1LpqkE1FrCrumjV4aLLn4kL5P5NbyZ1PYD",
            "sign_str": "5bdbc32055c4da8ea784783c41e9bd1b87b2280c1c714a3876e557ca0d4594fc",
            "id": 1,
        }
    ]
transaction_id = "asset_transfer_submit_1"
client.asset_transfer_submit transaction_id, sign_str_list
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tencent_trustsql. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the TencentTrustsql project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tencent_trustsql/blob/master/CODE_OF_CONDUCT.md).

### update to 0.1.5

- Attention

nested json params

```json
params = {
    chain_id: 'xxx',
    "extra_info": {
        "asset_name"=> "asset.name",
        "asset_type"=> "asset.asset_type",
        "note"=> "note"
    }
  }
```

- New Features

交易批量查询

```ruby
query_options = {
        "chain_id": 'ch_tencent_testchain',
        "page_limit": 3,
        "transaction_id": 'transaction_id_xxx',
        "page_no": 1
      }

client.trans_batch_query(node_ip, node_port, query_options)
```
