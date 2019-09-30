
require 'ecdsa'
require 'securerandom'
require 'json'
require "http"
require 'tencent_trustsql/i_o_formatter'
require 'tencent_trustsql/tool'
require 'tencent_trustsql/base_algorithm'
require 'tencent_trustsql/ecdsa_algorithm'
require 'tencent_trustsql/config'
require 'tencent_trustsql/api'
require 'tencent_trustsql/client'

module TencentTrustsql

  include Tools::KeyGenerator
  include Tools::SignGenerator
  include IOFormatter

  CURVE = ECDSA::Group::Secp256k1
end


module TencentTrustsql
  class Error < StandardError; end
end
