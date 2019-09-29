
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


  # # 产生一对公私钥, 并返回
  # def self.generate_pair_key
  #   group = ECDSA::Group::Secp256k1
  #   p private_key = 1 + SecureRandom.random_number(group.order - 1)
  # end

  # # 获取公钥
  # def self.genrate_public_key(private_key)
  #   group = ECDSA::Group::Secp256k1
  #   public_key =group.generator.multiply_by_scalar(private_key)
  #   # ECDSA::Format::PointOctetString.encode(public_key, compression: true)
  # end

  # def self.test_idm_user_register(mch_id="gb4pYTAXqzEI9TwDN5")
  #   url = "https://baas.qq.com/tpki/tpki.TpkiSrv.UserApply"
  #   p "=======用户私钥"
  #   p prv_key = private_key #TencentTrustsql.generate_pair_key #获取私钥
  #   p "=========="
  #   public_key = encoded_public_key(prv_key) #TencentTrustsql.genrate_public_key(prv_key) # 获取公钥
  #   params = {
  #       version: '1.0',
  #       sign_type: 'ECDSA',
  #       chain_id: 'ch_tencent_testchain',
  #       mch_id: mch_id,
  #       user_id: 1,
  #       user_pub_key: public_key,
  #       timestamp: Time.now.to_i
  #   }

  #   p "=============="
  #   p mch_private_key = Base64.decode64("w6GwXdO+9Q5P81A1Aoc722GoOVUUntKZGCDFF8G4eM8=").force_encoding('utf-8').unpack('H*').first.hex
  #   p "###########"
  #   p encoded_public_key("w6GwXdO+9Q5P81A1Aoc722GoOVUUntKZGCDFF8G4eM8=")

  #   query = params.sort.map do |k, v|
  #     "#{k}=#{v}" if v.to_s != ''
  #   end.compact.join('&')
  #   p query

  #   p sign = TencentTrustsql::EcdsaAlgorithm.sign(mch_private_key,query)

  #   p base64_sign = Base64.encode64("#{sign}").gsub(/[\n]/, '')
  #   params.merge!({mch_sign: base64_sign})

  #   response =HTTP.post(url, :form => params)
  #   p   response.body.to_s

  # end

end


module TencentTrustsql
  class Error < StandardError; end
end
