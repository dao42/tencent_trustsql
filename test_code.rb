require 'tencent_trustsql'
TencentTrustsql.configure do |c|
  c.mch_private_key = 'w6GwXdO+9Q5P81A1Aoc722GoOVUUntKZGCDFF8G4eM8='
  c.mch_id = 'gb4pYTAXqzEI9TwDN5'
end
client = TencentTrustsql::Client.new

#0. 申请帐户数字证书
private_key = TencentTrustsql.user_private_key
# 44103584343401227056757985801561308355979305951009337028320026252996227288905
# private_key_out = 'YYG+fyOY+JpNKjtb74alNkmfA+xgT44aF6Zj7nHqz0k='

options = {user_id: "ruby_gem_test_23",chain_id: 'ch_tencent_testchain'}
user_apply_res = client.user_apply(private_key_out,options)
# {"retcode"=>0, "retmsg"=>"SUCCESS", "id"=>520877, "version"=>"1.0", "sign_type"=>"ECDSA",
#   "user_id"=>"ruby_gem_test_23", "user_address"=>"1Nb5nGoc9he23tV6eoUtKoamkBYL5nduVX",
#   "user_pub_key"=>"Au5HDDdqAz3H9ibCoIvxJNpR1gRf6M1LslC3W2HIe35c", "from"=>"2019-09-29 18:10:56",
#   "to"=>"2022-06-25 18:10:56", "state"=>2, "issue"=>"TrustSQL_CA",
#   "issue_sign"=>"MEUCIGFMNaDWzM+YJIGODlq46fsB9cUNv60VS8PqCaIoKlpQAiEAwKcf/uI3BUxExvSBj6/wcLygcD66/rBmQXjfQbo0ByQ="}

#1 发行申请
options = {chain_id: 'ch_tencent_testchain', owner_uid: 'ruby_gem_test_23',
  owner_account: '1Nb5nGoc9he23tV6eoUtKoamkBYL5nduVX',
  owner_account_pubkey: 'YYG+fyOY+JpNKjtb74alNkmfA+xgT44aF6Zj7nHqz0k=',
  asset_type: 7,
  amount: 20000,
  unit: 'fen',
  }
client.asset_apply('123.207.249.116', '15910', options)
# {"version"=>"2.0", "sign_type"=>"ECDSA", "mch_id"=>"trust_mch",
#   "mch_sign"=>"MEYCIQDhEdclVkHsuVK7USMmAJd4TK7Kl1zZcykHN67QwU5siQIhANmrtDIPxyQ6IsYWjLlXSbqVQjR4pyWhIA+SJ/4q26wa",
#   "chain_id"=>"ch_tencent_testchain", "retcode"=>0, "retmsg"=>"SUCCESS",
#   "transaction_id"=>"201909290007286647", "asset_id"=>"26aMh7YJAXkeupRZ7NSX14GjeWzE5XtAuT5nAGV8e6rpbyP",
#   "sign_str_list"=>[{"id"=>1, "account"=>"1Nb5nGoc9he23tV6eoUtKoamkBYL5nduVX",
#     "sign_str"=>"51bcff5c25e785d0c8af93b6c1a3b0d8826d89b3acc2e9156077b7196345aae8"}],
#     "mch_pubkey"=>""}

#2. 发行提交
options = {
  sign_list: [{id: 1, account: "1Nb5nGoc9he23tV6eoUtKoamkBYL5nduVX", sign_str: "51bcff5c25e785d0c8af93b6c1a3b0d8826d89b3acc2e9156077b7196345aae8"}],
  chain_id: "ch_tencent_testchain",
  asset_type: 7,
  transaction_id: "201909290007286647",
  user_private_key: 44103584343401227056757985801561308355979305951009337028320026252996227288905

}
client.commit('123.207.249.116', '15910', options)